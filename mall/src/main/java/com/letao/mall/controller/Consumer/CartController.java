package com.letao.mall.controller.Consumer;


import com.letao.mall.dao.entity.Cart;
import com.letao.mall.service.CartService;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @Autowired
    private CartService cartService;

    @GetMapping("/addCommodity")
    public boolean addCommodity(@RequestBody Cart cart){
        return cartService.save(cart);
    }

    @GetMapping("/deleteCommodity")
    public boolean deleteCommodity(Long id){
        return cartService.removeById(id);
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

