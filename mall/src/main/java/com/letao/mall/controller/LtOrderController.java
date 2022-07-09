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
@RequestMapping("/mall/lt-order")
@CrossOrigin
public class LtOrderController {

    @GetMapping("/modify")
    public int modifyOrderState(){
        return 0;
    }

    @GetMapping("/get")
    public ArrayList<String> getOrderListById(){
        return new ArrayList<>();
    }

    @GetMapping("/getlist")
    public ArrayList<String> getOrderList(){
        return new ArrayList<>();
    }

}

