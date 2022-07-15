package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.service.ConsumerService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.LoginParam;
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
@RequestMapping("/mall/consumer")
@CrossOrigin
public class ConsumerController {

    @Autowired
    private ConsumerService consumerService;
    /**
     * 根据token获取当前消费者信息
     * @param token
     * @return
     */
    @GetMapping("/currentUser")
    public Result getCurrentUser(@RequestHeader("Authorization")String token){
        return consumerService.findConsumerByToken(token);
    }

    @PostMapping("/modify")
    public Result modifyUserInfo(@RequestBody Consumer consumer){
        LambdaUpdateWrapper<Consumer> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(Consumer::getUid,consumer.getUid());
        if(consumerService.update(consumer,updateWrapper)){
            return Result.success(null);
        }else{
            return Result.fail(ErrorCode.MODIFY_ERROR.getCode(),ErrorCode.MODIFY_ERROR.getMsg());
        }
    }

}

