package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.Cart;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.mapper.CartMapper;
import com.letao.mall.service.CartService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-23
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

}
