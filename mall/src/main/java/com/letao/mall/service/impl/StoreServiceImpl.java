package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Store;
import com.letao.mall.dao.mapper.StoreMapper;
import com.letao.mall.service.StoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.stereotype.Service;

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

    /**
     * 查询个人的购物车
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
}
