package com.letao.mall.service;

import com.letao.mall.dao.entity.AttributeValue;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface AttributeValueService extends IService<AttributeValue> {

    List<AttributeValue> getAttributeValueByKey(long id);

    Boolean deleteAttributeValue(long id);
}
