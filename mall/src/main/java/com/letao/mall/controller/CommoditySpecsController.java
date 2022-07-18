package com.letao.mall.controller;


import com.letao.mall.service.CommodityService;
import com.letao.mall.service.CommoditySpecsService;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.QueryAnnotation;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/commodity-specs")
@CrossOrigin
public class CommoditySpecsController {


    @Autowired
    private CommoditySpecsService commoditySpecsService;
    /**
     * 根据分类名称显示商品
     * @param cid
     * @return
     */
    @GetMapping("/getSpecs")
    public Result showCommodityByName(Long cid){
        return commoditySpecsService.getSpecsByCid(cid);
    }

}

