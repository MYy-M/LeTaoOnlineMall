//package com.letao.mall.service.impl;
//
//import com.baomidou.mybatisplus.core.toolkit.StringUtils;
//import com.letao.mall.dao.entity.Admin;
//import com.letao.mall.dao.entity.User;
//import com.letao.mall.dao.mapper.UserMapper;
//import com.letao.mall.service.LoginService;
//import com.letao.mall.service.UserService;
//import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//import com.letao.mall.util.JWTUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.Map;
//
///**
// * <p>
// *  服务实现类
// * </p>
// *
// * @author 骑手反叛联盟
// * @since 2022-06-30
// */
//@Service
//public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
//
//    @Autowired
//    private LoginService loginService;
//
//    @Override
//    public User findUserByToken(String token) {
////        User user = loginService.checkToken(token);
////        if(user==null){
////            System.out.println("token不合法");
////            return null;
////        }
////        return user;
//        return null;
//    }
//}
