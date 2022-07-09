package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.service.CartService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CartSetNumParam;
import com.letao.mall.vo.param.PageParam;
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
@CrossOrigin
public class CartController {

    @Autowired
    private CartService cartService;

    @PostMapping("/addCommodity")
    public Result addCommodity(@RequestBody Cart cart) {
        System.out.println(cartService.addToCart(cart).getData());
        return cartService.addToCart(cart);
    }

    @GetMapping("/deleteCommodity")
    public Result deleteCommodity(Long id) {
        return Result.success(cartService.removeById(id));
    }

    @GetMapping("/addNum")
    public Result addNum(Long id) {
        Cart cart = cartService.getById(id);
        return Result.success(cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, id).set(Cart::getCartNum, cart.getCartNum() + 1)));
    }

    @GetMapping("/reduceNum")
    public Result reduceNum(Long id) {
        Cart cart = cartService.getById(id);
        return Result.success(cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, id).set(Cart::getCartNum, cart.getCartNum() - 1)));
    }

    @PostMapping("/setNum")
    public Result setNum(@RequestBody CartSetNumParam cartSetNumParam) {
        return Result.success(cartService.update(new LambdaUpdateWrapper<Cart>().eq(Cart::getCartId, cartSetNumParam.getCartId()).set(Cart::getCartNum,cartSetNumParam.getNum())));
    }

    @PostMapping("/showCart")
    public Result showCart(@RequestBody PageParam pageParam) {
        return cartService.showCart(pageParam);
    }


}

