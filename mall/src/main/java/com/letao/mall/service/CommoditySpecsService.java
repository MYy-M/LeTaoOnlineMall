package com.letao.mall.service;

import com.letao.mall.dao.entity.CommoditySpecs;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface CommoditySpecsService extends IService<CommoditySpecs> {

    Result getSpecsByCid(Long cid);

    Result getPic(Long cid);
}
