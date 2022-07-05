package com.letao.mall.controller.admin;


import com.letao.mall.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    @GetMapping("/modify")
    public int modifyStoreAttributes(){
        return 0;
    }

    @GetMapping("/delete")
    public int deleteStore(){
        return 0;
    }


    @GetMapping("/add")
    public int addStore(){
        return 0;
    }


    @GetMapping("/get")
    public int getStore(){
        return 0;
    }


}

