package com.letao.mall.controller;


import com.letao.mall.service.OrderitemService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CategoryPageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping("/mall/orderitem")
@CrossOrigin
public class OrderitemController {

    @Autowired
    private OrderitemService itemService;

    //根据订单id查找对应的订单详细
    @PostMapping("/get")
    public Result getOrderItemListById(@RequestBody CategoryPageParam param){
        long id=param.getId();
        int current= param.getCurrent();
        return Result.success(itemService.getOrderItemListById(id,current));
    }

    //删除跟某个订单表相关的所有订单明细
    public Boolean deleteOrderItemById(long id){
        if(itemService.deleteItems(id)>0){
            return true;
        }else{
            return false;
        }
    }


}

