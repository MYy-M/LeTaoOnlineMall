package com.letao.mall.controller.Consumer;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.OrderParam;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/lt-order")
@CrossOrigin
public class CLtOrderController {
    @GetMapping("/payOrder")
    public Result payOrder(BigDecimal price){
        if(true){
            return Result.success(price);
        }else {
            return Result.fail(ErrorCode.PAY_FAILED.getCode(),ErrorCode.PAY_FAILED.getMsg());
        }
    }

    @RequestMapping("/submitOrder")
    public Boolean submitOrder(String orderParam){
        JSONObject jsonObject= JSON.parseObject(orderParam);

        LtOrder ltOrder=jsonObject.getObject("ltOrder",LtOrder.class);
        JSONArray jsonArray=jsonObject.getJSONArray("itemList");
        ArrayList<Orderitem> itemList=new ArrayList<>();
        for(int i=0;i<jsonArray.size();i++){
            itemList.add(jsonArray.getObject(i,Orderitem.class));
        }
        System.out.println(ltOrder);
        System.out.println("-----");
        System.out.println(itemList);
        return true;
    }


    @GetMapping("/finishOrder")
    public int finishOrder(){
        return 0;
    }

    @GetMapping("/deleteOrder")
    public int deleteOrder(){
        return 0;
    }

}

