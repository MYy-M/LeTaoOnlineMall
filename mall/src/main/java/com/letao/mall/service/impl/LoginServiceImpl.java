package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.service.AdminService;
import com.letao.mall.service.LoginService;
import com.letao.mall.util.JWTUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional
public class LoginServiceImpl extends ServiceImpl<AdminMapper, Admin> implements LoginService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    private static final String slat = "qsfplm!@#";

    @Override
    public String login(Long id, String password) {
        if(id==0||StringUtils.isBlank(password)){
            return "您的账号/密码为空！";
        }
        password = DigestUtils.md5Hex(password+slat);
        Admin admin = adminService.getById(id);
        if(!admin.getApassword().equals(password)){
            return "您输入的账号不存在！请注册";
        }
        String token = JWTUtils.createToken(id);
        if(admin.getAlevel()==1){
            return "您的账号已登录！";
        }else{
            redisTemplate.opsForValue().set("TOKEN_"+token,JSON.toJSONString(admin),1, TimeUnit.DAYS);
            adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid,id).set(Admin::getAlevel,1));
            return token;
        }
    }


    @Override
    public boolean logout(String token) {
        Long id = adminService.findAdminByToken(token).getAid();
        return redisTemplate.delete("TOKEN_" + token) && adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid, id).set(Admin::getAlevel, 0));
    }
}
