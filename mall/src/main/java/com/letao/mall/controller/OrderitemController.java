package com.letao.mall.controller;


import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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

    @GetMapping("/get")
    public ArrayList<String> getOrderItemListById(){
        return new ArrayList<>();
    }

    //删除跟某个订单表相关的所有订单明细
    public boolean deleteOrderItemById(){
        return true;
    }

}

