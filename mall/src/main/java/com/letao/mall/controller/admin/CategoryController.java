package com.letao.mall.controller.admin;


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
@RequestMapping("/mall/admin/category")
public class CategoryController {

    @GetMapping("/add")
    public int addCategory(){
        return 0;
    }

    @GetMapping("/modify")
    public int modifyCategory(){
        return 0;
    }

    /**
     * 删除类别，不合理
     * 所以判断当前此类别是否具有子类别，如果all子类别商品数量为零，可以删除
     */
    @GetMapping("/delete")
    public int deleteCategory(){
        return 0;
    }

}

