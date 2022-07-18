package com.letao.mall.dao.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Mapper
public interface CommodityMapper extends BaseMapper<Commodity> {

    @Update("update commodity set cnum=0 where cid=#{id}")
    int deleteCommodity(long id);

    @Select("select count(*) from commodity")
    int countAdminTotal();

    @Select("select count(*) from commodity where cnum>0")
    int countCusTotal();

    @Update("update commodity set cpicture=#{cpicture} where cid=#{id}")
    Boolean setPicture(@Param("id") long id, @Param("cpicture")String cpicture);

    @Select("select cpicture from commodity where cid=#{id}")
    String  getPicture(@Param("id") long id);

    @Select("select * from commodity LEFT JOIN collection on commodity.cid=collection.cid where collection.uid=#{uid}")
    Page<Commodity> getCollection(Page<Commodity> page, @Param("uid")long uid);



}
