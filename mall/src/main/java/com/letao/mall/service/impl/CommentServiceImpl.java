package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Comment;
import com.letao.mall.dao.mapper.CommentMapper;
import com.letao.mall.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    /**
     * 显示商品评论
     * @param pageParam
     * @return
     */
    @Override
    public Result showComments(PageParam pageParam) {
        Page<Comment> commentPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        LambdaQueryWrapper<Comment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Comment::getCid,pageParam.getCid());
        return Result.success(this.page(commentPage,queryWrapper));
    }
}
