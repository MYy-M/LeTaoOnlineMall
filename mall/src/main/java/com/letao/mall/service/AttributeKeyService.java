package com.letao.mall.service;

import com.letao.mall.dao.entity.AttributeKey;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface AttributeKeyService extends IService<AttributeKey> {

<<<<<<< Updated upstream
=======
    Page getAttributeByCategoryID(long id, int current,int pageSize);

    Boolean deleteAttributeKey(long id);
>>>>>>> Stashed changes
}
