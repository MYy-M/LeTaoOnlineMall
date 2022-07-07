package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.dao.entity.Comment;
import com.letao.mall.dao.mapper.CartMapper;
import com.letao.mall.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

    @Override
    public boolean addToCart(Cart cart) {
        Long uid = cart.getUid();
        Long csId = cart.getCsId();//此处应该是规格表的id
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,uid).eq(Cart::getCsId,csId);
        Cart c = this.getOne(queryWrapper);
        if(c==null){
            return this.save(cart);
        }else{
            LambdaUpdateWrapper<Cart> updateWrapper=new LambdaUpdateWrapper<>();
            updateWrapper.eq(Cart::getCartId,c.getCartId());
            updateWrapper.set(Cart::getCartNum,c.getCartNum()+1);
            return this.update(updateWrapper);
        }
    }

    @Override
    public Page showCart(Long uid,int currentPageNum) {
        Page<Cart> cartPage = new Page<>(currentPageNum,4);
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,uid);
        return this.page(cartPage,queryWrapper);
    }
}
