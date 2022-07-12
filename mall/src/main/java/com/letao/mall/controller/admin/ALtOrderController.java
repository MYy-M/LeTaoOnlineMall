package com.letao.mall.controller.admin;

import org.springframework.web.bind.annotation.CrossOrigin;
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
@RequestMapping("/mall/admin/lt-order")
@CrossOrigin
public class ALtOrderController {

    /**
     * 发货
     * @return
     */
    @GetMapping("/delivery")
    public int delivery(){
        return 0;
    }
}
