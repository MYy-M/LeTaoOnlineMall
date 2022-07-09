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
@RequestMapping("/mall/consumer/comment")
@CrossOrigin
public class CCommentController {

    @GetMapping("/add")
    public int addComments(){
        return 0;
    }

    @GetMapping("/delete")
    public int deleteComments(){
        return 0;
    }



}

