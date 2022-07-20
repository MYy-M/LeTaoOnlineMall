package com.letao.mall.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.dao.entity.OrderAddress;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Mapper
public interface OrderAddressMapper extends BaseMapper<OrderAddress> {

    @Select("select address from order_address where id=#{id}")
    String getAddress(@Param("id") long addressId);
}
