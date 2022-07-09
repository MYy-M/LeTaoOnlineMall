package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.mapper.AdminMapper;
import com.letao.mall.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.service.TokenService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {


    @Autowired
    private TokenService tokenService;
    @Override
    public Result findAdminByToken(String token) {
        Admin admin = tokenService.checkToken(token);
        if(admin==null){
            return Result.fail(ErrorCode.TOKEN_ERROR.getCode(),ErrorCode.TOKEN_ERROR.getMsg());
        }
        return Result.success(admin);
    }

}
