package com.letao.mall.controller.admin;


import com.letao.mall.dao.entity.AttributeKey;
import com.letao.mall.dao.entity.AttributeValue;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.service.AttributeKeyService;
import com.letao.mall.service.AttributeValueService;
import com.letao.mall.service.CategoryService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.AttributeParam;
import com.letao.mall.vo.param.CategoryPageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
public class ACategoryController {
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
    @PostMapping("/getCategoryFirst")
    public Result getCategoryFirst(@RequestParam int current){
        return Result.success(cgs.getCategoryFirst(current));
    }

    /**
     * 根据一级分类id找二级分类
     * @param cParam
     * @return
     */

    @PostMapping("/getCategorySecond")
    public Result getCategorySecond(@RequestBody CategoryPageParam cParam){
        return Result.success(cgs.getCategorySecond(cParam.getId(),cParam.getCurrent()));
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
    public Result deleteCategory(long id){
        if(cgs.getAllSecondCategory(id).isEmpty()){
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
        return Result.success(aks.getAttributeByCategoryID(cParam.getId(),cParam.getCurrent()));
    }
    /**
     * 添加新属性
     * @param attributeKey
     * @return
     */
    /**
     * 添加属性和值，输入分类ID，属性key，属性value
     * @param param
     * @return
     */
    @RequestMapping("/addAttributeKey")
    public Result addAttributeKey(@RequestBody AttributeParam param){
        long categoryId= param.getId();
        String key= param.getAttributeKey();
        String values= param.getAttributeValue().replaceAll(" ","");

        if(categoryId==0||key==null||values==null){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        AttributeKey attributeKey=new AttributeKey();
        attributeKey.setCategoryId(categoryId);
        attributeKey.setAttributeName(key);

        //属性名在该分类中已存在就不能添加
        if(aks.getSameKey(categoryId,key)!=null){
            return Result.fail(ErrorCode.KEY_EXIST.getCode(), ErrorCode.KEY_EXIST.getMsg());
        }
        if(!aks.save(attributeKey)){
            /*System.out.println("111");*/
            return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        }
        long keyId=attributeKey.getId();

        //中文分号
        String[] value=values.replaceAll(";","；").split("；");
        ArrayList<AttributeValue> list=new ArrayList<>();
        for(String v:value){
            AttributeValue attributeValue=new AttributeValue();
            attributeValue.setAttributeValue(v);
            attributeValue.setAttributeId(keyId);
            list.add(attributeValue);
        }
        if(avs.saveBatch(list)){
            return Result.success(true);
        }else{
            /*System.out.println("222");*/
            return Result.fail(ErrorCode.ADD_VALUE_ERROR.getCode(), ErrorCode.ADD_VALUE_ERROR.getMsg());
        }
    }

    /**
     * 修改属性，输入属性key的id，key的name，key的value
     * @param param
     * @return
     */
    @RequestMapping("/modifyAttribute")
    public Result modifyAttribute(@RequestBody AttributeParam param){
        long id= param.getId();
        String key= param.getAttributeKey();
        String values= param.getAttributeValue().replaceAll(" ","");
        if(id==0||key==null||values==null){
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        AttributeKey attributeKey=new AttributeKey();
        attributeKey.setId(id);
        attributeKey.setAttributeName(key);
        if(!aks.updateById(attributeKey)){
            return Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
        }

        avs.deleteAttributeValue(id);

        String[] value=values.split("；");
        ArrayList<AttributeValue> list=new ArrayList<>();
        for(String v:value){
            AttributeValue attributeValue=new AttributeValue();
            attributeValue.setAttributeValue(v);
            attributeValue.setAttributeId(id);
            list.add(attributeValue);
        }
        if(avs.saveBatch(list)){
            return Result.success(true);
        }else{
            /*System.out.println("222");*/
            return Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
        }

    }

    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/deleteAttributeKey")
    public Result deleteAttributeKey(long id){
        return aks.deleteAttributeKey(id)&&avs.deleteAttributeValue(id)?
                Result.success(true):Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }
    /**
     * 根据属性名找属性值
     * @param id
     * @return
     */
    @PostMapping("/getAttributeValueByKey")
    public Result getAttributeValueByKey( long id){
        List<AttributeValue> list=avs.getAttributeValueByKey(id);
        return list.isEmpty()?Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg()):Result.success(list);
    }

    @PostMapping("/addAttributeValue")
    public Result addAttributeValue(@RequestBody AttributeValue attributeValue){
        return avs.save(attributeValue)?Result.success(new Boolean(true)):Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }



}

