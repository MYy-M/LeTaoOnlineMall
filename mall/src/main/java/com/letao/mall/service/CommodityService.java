package com.letao.mall.service;

import com.letao.mall.dao.entity.Commodity;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CommodityParam;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
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

    int deleteCommodity(long id);

    int countAdminTotal();

    int countCusTotal();

    Boolean isExisted(String cname, String attribute_list, BigDecimal price);

    Boolean setPicture(long id,String cpicture);

    String  getPicture(@Param("id") long id);

    Result showCommodityByCategory(Long categoryId) throws IOException;

    Result showCommodityByCategory(String categoryName) throws IOException;

    Result getHotProduct(String categoryName) throws IOException;

    Result showCommodityByCategoryId(CommodityParam commodityParam) throws IOException;

    Result showAllCommodityList(CommodityParam commodityParam) throws IOException;
}
