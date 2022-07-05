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
@RequestMapping("/mall/admin/commodity")
public class ACommodityController {
    @GetMapping("/add")
    public int addCommodity(){
        return 0;
    }

    @GetMapping("/delete")
    public int deleteCommodity(){
        return 0;
    }
    @GetMapping("/modify")
    public int modifyCommodityAttribute(){
        return 0;
    }
}

