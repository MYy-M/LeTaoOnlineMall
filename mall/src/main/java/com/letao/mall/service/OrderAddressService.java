package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.dao.entity.OrderAddress;
import com.letao.mall.vo.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.core.annotation.Order;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface OrderAddressService extends IService<OrderAddress> {
    String getAddress(@Param("id") long addressId);
}
