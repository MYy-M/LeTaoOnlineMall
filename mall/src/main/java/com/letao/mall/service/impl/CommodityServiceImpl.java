package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CategoryService;
import com.letao.mall.service.CommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private CategoryService categoryService;


    public int deleteCommodity(long id) {
        return commodityMapper.deleteCommodity(id);
    }

    public int countAdminTotal() {
        return commodityMapper.countAdminTotal();
    }

    /**
     * 返回cnum>0的总数
     *
     * @return
     */
    public int countCusTotal() {
        return commodityMapper.countCusTotal();
    }

    public Boolean isExisted(String cname, String attribute_list, BigDecimal price) {
        QueryWrapper<Commodity> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .eq("cprice", price)
                .eq("cname", cname)
                .eq("attribute_list", attribute_list);
        if (commodityMapper.selectCount(queryWrapper) > 0) {
            return false;
        }
        return true;
    }

    public Boolean setPicture(long id, String cpicture) {
        return commodityMapper.setPicture(id, cpicture);
    }

    public String getPicture(@Param("id") long id) {
        return commodityMapper.getPicture(id);
    }


    @Override
    public Result showCommodityByCategory(Long categoryId) {
        return showCommodityByCategory(categoryId, false);
    }

    public Result showCommodityByCategory(Long categoryId, boolean isSort) {
        List<Category> list = categoryService.getAllSecondCategory(categoryId);
        System.out.println(list);
        List<Commodity> commodityList = new ArrayList<>();
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Commodity::getCategoryId, categoryId);
        if (list == null || list.size() == 0) {
            if (isSort) {
                System.out.println("9009090909090");
                commodityList.addAll(commodityMapper.selectList(queryWrapper.orderByDesc(Commodity::getCsales)));
            } else {
                commodityList.addAll(commodityMapper.selectList(queryWrapper));
            }
        } else {
            if (isSort) {
                for (int i = 0; i < list.size(); i++) {
                    Long secondId = list.get(i).getCategoryId();
                    commodityList.addAll(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId).orderByDesc(Commodity::getCsales)));
                }
            } else {
                for (int i = 0; i < list.size(); i++) {
                    Long secondId = list.get(i).getCategoryId();
                    commodityList.addAll(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId)));
                }
            }

        }
        if (commodityList != null && commodityList.size() != 0) {
            return Result.success(commodityList);
        } else {
            return Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg());
        }
    }


    @Override
    public Result showCommodityByCategory(String categoryName) {
        Category category = categoryService.getOne(new LambdaQueryWrapper<Category>().eq(Category::getCategoryName, categoryName));
        if (category == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        } else {
            Long categoryId = category.getCategoryId();
            return showCommodityByCategory(categoryId);
        }
    }

    @Override
    public Result getHotProduct(String categoryName) {
        Category category = categoryService.getOne(new LambdaQueryWrapper<Category>().eq(Category::getCategoryName, categoryName));
        if (category == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        } else {
            Long categoryId = category.getCategoryId();
            return showCommodityByCategory(categoryId,true);
        }
    }


}
