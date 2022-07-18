package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.service.CollectionService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/mall/collection")
@CrossOrigin
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

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
}
