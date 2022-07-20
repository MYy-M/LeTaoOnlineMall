package com.letao.mall.controller.Consumer;


import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.service.LtOrderService;
import com.letao.mall.service.OrderAddressService;
import com.letao.mall.service.OrderitemService;
import com.letao.mall.util.DelayMessageProducer;
import com.letao.mall.vo.CartVo;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.OrderParam;
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
import java.util.List;

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
    public Result submitOrder(OrderParam orderParam){
        if(orderParam==null){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }else{
            Long uid = orderParam.getUid();
            Long addressId = orderParam.getAddressId();
            BigDecimal totalPrice = orderParam.getTotalPrice();
            List<CartVo> cartVolist = orderParam.getList();
            if(uid!=null&&addressId!=null&&totalPrice!=null&&cartVolist!=null&&cartVolist.size()!=0){
                LtOrder ltOrder=new LtOrder();
                ltOrder.setUid(uid);
                ltOrder.setAddress(orderAddressService.getById(addressId).getAddress());
                ltOrder.setPrice(totalPrice);
                //直接是已付款状态
                ltOrder.setOrderState(1);
                ltOrder.setTime(new Date());
                Long orderId;
                if(orderService.save(ltOrder)){
                    orderId =ltOrder.getOrderId();
                }else{
                    return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
                }
                List<Orderitem> list = new ArrayList<>();
                for (int i = 0; i < cartVolist.size(); i++) {
                    CartVo cartVo = cartVolist.get(i);
                    Orderitem orderItem = new Orderitem();
                    orderItem.setCname(cartVo.getCname());
                    orderItem.setCid(cartVo.getCid());
                    orderItem.setCnum(cartVo.getNum());
                    orderItem.setCpicture(cartVo.getCPicture());
                    orderItem.setCprice(cartVo.getPrice());
                    orderItem.setCsId(cartVo.getCsId());
                    orderItem.setOrderId(orderId);

                    list.add(orderItem);
                }

                if(itemService.saveBatch(list)){
                    //将订单id传给消费者
                    //延迟付款时间30s
                    producer.send(Long.toString(orderId),30*1000);
                }else{
                    orderService.deleteOrder(orderId);
                    return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
                }
            }
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

