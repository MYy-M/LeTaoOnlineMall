package com.letao.mall.controller.admin;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.service.CommentService;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/mall/admin/comment")
public class ACommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 根据商品id获取商品评论
     * @param cid
     * @param currentPageNum
     * @return
     */
    @GetMapping("/show")
    public Page getCommentsByCId(Long cid,int currentPageNum){
        return commentService.showComments(cid,currentPageNum);
    }

    /**
     * 根据评论id，删除指定评论
     * @param commentId
     * @return
     */
    @GetMapping("/delete")
    public boolean deleteComments(Long commentId){
        return commentService.removeById(commentId);
    }
}

