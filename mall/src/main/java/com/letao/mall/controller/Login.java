package com.letao.mall.controller;


import com.letao.mall.service.AdminService;
import com.letao.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/mall")
public class Login {
    @Autowired
    private AdminService adminService;
    private UserService userService;

    @PostMapping("/login")
    public boolean login(){
        return true;
    }

    @GetMapping("/logout")
    public boolean logout(){
        return true;
    }
}

