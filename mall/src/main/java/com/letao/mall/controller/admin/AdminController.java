package com.letao.mall.controller.admin;


import com.alibaba.fastjson.JSON;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.entity.User;
import com.letao.mall.service.AdminService;
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
@RequestMapping("/mall/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @GetMapping("/currentAdmin")
    public Admin getCurrentUser(@RequestHeader("Authorization")String token){
        return adminService.findAdminByToken(token);
    }

}

