package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.dao.entity.OrderAddress;
import com.letao.mall.service.OrderAddressService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CartSetNumParam;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/address")
@CrossOrigin
public class OrderAddressController {

   @Autowired
    private OrderAddressService orderAddressService;

    @PostMapping("/showAddress")
    public Result showAddress(Long uid){
        if(uid==null){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }else{
            return Result.success(orderAddressService.list(new LambdaUpdateWrapper<OrderAddress>().eq(OrderAddress::getUid,uid)));
        }
    }

    @PostMapping("/addAddress")
    public Result addAddress(@RequestBody OrderAddress orderAddress) {
        return Result.success(orderAddressService.save(orderAddress));
    }
}

