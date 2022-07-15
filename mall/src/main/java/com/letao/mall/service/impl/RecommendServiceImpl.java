package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.entity.Recommend;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.dao.mapper.RecommendMapper;
import com.letao.mall.service.RecommendService;
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
public class RecommendServiceImpl extends ServiceImpl<RecommendMapper, Recommend> implements RecommendService {


}
