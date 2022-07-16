package com.letao.mall.controller.admin;


import com.letao.mall.dao.entity.AttributeKey;
import com.letao.mall.dao.entity.AttributeValue;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.service.AttributeKeyService;
import com.letao.mall.service.AttributeValueService;
import com.letao.mall.service.CategoryService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.CategoryPageParam;
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
@CrossOrigin
public class CategoryController {

    @Autowired
    private AttributeKeyService aks;

    @Autowired
    private AttributeValueService avs;

    @Autowired
    private CategoryService cgs;
    /**
     * 获得所有第一级分类
     * @return
     */
    @PostMapping("/getCategoryFirst")
    public Result getCategoryFirst(@RequestParam int current , @RequestParam int pageSize){

        return Result.success(cgs.getCategoryFirst(current,pageSize));
    }

    /**
     * 根据一级分类id找二级分类
     * @param cParam
     * @return
     */

    @PostMapping("/getCategorySecond")
    public Result getCategorySecond(@RequestBody CategoryPageParam cParam){
        return Result.success(cgs.getCategorySecond(cParam.getId(),cParam.getCurrent(),cParam.getPageSize()));
    }
    @PostMapping("/getAllCategorySecond")
    public Result getAllCategorySecond(@RequestBody CategoryPageParam cParam){
        return Result.success(cgs.getAllCategorySecond(cParam.getCurrent(),cParam.getPageSize()));
    }
    @GetMapping("/getCategoryByID")
    public Result getCategoryByID(Long id){
        if(id!=null)
           return Result.success(cgs.getById(id));
        else{
            return Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
        }
    }
    /**
     * 添加分类（以后再写看是否有重名，若重名则拒绝添加）
     * @param category
     * @return
     */
    @PostMapping("/add")
    public Result addCategory(@RequestBody Category category){
        return cgs.save(category)?Result.success(new Boolean(true)):Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    /**
     * 修改分类
     * @param category
     * @return
     */
    @PostMapping("/modify")
    public Result modifyCategory(@RequestBody Category category){
        return cgs.updateById(category)?Result.success(new Boolean(true)):Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
    }

    /**
     * 删除类别
     * 所以判断当前此类别是否具有子类别，如果all子类别商品数量为零，可以删除
     * 1删除成功，
     * 0删除失败
     * -1有子类不能删
     */
    @GetMapping("/delete")
    public Result deleteCategory(Long id){
        if(cgs.getAllSecondCategory(id).isEmpty()&&id!=null){
            return cgs.deleteCategoryByid(id)>0?Result.success(new Boolean(true)):Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
        }else{
            //有子类不能删
            return Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
        }
    }

    /**
     * 根据二级分类id查找属性列表
     * @param cParam
     * @return
     */
    @PostMapping("/getAttributeKeyById")
    public Result getAttributeKeyById(@RequestBody CategoryPageParam cParam){
        return Result.success(aks.getAttributeByCategoryID(cParam.getId(),cParam.getCurrent(),cParam.getPageSize()));
    }
    /**
     * 添加新属性
     * @param attributeKey
     * @return
     */
    @PostMapping("/addAttributeKey")
    public Result addAttributeKey(@RequestBody AttributeKey attributeKey){
        return aks.save(attributeKey)?Result.success(new Boolean(true)):Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    @PostMapping("/modifyAttributeKey")
    public Result modifyAttributeKey(@RequestBody AttributeKey attributeKey){
        return aks.updateById(attributeKey)?Result.success(new Boolean(true)):Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
    }
    /**
     * 删除（先看有没有value）
     * @param id
     * @return
     */
    @PostMapping("/deleteAttributeKey")
    public Result deleteAttributeKey(Long id){
        if(!avs.getAttributeValueByKey(id).isEmpty()){
            return aks.deleteAttributeKey(id)?Result.success(new Boolean(true)):Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
        }
        return Result.fail(10001,"删除失败");
    }
    /**
     * 根据属性名找属性值
     * @param id
     * @return
     */
    @PostMapping("/getAttributeValueByKey")
    public Result getAttributeValueByKey(Long id){
        List<AttributeValue> list=avs.getAttributeValueByKey(id);
        return list.isEmpty()?Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg()):Result.success(list);
    }

    @PostMapping("/addAttributeValue")
    public Result addAttributeValue(@RequestBody AttributeValue attributeValue){
        return avs.save(attributeValue)?Result.success(new Boolean(true)):Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    @PostMapping("/modifyAttributeValue")
    public Result modifyAttributeValue(@RequestBody AttributeValue attributeValue){
        return avs.updateById(attributeValue)?Result.success(new Boolean(true)):Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
    }
    @GetMapping("/deleteAttributeValue")
    public Result deleteAttributeValue(Long id){
        return avs.deleteAttributeValue(id)?Result.success(new Boolean(true)):Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }



}

