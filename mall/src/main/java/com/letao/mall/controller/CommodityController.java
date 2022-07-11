package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.service.CommodityService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
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

//    //根据评分商品排序
//    @GetMapping("/getlist/score")
//    public Result showCommodityListByScore(
//            String cmname
//    ){
//        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
//        wrapper.eq("cname", cmname);
//        if(wrapper == null)
//            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
//        wrapper.orderByDesc("score");
//        List<Commodity> commodityList = commodityService.list(wrapper);
//        return Result.success(commodityList);
//    }

    //根据销量商品排序分页展示
    @GetMapping("/getlist/salesdesc/{pnum}")
    public Result showCommodityListBySales(
            @PathVariable("pnum") PageParam pageParam,
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByDesc("sales");
        Page<Commodity> commodityPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }

    //输入商品名字根据价格商品降序排序分页展示
    @RequestMapping("/getlist/pricedesc")
    public Result showCommodityListByPriceDesc(
            @PathVariable("pnum") PageParam pageParam,
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByDesc("cprice");
        Page<Commodity> commodityPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }

    //输入商品名字根据价格商品升序排序分页展示
    @RequestMapping("/getlist/priceasc")
    public Result showCommodityListByPriceAsc(
            @PathVariable("pnum") PageParam pageParam,
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        if(wrapper == null)
            return Result.fail(ErrorCode.COMMODITY_NOT_EXIST.getCode(), ErrorCode.COMMODITY_NOT_EXIST.getMsg());
        wrapper.orderByAsc("cprice");
        Page<Commodity> commodityPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        return Result.success(commodityService.page(commodityPage,wrapper));
    }


    //查看商品细节
    @GetMapping("/getDetail")
    public Result getCommodityDetail(
            Commodity commodity
    ){
        if(commodityService.getById(commodity).getCdetail() == null )
            return Result.fail(ErrorCode.DETAIL_NOT_EXIST.getCode(), ErrorCode.DETAIL_NOT_EXIST.getMsg());
        return Result.success(commodityService.getById(commodity).getCdetail());
    }
}

