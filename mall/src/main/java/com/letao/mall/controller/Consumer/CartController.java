package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 前端控制器
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

    @PostMapping("/addCommodity")
    public boolean addCommodity(@RequestBody Cart cart) {
        return cartService.addToCart(cart);
    }

    @GetMapping("/deleteCommodity")
    public boolean deleteCommodity(Long id) {
        return cartService.removeById(id);
    }

    @GetMapping("/addNum")
    public boolean addNum(Long id) {
        Cart cart = cartService.getById(id);
        return cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, id).set(Cart::getCartNum, cart.getCartNum() + 1));
    }

    @GetMapping("/reduceNum")
    public boolean reduceNum(Long id) {
        Cart cart = cartService.getById(id);
        return cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, id).set(Cart::getCartNum, cart.getCartNum() - 1));
    }

    @GetMapping("/setNum")
    public boolean setNum(Long id, int num) {
        return cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, id).set(Cart::getCartNum,num));
    }

    @GetMapping("/showCart")
    public Page showCart(Long uid,int currentPageNum) {
        return cartService.showCart(uid,currentPageNum);
    }


}

