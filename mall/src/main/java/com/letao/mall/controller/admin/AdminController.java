package com.letao.mall.controller.admin;


import com.letao.mall.service.AdminService;
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
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 根据token获取当前管理员信息
     * @param token
     * @return
     */
    @GetMapping("/currentAdmin")
    public Result getCurrentUser(@RequestHeader("Authorization")String token){
        return adminService.findAdminByToken(token);
    }

}

