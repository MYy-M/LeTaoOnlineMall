package com.letao.mall.dao.mapper;

import com.letao.mall.dao.entity.Commodity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
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
    int deleteCommodity(Integer id);

    @Select("select count(*) from commdity")
    int countAdminTotal();

    @Select("select count(*) from commdity where cnum>0")
    int countCusTotal();

}
