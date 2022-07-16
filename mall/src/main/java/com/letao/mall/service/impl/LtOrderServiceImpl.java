package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.mapper.LtOrderMapper;
import com.letao.mall.service.LtOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.ibatis.annotations.Param;
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
public class LtOrderServiceImpl extends ServiceImpl<LtOrderMapper, LtOrder> implements LtOrderService {

    @Autowired
    private LtOrderMapper orderMapper;

    public int getOrderState(@Param("oid") long id){
        return orderMapper.getOrderState(id);
    }

    public Boolean deleteOrder(@Param("oid") long id){
        return orderMapper.deleteOrder(id);
    }

    public int modifyOrderState(@Param("id") long id,@Param("state") int state){
        return orderMapper.modifyOrderState(id,state);
    }

    public Page getOrderListById(long id, int current,int pageSize){
        Page<LtOrder> page=new Page<>(current,pageSize);
        QueryWrapper<LtOrder> wrapper=new QueryWrapper<>();
        wrapper.eq("uid",id);
        return orderMapper.selectPage(page,wrapper);
    }

    public Page getOrderList(int current,int pageSize){
        Page<LtOrder> page=new Page<>(current,pageSize);
        QueryWrapper<LtOrder> wrapper=new QueryWrapper<>();
        return orderMapper.selectPage(page,wrapper);
    }

}
