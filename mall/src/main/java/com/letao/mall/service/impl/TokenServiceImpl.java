package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.service.AdminService;
import com.letao.mall.service.TokenService;
import com.letao.mall.util.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class TokenServiceImpl extends ServiceImpl<AdminMapper, Admin> implements TokenService {

    @Autowired
    private  RedisTemplate<String,String> redisTemplate;

    @Override
    public  Admin checkToken(String token) {
        if(StringUtils.isBlank(token)){
            System.out.println("token不合法");
            return null;
        }
        Map<String, Object> stringObjectMap = JWTUtils.checkToken(token);
        if(stringObjectMap==null){
            return null;
        }
        String adminJSON = redisTemplate.opsForValue().get("Token_" + token);
        if(StringUtils.isBlank(adminJSON)){
            return null;
        }

        Admin admin = JSON.parseObject(adminJSON, Admin.class);
        return admin;
    }
}
