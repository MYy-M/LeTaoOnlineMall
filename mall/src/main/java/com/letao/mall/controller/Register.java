package com.letao.mall.controller;


import com.letao.mall.dao.entity.Admin;
import com.letao.mall.service.LoginService;
import com.letao.mall.service.RegisterService;
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
@RequestMapping("/mall/register")
@CrossOrigin
public class Register {

    @Autowired
    private RegisterService registerService;

    @PostMapping
    public Result register(@RequestBody LoginParam loginParam){
        return registerService.register(loginParam);
    }
}

