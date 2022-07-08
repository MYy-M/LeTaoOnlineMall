package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;

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
    boolean addToCart(Cart cart);

    /**
     * 查询个人的购物车
     * @param uid
     * @param currentPageNum
     * @return
     */
    Page showCart(Long uid, int currentPageNum);
}
