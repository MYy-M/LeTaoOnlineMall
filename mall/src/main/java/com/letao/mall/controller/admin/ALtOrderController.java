package com.letao.mall.controller.admin;

import com.letao.mall.service.LtOrderService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.SearchOrderParam;
import com.letao.mall.vo.param.StoreParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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


    /**
     * 根据条件查询数据
     * @param searchOrderParam
     * @return
     */
    @PostMapping("/getOrderListByC")
    public Result getOrderListByCondition(@RequestBody SearchOrderParam searchOrderParam) {
        return orderService.getStoreListByCondition(searchOrderParam);
    }
}
