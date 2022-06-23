package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.Comment;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.mapper.CommentMapper;
import com.letao.mall.service.CommentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-23
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

}
