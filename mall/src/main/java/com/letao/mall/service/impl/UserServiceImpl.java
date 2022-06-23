package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.User;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.mapper.UserMapper;
import com.letao.mall.service.UserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-23
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
