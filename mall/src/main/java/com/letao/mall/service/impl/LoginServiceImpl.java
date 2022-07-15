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
public class LoginServiceImpl extends ServiceImpl<AdminMapper, Admin> implements LoginService {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    private static final String slat = "qsfplm!@#";

    @Override
    public Result login(LoginParam loginParam) {
        Long id = loginParam.getId();
        String password = loginParam.getPassword();
        if(id==0||StringUtils.isBlank(password)){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.ACCOUNT_EXIST.getMsg());
        }
        password = DigestUtils.md5Hex(password+slat);
        Admin admin = adminService.getById(id);
        if(admin==null){
            return Result.fail(ErrorCode.ACCOUNT_PWD_NOT_EXIST.getCode(),ErrorCode.ACCOUNT_PWD_NOT_EXIST.getMsg());
        }
        if(!admin.getApassword().equals(password)){
            return Result.fail(ErrorCode.INCORRECT_PASSWORD.getCode(), ErrorCode.INCORRECT_PASSWORD.getMsg());
        }
        String token = JWTUtils.createToken(id);
        if(admin.getAlevel()==1){
            return Result.fail(ErrorCode.LOGIN_ING.getCode(),ErrorCode.LOGIN_ING.getMsg());
        }else{
            redisTemplate.opsForValue().set("TOKEN_"+token,JSON.toJSONString(admin),1, TimeUnit.DAYS);
            adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid,id).set(Admin::getAlevel,1));
            return Result.success(token);
        }
    }


    @Override
    public Result logout(String token) {
        Admin admin = (Admin)adminService.findAdminByToken(token).getData();
        Long id = admin.getAid();
        if(redisTemplate.delete("TOKEN_" + token) && adminService.update(new LambdaUpdateWrapper<Admin>().eq(Admin::getAid, id).set(Admin::getAlevel, 0))){
            return Result.success(null);
        }else{
            return Result.fail(ErrorCode.NO_LOGIN.getCode(),ErrorCode.NO_LOGIN.getMsg());
        }
    }
}
