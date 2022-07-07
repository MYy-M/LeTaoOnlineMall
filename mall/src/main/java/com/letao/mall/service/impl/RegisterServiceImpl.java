package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.service.AdminService;
import com.letao.mall.service.LoginService;
import com.letao.mall.service.RegisterService;
import com.letao.mall.util.JWTUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class RegisterServiceImpl<admin> extends ServiceImpl<AdminMapper, Admin> implements RegisterService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    private static final String slat = "qsfplm!@#";


    @Override
    public boolean register(Admin admin) {
        String username = admin.getAusername();
        String password = admin.getApassword();
        if(StringUtils.isBlank(username)|| StringUtils.isBlank(password)){
            return false;
        }
        LambdaQueryWrapper<Admin> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Admin::getAusername,username);
        queryWrapper.last("limit 1");
        Admin adminA = adminService.getOne(queryWrapper);
        if(adminA!=null){
            System.out.println("账户已存在");
            return false;
        }
        password = DigestUtils.md5Hex(password+slat);
        admin.setApassword(password);
        adminService.save(admin);
        String token = JWTUtils.createToken(admin.getAid());
        redisTemplate.opsForValue().set("TOKEN_"+token, JSON.toJSONString(admin),1, TimeUnit.DAYS);
        Long id = adminService.getOne(new LambdaQueryWrapper<Admin>().eq(Admin::getAusername,username)).getAid();
        return adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid,id).set(Admin::getAlevel,1));

    }
}
