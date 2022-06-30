package com.letao.mall.controller;


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
@RequestMapping("/mall/commodity")
public class CommodityController {

    @GetMapping("/getlist")
    public ArrayList<String> showCommodityListByxxx(){
        return new ArrayList<>();
    }


    @GetMapping("/getDetail")
    public ArrayList<String> getCommodityDetail(){
        return new ArrayList<>();
    }

}

