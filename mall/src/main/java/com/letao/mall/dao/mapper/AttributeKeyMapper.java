package com.letao.mall.dao.mapper;

import com.letao.mall.dao.entity.AttributeKey;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
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
public interface AttributeKeyMapper extends BaseMapper<AttributeKey> {

    @Select("select attribute_name from attribute_key where category_id=#{id} and attribute_name=#{name}")
    String getSameKey(@Param("id") long id, @Param("name") String name);
}
