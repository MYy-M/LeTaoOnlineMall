package com.letao.mall.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.letao.mall.dao.entity.CommoditySpecs;
import com.letao.mall.service.CommodityService;
import com.letao.mall.service.CommoditySpecsService;
import com.letao.mall.util.UploadPic;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CommoditySpecsParam;
import com.letao.mall.vo.param.SpecsData;
import com.letao.mall.vo.param.SpecsParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.QueryAnnotation;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private UploadPic uploadPic;
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


    /**
     * 添加规格
     * @param param
     * @return
     */
    @PostMapping("/addSpecs")
    public Result addSpecs(@RequestBody CommoditySpecsParam param){
        List<SpecsParam> list=param.getSpecsList();
        //规格列表
        List<CommoditySpecs> commoditySpecsList=new ArrayList<>();

        for(SpecsParam specs:list){
            CommoditySpecs commoditySpecs=new CommoditySpecs();
            commoditySpecs.setCid(specs.getCid());
            commoditySpecs.setCprice(specs.getPrice());
            commoditySpecs.setCStock(specs.getStock());

            String imgUrl="";
            try {
                imgUrl=uploadPic.upPic(specs.getPic());
            } catch (IOException e) {
                e.printStackTrace();
            }
            commoditySpecs.setCSpecs(imgUrl);

            //循环拿到每个key和value
            JSONArray jsonArray= JSON.parseArray(specs.getSpData());
            Map<String,String> map=new HashMap<>();
            for(int i=0;i<jsonArray.size();i++){
                SpecsData specsData=jsonArray.getObject(i,SpecsData.class);
                map.put(specsData.getKey(), specsData.getValue());
            }
            String s=JSON.toJSONString(map);
            commoditySpecs.setCSpecs(s);

            commoditySpecsList.add(commoditySpecs);

        }
        if(commoditySpecsService.saveBatch(commoditySpecsList)){
            return Result.success(true);
        }
        return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

}

