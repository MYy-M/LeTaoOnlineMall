package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CollectionService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mall/collection")
@CrossOrigin
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

    @Autowired
    private CommodityMapper commodityMapper;

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
    public Result getCollection(@RequestBody PageParam param){
        Page<Commodity> page=new Page<>(param.getPage(),param.getPageSize());
        if(commodityMapper.getCollection(page,param.getUid())==null){
            return Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg());
        }
        return Result.success(commodityMapper.getCollection(page,param.getUid()));
    }

}
