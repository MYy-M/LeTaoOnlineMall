package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.dao.mapper.CartMapper;
import com.letao.mall.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
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
    public Result addToCart(Cart cart) {
        Long uid = cart.getUid();
        Long csId = cart.getCsId();//此处应该是规格表的id
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,uid).eq(Cart::getCsId,csId);
        Cart c = this.getOne(queryWrapper);
        if(c==null){
            if(this.save(cart)){
                return Result.success(this.getOne(queryWrapper).getCartId()+"");
            }
        }else{
            LambdaUpdateWrapper<Cart> updateWrapper=new LambdaUpdateWrapper<>();
            updateWrapper.eq(Cart::getCartId,c.getCartId());
            updateWrapper.set(Cart::getCartNum,c.getCartNum()+1);
            if(this.update(updateWrapper)) {
                return Result.success(c.getCartId()+"");
            }
        }
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
    }

    @Override
    public Result showCart(PageParam pageParam) {
        Page<Cart> cartPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,pageParam.getUid());
        return Result.success(this.page(cartPage,queryWrapper));
    }
}
