package com.letao.mall.controller.Consumer;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/cart")
public class CartController {

    @GetMapping("/addcommodity")
    public int addCommodity(){
        return 0;
    }

    @GetMapping("/deletecommodity")
    public int deleteCommodity(){
        return 0;
    }

    @GetMapping("/addNum")
    public int addNum(){
        return 0;
    }

    @GetMapping("/reduceNum")
    public int reduceNum(){
        return 0;
    }

    @GetMapping("/setNum")
    public int setNum(){
        return 0;
    }

    @GetMapping("/setCart")
    public int showCart(){
        return 0;
    }


}

