package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.service.ConsumerSSOService;
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
public class ConsumerSSOController {

    @Autowired
    private ConsumerSSOService consumerSSOService;

    @Autowired
    private ConsumerService consumerService;
    /**
     * 消费者登录
     * @param loginParam
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginParam loginParam){
        return consumerSSOService.login(loginParam);
    }


    /**
     * 验证用户名是否存在
     * @param username
     * @return
     */
    @PostMapping("/findUserName")
    public Result findUserName(String username){
        System.out.println(username);
        LambdaQueryWrapper<Consumer> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Consumer::getUname,username);
        queryWrapper.last("limit 1");
        Consumer consumer = consumerService.getOne(queryWrapper);
        if (consumer != null) {
            return Result.fail(ErrorCode.ACCOUNT_EXIST.getCode(), ErrorCode.ACCOUNT_EXIST.getMsg());
        }
        return Result.success(null);
    }

    /**
     * 消费者注册
     * @param loginParam
     * @return
     */

    @PostMapping("/register")
    public Result register(@RequestBody LoginParam loginParam){
        return consumerSSOService.register(loginParam);
    }


    /**
     * 消费者登出
     * @param token
     * @return
     */

    @GetMapping("/logout")
    public Result logout(@RequestHeader("Authorization")String token){
        return consumerSSOService.logout(token);
    }
}
