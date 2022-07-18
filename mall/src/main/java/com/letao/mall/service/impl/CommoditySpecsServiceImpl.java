package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.letao.mall.dao.entity.CommoditySpecs;
import com.letao.mall.dao.mapper.CommoditySpecsMapper;
import com.letao.mall.service.CommoditySpecsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
public class CommoditySpecsServiceImpl extends ServiceImpl<CommoditySpecsMapper, CommoditySpecs> implements CommoditySpecsService {

    @Override
    public Result getSpecsByCid(Long cid) {
        List<CommoditySpecs> list = new ArrayList<>();
        list = this.list(new LambdaQueryWrapper<CommoditySpecs>().eq(CommoditySpecs::getCid,cid));
        if(list!=null&&list.size()!=0){
            return Result.success(list);
        }else{
            return Result.fail(ErrorCode.SEARCH_ERROR.getCode(),ErrorCode.SEARCH_ERROR.getMsg());
        }
    }

    @Override
    public Result getPic(Long cid) {
        return null;
    }
}
