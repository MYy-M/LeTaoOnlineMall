package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.Order;
import com.letao.mall.dao.mapper.OrderMapper;
import com.letao.mall.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
