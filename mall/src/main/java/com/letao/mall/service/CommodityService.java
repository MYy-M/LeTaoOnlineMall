package com.letao.mall.service;

import com.letao.mall.dao.entity.Commodity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.math.BigDecimal;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface CommodityService extends IService<Commodity> {

    int deleteCommodity(Integer id);

    int countAdminTotal();

    int countCusTotal();

    Boolean isExisted(String cname, String attribute_list, BigDecimal price);
}
