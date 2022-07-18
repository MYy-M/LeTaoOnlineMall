package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Collection;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.mapper.CollectionMapper;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CollectionService;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectionServiceImpl extends ServiceImpl<CollectionMapper, Collection> implements CollectionService {
}
