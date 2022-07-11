package com.letao.mall.controller.admin;

import com.letao.mall.service.AdminSSOService;
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
@RequestMapping("/mall/admin")
@CrossOrigin
public class AdminSSOController {

    @Autowired
    private AdminSSOService adminSSOService;

    /**
     * 管理员登录
     * @param loginParam
     * @return
     */
    @PostMapping("/login")
    public Result login(@RequestBody LoginParam loginParam){
        return adminSSOService.login(loginParam);
    }

    /**
     * 管理员注册
     * @param loginParam
     * @return
     */

    @PostMapping("/register")
    public Result register(@RequestBody LoginParam loginParam){
        return adminSSOService.register(loginParam);
    }


    /**
     * 管理员登出
     * @param token
     * @return
     */

    @GetMapping("/logout")
    public Result logout(@RequestHeader("Authorization")String token){
        return adminSSOService.logout(token);
    }}
