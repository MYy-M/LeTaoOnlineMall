package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.AttributeKey;
import com.letao.mall.dao.mapper.AttributeKeyMapper;
import com.letao.mall.service.AttributeKeyService;
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
public class AttributeKeyServiceImpl extends ServiceImpl<AttributeKeyMapper, AttributeKey> implements AttributeKeyService {

    @Autowired
    private AttributeKeyMapper attributeKeyMapper;

    public Page getAttributeByCategoryID(long id, int current){
        Page<AttributeKey> page=new Page<>(current,5);
        QueryWrapper<AttributeKey> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("category_id",id);
        return attributeKeyMapper.selectPage(page,queryWrapper);
    }
    public Boolean deleteAttributeKey(long id){
        QueryWrapper<AttributeKey> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("id",id);
        if(attributeKeyMapper.delete(queryWrapper)>0){
            return true;
        }else{
            return false;
        }
    }
}
