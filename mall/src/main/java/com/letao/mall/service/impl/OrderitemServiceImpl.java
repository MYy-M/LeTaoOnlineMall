package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.dao.mapper.OrderitemMapper;
import com.letao.mall.service.OrderitemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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
public class OrderitemServiceImpl extends ServiceImpl<OrderitemMapper, Orderitem> implements OrderitemService {

    @Autowired
    private OrderitemMapper itemMapper;
    public int deleteItems(long id){
        QueryWrapper<Orderitem> wrapper=new QueryWrapper<>();
        wrapper.eq("order_id",id);
        return itemMapper.delete(wrapper);
    }

    public Page getOrderItemListById(long id, int current){
        Page<Orderitem> page=new Page<>(current,100);
        QueryWrapper<Orderitem> wrapper=new QueryWrapper<>();
        wrapper.eq("order_id",id);
        return itemMapper.selectPage(page,wrapper);
    }
}
