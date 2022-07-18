package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.service.CommodityService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CommoditySortParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/commodity")
@CrossOrigin
public class CommodityController {

    @Autowired
    private CommodityService commodityService;


    /**
     * 根据分类显示商品
     * @param categoryId
     * @return
     */
    @GetMapping("/showByCategoryId")
    public Result showCommodityById(Long categoryId){
        return commodityService.showCommodityByCategory(categoryId);
    }

    /**
     * 根据分类名称显示商品
     * @param categoryName
     * @return
     */
    @GetMapping("/showByCategoryName")
    public Result showCommodityByName(String categoryName){
        return commodityService.showCommodityByCategory(categoryName);
    }


    /**
     * 根据分类名称显示商品
     * @param categoryName
     * @return
     */
    @PostMapping("/getHotProduct")
    public Result getHotProduct(String categoryName){
        return commodityService.getHotProduct(categoryName);
    }

    //根据销量商品排序分页展示
    @GetMapping("/getlist/salesdesc/{pnum}")
    public Result showCommodityListBySales(
            @RequestBody CommoditySortParam commoditySortParam
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", commoditySortParam.getCmname());
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByDesc("sales");
        Page<Commodity> commodityPage = new Page<>(commoditySortParam.getPagenum(), commoditySortParam.getPagesize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }


    //输入商品名字根据价格商品降序排序分页展示
    @GetMapping("/getlist/pricedesc")
    public Result showCommodityListByPriceDesc(
            @RequestBody CommoditySortParam commoditySortParam
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", commoditySortParam.getCmname());
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByDesc("cprice");
        Page<Commodity> commodityPage = new Page<>(commoditySortParam.getPagenum(),commoditySortParam.getPagesize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }

    //输入商品名字根据价格商品升序排序分页展示
    @GetMapping("/getlist/priceasc")
    public Result showCommodityListByPriceAsc(
            @RequestBody CommoditySortParam commoditySortParam
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", commoditySortParam.getCmname());
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByAsc("cprice");
        Page<Commodity> commodityPage = new Page<>(commoditySortParam.getPagenum(),commoditySortParam.getPagesize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }


    /**
     * 查看商品细节
     * @param cid
     * @return
     */
    @GetMapping("/getDetail")
    public Result getCommodityDetail(Long cid){
        if(commodityService.getById(cid).getCdetail() == null )
            return Result.fail(ErrorCode.DETAIL_NOT_EXIST.getCode(), ErrorCode.DETAIL_NOT_EXIST.getMsg());
        return Result.success(commodityService.getById(cid).getCdetail());
    }


    /**
     * 根据商品ID获取图片
     * @param cid
     * @return
     */
    @PostMapping()
    public Result getCommodityPic(Long cid){
        return null;
    }



}

