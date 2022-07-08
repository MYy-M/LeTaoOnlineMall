package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.letao.mall.service.CommodityService;
import com.letao.mall.dao.entity.Commodity;

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
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    //根据评分商品排序
    @GetMapping("/getlist/score")
    public void showCommodityListByScore(
            @RequestBody Commodity cm
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("score");
        List<Commodity> commodityList = commodityService.list(wrapper);
        for ( Commodity commodity : commodityList)
        {
            System.out.println(commodity);
        }
    }

    //根据销量商品排序
    @GetMapping("/getlist/sales")
    public void showCommodityListBySales(
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("sales");
        List<Commodity> commodityList = commodityService.list(wrapper);
        for ( Commodity commodity : commodityList)
        {
            System.out.println(commodity);
        }
    }

    //根据价格商品排序
    @GetMapping("/getlist/price")
    public void showCommodityListByPrice(
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("score");
        List<Commodity> commodityList = commodityService.list(wrapper);
        for (Commodity commodity : commodityList)
        {
            System.out.println(commodity);
        }
    }

    //查看商品细节
    @GetMapping("/getDetail")
    public Commodity getCommodityDetail(
            Commodity commodity
    ){
        return commodityService.getById(commodity);
    }

}

