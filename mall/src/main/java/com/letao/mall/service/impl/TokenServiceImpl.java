package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
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
    public String checkToken(String token) {
        if(StringUtils.isBlank(token)){
            return "token不合法";
        }
        Map<String, Object> stringObjectMap = JWTUtils.checkToken(token);
        if(stringObjectMap==null){
            return "null";
        }
        String userJSON = redisTemplate.opsForValue().get("TOKEN_" + token);
        if(StringUtils.isBlank(userJSON)){
            return "null";
        }
        return userJSON;
    }
}
