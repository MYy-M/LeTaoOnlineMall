package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Store;
import com.letao.mall.dao.mapper.StoreMapper;
import com.letao.mall.service.StoreService;

import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import com.letao.mall.vo.param.StoreParam;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class StoreServiceImpl extends ServiceImpl<StoreMapper, Store> implements StoreService {

    private StoreMapper storeMapper;
    /**
     * 查询门店信息
     * @param pageParam
     * @return
     */
    @Override
    public Result showStore(PageParam pageParam){
        Page<Store> cartPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        LambdaQueryWrapper<Store> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Store::getSid,pageParam.getUid());
        return Result.success(this.page(cartPage,queryWrapper));
    }

    /**
     * 根据条件查询所有门店
     * @param storeParam
     * @return
     */
    @Override
    public Page showStoreListByCondition(StoreParam storeParam) {
        String storeadress=storeParam.getStoreadress();
        String storename=storeParam.getStorename();
        String storephone=storeParam.getStorephone();
        Page<Store> storePage = new Page<>(storeParam.getPagenum(), storeParam.getPagesize());
        LambdaQueryWrapper<Store> queryWrapper = new LambdaQueryWrapper<>();
        if(storeadress!=null){
            queryWrapper.like(Store::getSaddress,storeadress);
        }
        if(storename!=null){
            queryWrapper.like(Store::getSname,storename);
        }
        if(storephone!=null) {
            queryWrapper.like(Store::getSphone, storephone);
        }
        return storeMapper.selectPage(storePage, queryWrapper);

    }
}
