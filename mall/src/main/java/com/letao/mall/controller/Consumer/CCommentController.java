package com.letao.mall.controller.Consumer;


import com.letao.mall.dao.entity.Comment;
import com.letao.mall.service.CommentService;
import com.letao.mall.service.LtOrderService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
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
@RequestMapping("/mall/consumer/comment")
@CrossOrigin
public class CCommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private LtOrderService ltOrderService;

    /**
     * 消费者进行评论
     * @param comment
     * @return
     */
    @GetMapping("/add")
    public Result addComments(@RequestBody Comment comment){
        if(ltOrderService.query().eq("uid",comment.getUid()).eq("order_state", "1" )== null)
            return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        if(commentService.getById(comment) !=null)
            return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        return  Result.success(commentService.save(comment));
    }

    /**
     * 消费者删除自己的评论
     * @param commentId
     * @return
     */
    @GetMapping("/delete")
    public Result deleteComments(Long commentId){
        if(commentService.getById(commentId) == null)
            return Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
        return Result.success(commentService.removeById(commentId));
    }



}

