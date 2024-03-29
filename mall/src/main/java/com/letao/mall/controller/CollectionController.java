package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CollectionService;
import com.letao.mall.util.PicUtils;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/mall/collection")
@CrossOrigin
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private PicUtils picUtils;
    @PostMapping("/addCollection")
    public Result addCollecction(@RequestBody Collection collection){
        if(collectionService.save(collection)){
            return Result.success(true);
        }
        return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    @PostMapping("/deleteCollection")
    public Result deleteCollection(long id){
        QueryWrapper<Collection> wrapper=new QueryWrapper<>();
        wrapper.eq("id",id);
        if(collectionService.remove(wrapper)){
            return Result.success(true);
        }
        return  Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }

    @PostMapping("/getCollection")
    public Result getCollection(@RequestBody PageParam param) throws IOException {
        List<Commodity> list=commodityMapper.getCollection(param.getUid());
        for(Commodity c:list){
            String imgUrl=c.getCpicture();
            c.setCpicture(picUtils.encrypt(imgUrl));
        }
        return Result.success(list);
    }

}
