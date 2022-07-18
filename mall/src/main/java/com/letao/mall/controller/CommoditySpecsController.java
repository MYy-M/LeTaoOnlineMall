package com.letao.mall.controller;


import com.letao.mall.service.CommodityService;
import com.letao.mall.service.CommoditySpecsService;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.QueryAnnotation;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/commoditySpecs")
@CrossOrigin
public class CommoditySpecsController {


    @Autowired
    private CommoditySpecsService commoditySpecsService;
    /**
     * 根据商品ID获取规格
     * @param cid
     * @return
     */
    @PostMapping("/getSpecs")
    public Result showCommodityByName(Long cid){
        return commoditySpecsService.getSpecsByCid(cid);
    }



    /**
     * 根据商品ID获取图片
     * @param cid
     * @return
     */
    @PostMapping("/getCommodityPic")
    public Result getCommodityPic(Long cid) throws IOException {
        return commoditySpecsService.getPic(cid);
    }

}

