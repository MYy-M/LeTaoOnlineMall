package com.letao.mall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.dao.entity.Commodity;
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

    @PostMapping("/addCollection")
    public Result addCollecction(@RequestBody Collection collection){
        if(collectionService.save(collection)){
            return Result.success(true);
        }
        return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    /**
     * uid和cid
     * @param param
     * @return
     */
    @PostMapping("/deleteCollection")
    public Result deleteCollection(@RequestBody PageParam param){
        QueryWrapper<Collection> wrapper=new QueryWrapper<>();
        wrapper.eq("uid",param.getUid())
                .eq("cid",param.getCid());
        if(collectionService.remove(wrapper)){
            return Result.success(true);
        }
        return  Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }

    /**
     * 只要page属性,uid属性,pageSize属性
     * @param param
     * @return
     */
    @PostMapping("/getCollection")
    public void getCollection(@RequestBody PageParam param){

    }
}
