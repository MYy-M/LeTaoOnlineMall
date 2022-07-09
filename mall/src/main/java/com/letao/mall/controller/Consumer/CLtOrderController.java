package com.letao.mall.controller.Consumer;


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
@RequestMapping("/mall/consumer/lt-order")
@CrossOrigin
public class CLtOrderController {
    @GetMapping("/payOrder")
    public int payOrder(){
        return 0;
    }

    @GetMapping("/addOrder")
    public int addOrder(){
        return 0;
    }

    @GetMapping("/finishOrder")
    public int finishOrder(){
        return 0;
    }

    @GetMapping("/deleteOrder")
    public int deleteOrder(){
        return 0;
    }

}

