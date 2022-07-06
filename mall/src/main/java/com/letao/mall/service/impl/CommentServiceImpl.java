package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Comment;
import com.letao.mall.dao.mapper.CommentMapper;
import com.letao.mall.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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
     * @param cid
     * @param currentPageNum
     * @return
     */
    @Override
    public Page showComments(Long cid, int currentPageNum) {
        Page<Comment> commentPage = new Page<>(currentPageNum,8);
        LambdaQueryWrapper<Comment> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Comment::getCid,cid);
        return this.page(commentPage,queryWrapper);
    }
}
