package com.letao.mall.controller.admin;


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
@RequestMapping("/mall/admin/comment")
@CrossOrigin
public class ACommentController {

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

    /**
     * 根据评论id，删除指定评论
     * @param commentId
     * @return
     */
    @GetMapping("/delete")
    public Result deleteComments(@PathVariable("commentId") Long commentId){
        return Result.success(commentService.removeById(commentId));
    }
}

