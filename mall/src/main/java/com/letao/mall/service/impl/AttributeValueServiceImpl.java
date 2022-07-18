package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.letao.mall.dao.entity.AttributeValue;
import com.letao.mall.dao.mapper.AttributeValueMapper;
import com.letao.mall.service.AttributeValueService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class AttributeValueServiceImpl extends ServiceImpl<AttributeValueMapper, AttributeValue> implements AttributeValueService {

    @Autowired
    private AttributeValueMapper attributeValueMapper;

    public List<AttributeValue> getAttributeValueByKey(long id){
        QueryWrapper<AttributeValue> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("attribute_id",id);
        return attributeValueMapper.selectList(queryWrapper);
    }

    public Boolean deleteAttributeValue(long id){
        QueryWrapper<AttributeValue> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("attribute_id",id);
        if(attributeValueMapper.delete(queryWrapper)>0){
            return true;
        }
        return false;
    }

}
