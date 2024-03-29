package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.service.AdminService;
import com.letao.mall.service.RegisterService;
import com.letao.mall.util.JWTUtils;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.LoginParam;
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
public class RegisterServiceImpl<admin> extends ServiceImpl<AdminMapper, Admin> implements RegisterService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    private static final String slat = "qsfplm!@#";


    @Override
    public Result register(LoginParam loginParam) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        if(StringUtils.isBlank(username)|| StringUtils.isBlank(password)){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
        }
        LambdaQueryWrapper<Admin> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Admin::getAusername,username);
        queryWrapper.last("limit 1");
        Admin adminA = adminService.getOne(queryWrapper);
        if(adminA!=null){
            return Result.fail(ErrorCode.ACCOUNT_EXIST.getCode(),ErrorCode.ACCOUNT_EXIST.getMsg());
        }
        password = DigestUtils.md5Hex(password+slat);
        Admin admin = new Admin();
        admin.setAusername(username);
        admin.setApassword(password);
        adminService.save(admin);
        String token = JWTUtils.createToken(admin.getAid());
        redisTemplate.opsForValue().set("TOKEN_"+token, JSON.toJSONString(admin),1, TimeUnit.DAYS);
        Long id = adminService.getOne(new LambdaQueryWrapper<Admin>().eq(Admin::getAusername,username)).getAid();
        adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid,id).set(Admin::getAlevel,1));
        return Result.success(token);
    }
}
