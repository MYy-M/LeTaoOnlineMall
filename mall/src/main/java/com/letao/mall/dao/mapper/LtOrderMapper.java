package com.letao.mall.dao.mapper;

import com.letao.mall.dao.entity.LtOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Mapper
public interface LtOrderMapper extends BaseMapper<LtOrder> {

    @Select("select order_State from lt_order where order_id=#{oid}")
    int getOrderState(@Param("oid") long id);

    @Delete("delete from lt_order where order_id=#{id}")
    Boolean deleteOrder(@Param("id") long id);

    @Update("update lt_order set order_state=#{state} where order_id=#{id}")
    int modifyOrderState(@Param("id") long id,@Param("state") int state);

}
