package com.letao.mall.controller.admin;

import com.letao.mall.service.LtOrderService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/lt-order")
@CrossOrigin
public class ALtOrderController {

    @Autowired
    private LtOrderService orderService;

    /**
     * 发货
     * @return
     */
    @GetMapping("/delivery")
    public Result delivery(long id){
        if(orderService.getOrderState(id)==1){
            if(orderService.modifyOrderState(id,2)>0){
                return Result.success(true);
            }
        }
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
    }
}
