package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.dao.mapper.ConsumerMapper;
import com.letao.mall.service.ConsumerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.service.TokenService;
import com.letao.mall.util.JWTUtils;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.LoginParam;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

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
public class ConsumerServiceImpl extends ServiceImpl<ConsumerMapper, Consumer> implements ConsumerService {

    @Autowired
    private TokenService tokenService;

    @Override
    public Result findConsumerByToken(String token) {
        String consumerJSON = tokenService.checkToken(token);
        Consumer consumer = JSON.parseObject(consumerJSON, Consumer.class);
        if (consumer == null) {
            return Result.fail(ErrorCode.TOKEN_ERROR.getCode(), ErrorCode.TOKEN_ERROR.getMsg());
        }
        return Result.success(consumer);
    }
}
