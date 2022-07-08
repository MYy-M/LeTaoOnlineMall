package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {

    @Autowired
    private CommodityMapper commodityMapper;
    public int deleteCommodity(Integer id){
        return commodityMapper.deleteCommodity(id);
    }

    public int countAdminTotal(){
        return commodityMapper.countAdminTotal();
    }

    /**
     * 返回cnum>0的总数
     * @return
     */
    public int countCusTotal(){
        return commodityMapper.countCusTotal();
    }

    public Boolean isExisted(String cname, String attribute_list, BigDecimal price){
        QueryWrapper<Commodity> queryWrapper=new QueryWrapper<>();
        queryWrapper
                .eq("cprice",price)
                .eq("cname",cname)
                .eq("attribute_list",attribute_list);
        if(commodityMapper.selectCount(queryWrapper)>0){
            return false;
        }
        return true;
    }

    public Boolean setPicture(long id,String cpicture){
        return commodityMapper.setPicture(id,cpicture);
    }

    public String getPicture(@Param("id") long id){
        return commodityMapper.getPicture(id);
    }
}
