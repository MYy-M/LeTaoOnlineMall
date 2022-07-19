package com.letao.mall.dao.mapper;

import com.letao.mall.dao.entity.LtOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.letao.mall.dao.entity.Orderitem;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

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

/*    @Select("select o.id,o.order_id,l.time as order_time,o.csId as product_id," +
            "o.cname as product_name,o.cnum as product_num,o.cpicture as product_picture," +
            "o.cprice as product_price" +
            " from lt_order as l LEFT JOIN orderitem as o on l.order_id=o.order_id where l.uid=#{uid} ")*/

    @Select("select * from lt_order as l LEFT JOIN orderitem as o on l.order_id=o.order_id where l.uid=#{uid}")
    List<Orderitem> getOrderList(@Param("uid") long uid);

    @Select("select time from lt_order where order_id=#{id}")
    Date getTime(long id);

}
