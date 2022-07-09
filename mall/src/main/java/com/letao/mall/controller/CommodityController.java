package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.service.CommodityService;
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
//    public List<Commodity> showCommodityListByScore(
//            String cmname
//    ){
//        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
//        wrapper.eq("cname", cmname);
//        wrapper.orderByDesc("score");
//        List<Commodity> commodityList = commodityService.list(wrapper);
//        return commodityList;
//    }

    //根据销量商品排序
    @GetMapping("/getlist/<sales")
    public List<Commodity> showCommodityListBySales(
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        wrapper.orderByDesc("sales");
        List<Commodity> commodityList = commodityService.list(wrapper);
        return commodityList;
    }

    //输入商品名字根据价格商品降序排序
    @RequestMapping("/getlist/pricedesc")
    public List<Commodity> showCommodityListByPriceDesc(
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        wrapper.orderByDesc("cprice");
        List<Commodity> commodityList = commodityService.list(wrapper);
        return commodityList;
    }

    //输入商品名字根据价格商品升序排序
    @RequestMapping("/getlist/priceasc")
    public List<Commodity> showCommodityListByPriceAsc(
            String cmname
    ){
        QueryWrapper<Commodity> wrapper = new QueryWrapper<>();
        wrapper.like("cname", cmname);
        wrapper.orderByAsc("cprice");
        List<Commodity> commodityList = commodityService.list(wrapper);
        return commodityList;
    }


    //查看商品细节
    @GetMapping("/getDetail")
    public String getCommodityDetail(
            Commodity commodity
    ){
        return commodityService.getById(commodity).getCdetail();
    }
}

