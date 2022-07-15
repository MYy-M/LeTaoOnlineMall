package com.letao.mall.controller;


import com.letao.mall.service.CommentService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/comment")
@CrossOrigin
public class CommentController {
    @Autowired
    private CommentService commentService;
    /**
     * 根据商品id获取商品评论
     * @param pageParam
     * @return
     */
    @PostMapping("/show")
    public Result getCommentsByCId(@RequestBody PageParam pageParam){
        return commentService.showComments(pageParam);
    }
}

