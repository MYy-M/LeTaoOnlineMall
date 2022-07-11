package com.letao.mall.controller.Consumer;


import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.service.ConsumerService;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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
@RequestMapping("/mall/consumer/user")
public class ConsumerController {

    @Autowired
    private ConsumerService consumerService;

    @GetMapping("/currentUser")
    public Result getCurrentUser(@RequestHeader("Authorization")String token){
        return consumerService.findConsumerByToken(token);
    }

    @GetMapping("/modify")
    public int modifyUserInfo(){
        return 0;
    }

}

