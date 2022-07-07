package com.letao.mall.controller.admin;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.AttributeKey;
import com.letao.mall.dao.entity.AttributeValue;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.service.AttributeKeyService;
import com.letao.mall.service.AttributeValueService;
import com.letao.mall.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/category")
public class CategoryController {
    @Autowired
    private CategoryService cgs;

    @Autowired
    private AttributeKeyService aks;

    @Autowired
    private AttributeValueService avs;

    /**
     * 获得所有第一级分类
     * @return
     */
    @RequestMapping("/getCategoryFirst")
    public Page getCategoryFirst(@RequestParam int current){
        return cgs.getCategoryFirst(current);
    }

    /**
     * 根据一级分类id找二级分类
     * @param id
     * @return
     */

    @RequestMapping("/getCategorySecond/{id}")
    public Page getCategorySecond(@PathVariable long id, @RequestParam int current){
        return cgs.getCategorySecond(id,current);
    }

    /**
     * 添加分类（以后再写看是否有重名，若重名则拒绝添加）
     * @param category
     * @return
     */
    @RequestMapping("/add")
    public Boolean addCategory(@RequestBody Category category){
        return cgs.save(category);
    }

    /**
     * 修改分类
     * @param category
     * @return
     */
    @RequestMapping("/modify")
    public Boolean modifyCategory(@RequestBody Category category){
        return cgs.updateById(category);
    }

    /**
     * 删除类别
     * 所以判断当前此类别是否具有子类别，如果all子类别商品数量为零，可以删除
     * 1删除成功，
     * 0删除失败
     * -1有子类不能删
     */
    @RequestMapping("/delete/{id}")
    public int deleteCategory(@PathVariable long id){
        if(cgs.getAllSecondCategory(id).isEmpty()){
            return cgs.deleteCategoryByid(id);
        }else{
            return -1;
        }
    }

    /**
     * 根据二级分类id查找属性列表
     * @param id
     * @param current
     * @return
     */
    @RequestMapping("/getAttributeKeyById/{id}")
    public Page getAttributeKeyById(@PathVariable long id,@RequestParam(defaultValue = "1") int current){
        return aks.getAttributeByCategoryID(id,current);
    }

    /**
     * 添加新属性
     * @param attributeKey
     * @return
     */
    @RequestMapping("/addAttributeKey")
    public Boolean addAttributeKey(@RequestBody AttributeKey attributeKey){
        return aks.save(attributeKey);
    }
    @RequestMapping("/modifyAttributeKey")
    public Boolean modifyAttributeKey(@RequestBody AttributeKey attributeKey){
        return aks.updateById(attributeKey);
    }
    /**
     * 删除（先看有没有value）
     * @param id
     * @return
     */
    @RequestMapping("/deleteAttributeKey/{id}")
    public Boolean deleteAttributeKey(long id){
        if(avs.getAttributeValueByKey(id).isEmpty()){
            return aks.deleteAttributeKey(id);
        }
        return false;
    }
    /**
     * 根据属性名找属性值
     * @param id
     * @return
     */
    @RequestMapping("/getAttributeValueByKey/{id}")
    public List<AttributeValue> getAttributeValueByKey(@PathVariable long id){
        return avs.getAttributeValueByKey(id);
    }
    @RequestMapping("/addAttributeValue")
    public Boolean addAttributeValue(@RequestBody AttributeValue attributeValue){
        return avs.save(attributeValue);
    }
    @RequestMapping("/modifyAttributeValue")
    public Boolean modifyAttributeValue(@RequestBody AttributeValue attributeValue){
        return avs.updateById(attributeValue);
    }
    @RequestMapping("/deleteAttributeValue/{id}")
    public Boolean deleteAttributeValue(@PathVariable long id){
        return avs.deleteAttributeValue(id);
    }


}

