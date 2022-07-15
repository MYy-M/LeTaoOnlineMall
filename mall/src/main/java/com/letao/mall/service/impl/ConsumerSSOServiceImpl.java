package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.dao.mapper.ConsumerMapper;
import com.letao.mall.service.ConsumerSSOService;
import com.letao.mall.service.ConsumerService;
import com.letao.mall.service.TokenService;
import com.letao.mall.util.JWTUtils;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.LoginParam;
import lombok.val;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
@Transactional
public class ConsumerSSOServiceImpl extends ServiceImpl<ConsumerMapper, Consumer> implements ConsumerSSOService {

    @Autowired
    private ConsumerService consumerService;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    private static final String slat = "qsfplm!@#";

    @Autowired
    private TokenService tokenService;

    @Override
    public Result login(LoginParam loginParam) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        System.out.println(username);
        System.out.println(password);
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        //将前端传回的password加密
        password = DigestUtils.md5Hex(password + slat);
        Consumer consumer =  consumerService.getOne(new LambdaQueryWrapper<Consumer>().eq(Consumer::getUname,username));
        if (consumer == null) {
            return Result.fail(ErrorCode.ACCOUNT_PWD_NOT_EXIST.getCode(), ErrorCode.ACCOUNT_PWD_NOT_EXIST.getMsg());
        }
        if (!consumer.getUpassword().equals(password)) {
            return Result.fail(ErrorCode.INCORRECT_PASSWORD.getCode(), ErrorCode.INCORRECT_PASSWORD.getMsg());
        }
        Long id = consumer.getUid();
        String token = JWTUtils.createToken(id);
        redisTemplate.opsForValue().set("TOKEN_" + token, JSON.toJSONString(consumer), 1, TimeUnit.DAYS);
        return Result.success(token);
    }

    @Override
    public Result register(LoginParam loginParam) {
        String username = loginParam.getUsername();
        String password = loginParam.getPassword();
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        password = DigestUtils.md5Hex(password + slat);
        Consumer consumerU = new Consumer();
        consumerU.setUname(username);
        consumerU.setUpassword(password);
        consumerService.save(consumerU);
//        String token = JWTUtils.createToken(consumerU.getUid());
//        redisTemplate.opsForValue().set("TOKEN_" + token, JSON.toJSONString(consumerU), 1, TimeUnit.DAYS);
        return Result.success("注册成功!!!");
    }

    @Override
    public Result logout(String token) {
        return Result.success(redisTemplate.delete("TOKEN_" + token) );
    }


}
