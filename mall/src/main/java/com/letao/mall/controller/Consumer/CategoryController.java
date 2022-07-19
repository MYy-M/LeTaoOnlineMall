package com.letao.mall.controller.Consumer;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.letao.mall.dao.entity.AttributeKey;
import com.letao.mall.dao.entity.AttributeValue;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.service.AttributeKeyService;
import com.letao.mall.service.AttributeValueService;
import com.letao.mall.service.CategoryService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.AttributeParam;
import com.letao.mall.vo.param.CategoryPageParam;
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
@RequestMapping("/mall/consumer/category")
@CrossOrigin
public class CategoryController {
    @Autowired
    private CategoryService cgs;

    /**
     * 获得所有第一级分类
     *
     * @return
     */
    @PostMapping("/getCategoryFirst")
    public Result getCategoryFirst() {
        return Result.success(cgs.list(new LambdaQueryWrapper<Category>().eq(Category::getParentId, 0)));
    }

    /**
     * 根据一级分类id找二级分类
     *
     * @param categoryId
     * @return
     */

    @PostMapping("/getCategorySecond")
    public Result getCategorySecond(Long categoryId) {
        return Result.success(cgs.list(new LambdaQueryWrapper<Category>().eq(Category::getParentId, categoryId)));
    }
}

