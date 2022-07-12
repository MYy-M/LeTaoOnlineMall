package com.letao.mall.controller.Consumer;


import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/lt-order")
@CrossOrigin
public class CLtOrderController {
    @GetMapping("/payOrder")
    public Result payOrder(BigDecimal price){
        if(true){
            return Result.success(price);
        }else {
            return Result.fail(ErrorCode.PAY_FAILED.getCode(),ErrorCode.PAY_FAILED.getMsg());
        }
    }

    @GetMapping("/addOrder")
    public Result addOrder(){

        return null;
    }


    @GetMapping("/finishOrder")
    public int finishOrder(){
        return 0;
    }

    @GetMapping("/deleteOrder")
    public int deleteOrder(){
        return 0;
    }

}

