package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Store;
import com.letao.mall.dao.mapper.LtOrderMapper;
import com.letao.mall.service.LtOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.SearchOrderParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import java.util.Date;

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

    public Page getOrderListById(long id, int current){
        Page<LtOrder> page=new Page<>(current,10);
        QueryWrapper<LtOrder> wrapper=new QueryWrapper<>();
        wrapper.eq("uid",id);
        return orderMapper.selectPage(page,wrapper);
    }

    public Page getOrderList(int current){
        Page<LtOrder> page=new Page<>(current,10);
        QueryWrapper<LtOrder> wrapper=new QueryWrapper<>();
        return orderMapper.selectPage(page,wrapper);
    }

    @Override
    public Result getStoreListByCondition(SearchOrderParam searchOrderParamm) {
        Long orderId=searchOrderParamm.getOrderID();
        int state = searchOrderParamm.getState();
        Date date = searchOrderParamm.getDate();
        Page<LtOrder> orderPage = new Page<>(searchOrderParamm.getPagenum(), searchOrderParamm.getPagesize());
        LambdaQueryWrapper<LtOrder> queryWrapper = new LambdaQueryWrapper<>();
        if(orderId!=null){
            queryWrapper.like(LtOrder::getOrderId,orderId);
        }
        if(state>=0&&state<=4){
            queryWrapper.like(LtOrder::getOrderState,state);
        }
        if(date!=null) {
            queryWrapper.like(LtOrder::getTime, date);
        }
        if(orderId!=null&&!(state>=0&&state<=4)&&date==null){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }
        return Result.success(orderMapper.selectPage(orderPage, queryWrapper));

    }

}
