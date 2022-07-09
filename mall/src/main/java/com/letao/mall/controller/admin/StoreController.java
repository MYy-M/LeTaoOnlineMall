package com.letao.mall.controller.admin;


import com.letao.mall.service.StoreService;
import com.letao.mall.dao.entity.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;


import java.util.*;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/store")
@CrossOrigin
public class StoreController {

    @Autowired
    private StoreService storeService;


    //修改店铺信息
    @RequestMapping("/modify")
    public Boolean modifyStoreAttributes(Store sm) {
        return storeService.updateById(sm);
    }


    //删除店铺
    @RequestMapping("/delete")
    public boolean deleteStore(Integer id) {
        return storeService.removeById(id);
    }

    //添加门店
    @RequestMapping("/add")
    public boolean addStore(@RequestBody Store store) {
        return storeService.save(store);
    }

    //根据店铺id查询其店铺信息
    @GetMapping("/get")
    public Store getStore(Store store) {
        return storeService.getById(store);
    }

}

