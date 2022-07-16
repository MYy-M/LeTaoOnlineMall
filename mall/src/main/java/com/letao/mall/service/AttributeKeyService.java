package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.AttributeKey;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface AttributeKeyService extends IService<AttributeKey> {

    Page getAttributeByCategoryID(long id, int current);

    Boolean deleteAttributeKey(long id);

    String getSameKey(@Param("id") long id, @Param("name") String name);
}
