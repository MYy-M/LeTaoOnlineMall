package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Store;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import com.letao.mall.vo.param.StoreParam;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface StoreService extends IService<Store> {
    /**
     * 查询店铺细节
     * @param pageParam
     * @return
     */
    Result showStore(PageParam pageParam);

    /**
     * 查询某个区域内所有门店
     * @param storeParam
     * @return
     */
    public Page showStoreListByAddress(StoreParam storeParam);

    /**
     * 查询所留电话为所输入所有门店
     * @param storeParam
     * @return
     */
    public Page showStoreListByPhone(StoreParam storeParam);

    /**
     * 查询含关键词名的所有门店
     * @param storeParam
     * @return
     */
    public Page showStoreListByName(StoreParam storeParam);
}
