package com.letao.mall.controller.Consumer;


import com.letao.mall.service.ConsumerSSOService;
import com.letao.mall.service.ConsumerService;
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
public class ConsumerSSOController {

    @Autowired
    private ConsumerSSOService consumerSSOService;


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
