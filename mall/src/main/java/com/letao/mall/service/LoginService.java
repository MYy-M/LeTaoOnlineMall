package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.dao.entity.Admin;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface LoginService extends IService<Admin> {
        boolean login(Long id, String passWord);

        boolean logout(String token);

}
