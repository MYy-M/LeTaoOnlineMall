package com.letao.mall.service;

import com.letao.mall.dao.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.LoginParam;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface AdminService extends IService<Admin> {

    Result findAdminByToken(String token);

}
