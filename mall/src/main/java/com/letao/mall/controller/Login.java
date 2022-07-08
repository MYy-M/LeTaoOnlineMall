package com.letao.mall.controller;


import com.letao.mall.dao.entity.Admin;
import com.letao.mall.service.AdminService;
import com.letao.mall.service.LoginService;
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
@RequestMapping("/mall")
public class Login {
    @Autowired
    private LoginService loginService;

    @PostMapping("/login")
    public String login(Long id,String passWord){
        return loginService.login(id,passWord);
    }


    @GetMapping("/logout")
    public boolean getCurrentUser(@RequestHeader("Authorization")String token){
        return loginService.logout(token);
    }
}

