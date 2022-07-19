package com.letao.mall.controller.Consumer;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.service.LtOrderService;
import com.letao.mall.service.OrderAddressService;
import com.letao.mall.service.OrderitemService;
import com.letao.mall.util.DelayMessageProducer;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.ProductParam;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

import static com.letao.mall.config.RabbitMqConfig.DELAY_QUEUE_NAME;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Slf4j
@RestController
@RequestMapping("/mall/consumer/lt-order")
@CrossOrigin
public class CLtOrderController {

    @Autowired
    private LtOrderService orderService;
    @Autowired
    private OrderitemService itemService;
    @Resource
    private DelayMessageProducer producer;
    @Autowired
    private OrderAddressService orderAddressService;

    @GetMapping("/payOrder")
    public Result payOrder(long id){
        if(orderService.getOrderState(id)==0){
            if(orderService.modifyOrderState(id,1)>0){
                return Result.success(true);
            }else{
                return Result.fail(ErrorCode.PAY_FAILED.getCode(),ErrorCode.PAY_FAILED.getMsg());
            }
        }
        return Result.fail(ErrorCode.PAID.getCode(),ErrorCode.PAID.getMsg());
    }

    @PostMapping("/finishOrder")
    public Result finishOrder(long id){
        if(orderService.getOrderState(id)==2){
            if(orderService.modifyOrderState(id,3)>0){
                return Result.success(true);
            }
        }
        //只传参数有误，这里不太可能出错
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());

    }

    @PostMapping("/deleteOrder")
    public Result deleteOrder(long id){
        if(itemService.deleteItems(id)>0){
            if(orderService.deleteOrder(id)){
                return Result.success(true);
            }
        }
        return Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }

    @RequestMapping("/submitOrder")
    public Result submitOrder(String orderParam){
        JSONObject jsonObject= JSON.parseObject(orderParam);

        LtOrder ltOrder=new LtOrder();
        ltOrder.setUid(Long.parseLong(jsonObject.getString("uid")));
        long addressId=Long.valueOf(jsonObject.getString("addressId"));
        ltOrder.setAddress(orderAddressService.getAddress(addressId));
        ltOrder.setPrice(jsonObject.getBigDecimal("totalPrice"));

        //直接是已付款状态
        ltOrder.setOrderState(1);
        ltOrder.setTime(new Date());

        long oid=0;

        if(orderService.save(ltOrder)){
            oid=ltOrder.getOrderId();
        }else{
            return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        }

        JSONArray jsonArray=jsonObject.getJSONArray("products");
        ArrayList<Orderitem> orderItemList=new ArrayList<>();

        for(int i=0;i<jsonArray.size();i++){
            ProductParam product=jsonArray.getObject(i,ProductParam.class);
            if(product.getCid()==null){
                return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
            }
            Orderitem orderItem=new Orderitem();
            orderItem.setCname(product.getCname());
            orderItem.setCid(product.getCid());
            orderItem.setCnum(product.getNum());
            orderItem.setCpicture(product.getCpicture());
            orderItem.setCprice(product.getPrice());
            orderItem.setCsId(product.getCsId());
            orderItem.setOrderId(oid);

            orderItemList.add(orderItem);
        }

        if(itemService.saveBatch(orderItemList)){
            //将订单id传给消费者
            //延迟付款时间30s
            producer.send(Long.toString(oid),30*1000);
        }else{
            orderService.deleteOrder(oid);
            return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        }
        return Result.success(true);
    }

    @RabbitListener(queues = DELAY_QUEUE_NAME)
    public void receiveA(Message message, Channel channel) throws IOException {
        String msg=new String(message.getBody());
        long id=Long.valueOf(msg);
        if(orderService.getOrderState(id)>0){
            log.info("当前时间：{} 消费者完成 {}", LocalDateTime.now(),msg);
        }else{
            itemService.deleteItems(id);
            orderService.deleteOrder(id);
            log.info("当前时间：{} 消费者完成 {}",LocalDateTime.now(),msg);
        }
        /*channel.basicAck(message.getMessageProperties().getDeliveryTag(),false);*/

    }

}

