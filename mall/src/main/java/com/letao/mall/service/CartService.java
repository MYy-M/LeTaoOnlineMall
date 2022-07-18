package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;

import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface CartService extends IService<Cart> {

    /**
     * 添加商品到购物车
     * @param cart
     * @return
     */
    Result addToCart(Cart cart) throws IOException;


    /**
     * 查询个人的购物车
     * @param pageParam
     * @return
     */
    Result showCart(PageParam pageParam) throws IOException;
}
