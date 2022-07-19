package com.letao.mall.controller;


import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.service.LtOrderService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CategoryPageParam;
import com.letao.mall.vo.param.OrderParam;
import com.letao.mall.vo.param.ProductParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/lt-order")
@CrossOrigin
public class LtOrderController {

    @Autowired
    private LtOrderService orderService;

    /**
     * 获取用户对应订单
     * @param param
     * @return
     */
    @PostMapping("/get")
    public Result getOrderListById(@RequestBody CategoryPageParam param){
        long id=param.getId();
        int current=param.getCurrent();
        if(id!=0&&current!=0){
            return Result.success(orderService.getOrderListById(id,current,param.getPageSize()));
        }
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
    }
    //获取所有订单

    /**
     * 根据用户id获取订单
     * @param uid
     * @return
     */
    @PostMapping("/getlist")
    public Result getOrderList(long uid){
        List<Orderitem> list=orderService.getOrderList(uid);
        List<OrderParam> params=new ArrayList<>();
        for(Orderitem o:list){
            OrderParam param=new OrderParam();

            param.setOrder_id(o.getOrderId());
            param.setOrder_time(orderService.getTime(o.getOrderId()));
            param.setProduct_id(o.getCsId());
            param.setProduct_num(o.getCnum());
            param.setProduct_picture(o.getCpicture());
            param.setId(o.getId());
            param.setProduct_name(o.getCname());
            param.setUser_id(uid);

            params.add(param);
        }
        return Result.success(params);
    }


}

