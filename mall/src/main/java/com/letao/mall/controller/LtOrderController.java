package com.letao.mall.controller;


import com.letao.mall.service.LtOrderService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CategoryPageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

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
            return Result.success(orderService.getOrderListById(id,current));
        }
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
    }
    //获取所有订单
    @PostMapping("/getlist")
    public Result getOrderList(int current){
        return Result.success(orderService.getOrderList(current));
    }


}

