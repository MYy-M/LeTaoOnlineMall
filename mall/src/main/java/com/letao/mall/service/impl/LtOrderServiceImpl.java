package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.dao.mapper.LtOrderMapper;
import com.letao.mall.service.LtOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.SearchOrderParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

    @Override
    public Result getStoreListByCondition(SearchOrderParam searchOrderParam) {
        Long orderId=searchOrderParam.getOrderID();
        Integer state = searchOrderParam.getState();
        Date date = searchOrderParam.getDate();
        Page<LtOrder> orderPage = new Page<>(searchOrderParam.getPagenum(), searchOrderParam.getPagesize());
        LambdaQueryWrapper<LtOrder> queryWrapper = new LambdaQueryWrapper<>();
        if(orderId!=null){
            queryWrapper.like(LtOrder::getOrderId,orderId);
        }
        if(state!=null){
            queryWrapper.eq(LtOrder::getOrderState,state);
        }
        if(date!=null) {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            String time=sdf.format(date);
            queryWrapper.eq(LtOrder::getTime,time);
        }
        return Result.success(orderMapper.selectPage(orderPage, queryWrapper));

    }

    public List<Orderitem> getOrderList(@Param("order_id") long order_id){
        return orderMapper.getOrderList(order_id);
    }

    public Date getTime(long id){
        return orderMapper.getTime(id);
    }

    public List<Long> getOrderId(@Param("uid") long uid){
        return orderMapper.getOrderId(uid);
    }

    @Override
    public BigDecimal getTotal(long orderId) {
        return orderMapper.getTotal(orderId);
    }


}
