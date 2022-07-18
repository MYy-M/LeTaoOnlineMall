package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.dao.mapper.CollectionMapper;
import com.letao.mall.service.CollectionService;
import org.springframework.stereotype.Service;

@Service
public class CollectionServiceImpl extends ServiceImpl<CollectionMapper, Collection> implements CollectionService {
}
