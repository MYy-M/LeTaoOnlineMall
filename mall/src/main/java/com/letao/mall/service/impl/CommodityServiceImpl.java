package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Category;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.entity.Store;
import com.letao.mall.dao.mapper.CommodityMapper;
import com.letao.mall.service.CategoryService;
import com.letao.mall.service.CommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.util.PicUtils;
import com.letao.mall.vo.CommodityVoByCategory;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.SearchVo;
import com.letao.mall.vo.param.CommodityParam;
import lombok.val;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PicUtils picUtils;


    public int deleteCommodity(long id) {
        return commodityMapper.deleteCommodity(id);
    }

    public int countAdminTotal() {
        return commodityMapper.countAdminTotal();
    }

    /**
     * 返回cnum>0的总数
     *
     * @return
     */
    public int countCusTotal() {
        return commodityMapper.countCusTotal();
    }

    public Boolean isExisted(String cname, String attributeList, BigDecimal price) {
        QueryWrapper<Commodity> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .eq("cprice", price)
                .eq("cname", cname)
                .eq("attribute_list", attributeList);
        if (commodityMapper.selectCount(queryWrapper) > 0) {
            return false;
        }
        return true;
    }

    public Boolean setPicture(long id, String cpicture) {
        return commodityMapper.setPicture(id, cpicture);
    }

    public String getPicture(@Param("id") long id) {
        return commodityMapper.getPicture(id);
    }


    @Override
    public Result showCommodityByCategory(Long categoryId) throws IOException {
        return showCommodityByCategory(categoryId, false);
    }



    public Result showCommodityByCategory(Long categoryId, boolean isSort) throws IOException {
        List<Category> list = categoryService.getAllSecondCategory(categoryId);
        List<Commodity> commodityList = new ArrayList<>();
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Commodity::getCategoryId, categoryId);
        if (list == null || list.size() == 0) {
            if (isSort) {
                commodityList.addAll(encryptImage(commodityMapper.selectList(queryWrapper.orderByDesc(Commodity::getCsales))));
            } else {
                commodityList.addAll(encryptImage(commodityMapper.selectList(queryWrapper)));
            }
        } else {
            if (isSort) {
                for (int i = 0; i < list.size(); i++) {
                    Long secondId = list.get(i).getCategoryId();
                    commodityList.addAll(encryptImage(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId).orderByDesc(Commodity::getCsales))));
                }
            } else {
                for (int i = 0; i < list.size(); i++) {
                    Long secondId = list.get(i).getCategoryId();
                    commodityList.addAll(encryptImage(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId))));
                }
            }

        }
        if (commodityList != null && commodityList.size() != 0) {
            return Result.success(commodityList);
        } else {
            return Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg());
        }
    }

    public List<Commodity> encryptImage(List<Commodity> list) throws IOException {
        String imageUrl;
        int index;
        for (int i = 0; i < list.size(); i++) {
            index = i;
            imageUrl = list.get(index).getCpicture();
            list.get(index).setCpicture(picUtils.encrypt(imageUrl));
        }
        return list;
    }


    @Override
    public Result showCommodityByCategory(String categoryName) throws IOException {
        Category category = categoryService.getOne(new LambdaQueryWrapper<Category>().eq(Category::getCategoryName, categoryName));
        List<Commodity> commodityList;
        if (category == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        } else {
            Long categoryId = category.getCategoryId();
            List<Category> list = categoryService.getAllSecondCategory(categoryId);
            commodityList = new ArrayList<>();
            LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Commodity::getCategoryId, categoryId);
            if (list == null || list.size() == 0) {
                commodityList.addAll(encryptImage(commodityMapper.selectList(queryWrapper.orderByDesc(Commodity::getCsales).last("limit 7"))));

            } else {
                for (int i = 0; i < list.size(); i++) {
                    Long secondId = list.get(i).getCategoryId();
                    commodityList.addAll(encryptImage(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId).orderByDesc(Commodity::getCsales).last("limit 7"))));
                }

            }

        }
        if (commodityList != null && commodityList.size() != 0) {
            return Result.success(commodityList);
        } else {
            return Result.fail(ErrorCode.SEARCH_ERROR.getCode(), ErrorCode.SEARCH_ERROR.getMsg());
        }
    }

    @Override
    public Result getHotProduct(String categoryName) throws IOException {
        if (categoryName == null) {
            return Result.success(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().orderByDesc(Commodity::getCsales).last("limit 0,10")));
        } else {
            Category category = categoryService.getOne(new LambdaQueryWrapper<Category>().eq(Category::getCategoryName, categoryName));
            if (category == null) {
                return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
            } else {
                Long categoryId = category.getCategoryId();
                return showCommodityByCategory(categoryId, true);
            }
        }
    }

    @Override
    public Page getCommodityByC(CommodityParam commodityParam){
        Long categoryId=commodityParam.getCaId();
        Long cid=commodityParam.getCid();
        String cname=commodityParam.getCname();
        Page<Commodity> commodityPage = new Page<>(commodityParam.getCurrentPage(), commodityParam.getPageSize());
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        if(cname!=null){
            queryWrapper.like(Commodity::getCname,cname);
        }
        if(cid!=null){
            queryWrapper.like(Commodity::getCid,cid);
        }
        if(categoryId!=null) {
            queryWrapper.eq(Commodity::getCategoryId, categoryId);
        }
        return commodityMapper.selectPage(commodityPage,queryWrapper);
    }

    public Result showCommodityByCategoryId(CommodityParam commodityParam) throws IOException {
        return getCommodityList(commodityParam);
    }


    public Result getCommodityList(CommodityParam commodityParam) throws IOException {
        Integer currentPage = commodityParam.getCurrentPage();
        Integer pageSize = commodityParam.getPageSize();
        List<Commodity> queryList;
        if (currentPage == null || pageSize == null) {
            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
        }
        if(commodityParam.getCategoryID().size()!=0){
            System.out.println("nuidninijdsnkcjsdpc---------"+commodityParam.getCategoryID().get(0));
            Long categoryId = commodityParam.getCategoryID().get(0);
            queryList = this.list(getCondition(categoryId));
        }else{
            queryList = this.list(null);
        }
        int total = queryList.size();
        System.out.println(queryList);
        List<Commodity> resultList = listByCurrentNum(queryList,currentPage,pageSize);
        for (int i = 0; i < resultList.size(); i++) {
            String imgUrl = resultList.get(i).getCpicture();
            resultList.get(i).setCpicture(picUtils.encrypt(imgUrl));
        }
        CommodityVoByCategory commodity = new CommodityVoByCategory();
        commodity.setList(resultList);
        commodity.setTotal(total);
        return Result.success(commodity);
    }


    public List<Commodity> listByCurrentNum(List<Commodity> queryList,Integer currentPage,Integer pageSize){
        List<Commodity> resultList = new ArrayList<>();
        System.out.println(queryList.size());
        int pageNum = (int)Math.ceil(queryList.size()*1.0/pageSize*1.0);
        System.out.println(pageNum+"-------------------------------");
        if(currentPage==pageNum){
            for (int i = (currentPage-1)*pageNum; i < queryList.size(); i++) {
                resultList.add(queryList.get(i));
            }
        }else{
            for (int i = (currentPage-1)*pageNum; i < (currentPage-1)*pageNum + 15 ; i++) {
                resultList.add(queryList.get(i));
            }
        }

        System.out.println(resultList);
        return resultList;
    }

//    public Result getCommodityList(CommodityParam commodityParam) {
//        Long categoryId = commodityParam.getCategoryID().get(0);
//        Integer currentPage = commodityParam.getCurrentPage();
//        Integer pageSize = commodityParam.getPageSize();
//        if (currentPage == null || pageSize == null) {
//            return Result.fail(ErrorCode.PARAMS_ERROR.getCode(), ErrorCode.PARAMS_ERROR.getMsg());
//        } else {
//            Page<Commodity> page = new Page<>(currentPage, pageSize);
//            if (categoryId == null) {
//                return Result.success(this.page(page, null));
//            } else {
//                //写一下一级分类获取所有二级分类的商品
//                return Result.success(this.page(page,getCondition(categoryId)));
//            }
//        }
//    }

    public LambdaQueryWrapper<Commodity> getCondition(Long categoryId) {
        List<Category> list = categoryService.getAllSecondCategory(categoryId);
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<Commodity> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper.eq(Commodity::getCategoryId, categoryId);
        if (list == null || list.size() == 0) {
            return queryWrapper;
        } else {
            for (int i = 0; i < list.size(); i++) {
                Long secondId = list.get(i).getCategoryId();
                queryWrapper1.eq(Commodity::getCategoryId, secondId);
                //commodityList.addAll(encryptImage(commodityMapper.selectList(new LambdaQueryWrapper<Commodity>().eq(Commodity::getCategoryId, secondId))));
            }
            return queryWrapper1;
        }
    }
    @Override
    public Result showAllCommodityList(CommodityParam commodityParam) throws IOException {
        return getCommodityList(commodityParam);
    }

    @Override
    public Result getCommodityBySearch(CommodityParam commodityParam) throws IOException {
        Long categoryId=commodityParam.getCaId();
        Long cid=commodityParam.getCid();
        String cname=commodityParam.getCname();
        Integer currentPage = commodityParam.getCurrentPage();
        Integer pageSize = commodityParam.getPageSize();
        LambdaQueryWrapper<Commodity> queryWrapper = new LambdaQueryWrapper<>();
        if(cname!=null){
            queryWrapper.like(Commodity::getCname,cname);
        }
        if(cid!=null){
            queryWrapper.like(Commodity::getCid,cid);
        }
        if(categoryId!=null) {
            queryWrapper.eq(Commodity::getCategoryId, categoryId);
        }
        ArrayList<Commodity> commodities = (ArrayList<Commodity>) this.list(queryWrapper);
        ArrayList<Commodity> resultList= new ArrayList<>();
        int pageNum = (int) Math.ceil(commodities.size()*1.0/pageSize*1.0);
        if(currentPage==pageNum){
            for (int i = (currentPage-1)*pageSize; i < commodities.size(); i++) {
                resultList.add(commodities.get(i));
            }
        }else{
            for (int i = (currentPage-1)*pageSize; i < (currentPage-1)*pageSize+pageSize; i++) {
                resultList.add(commodities.get(i));
            }
        }
        SearchVo searchVo = new SearchVo();
        searchVo.setList(encryptImage(resultList));
        searchVo.setTotal(commodities.size());
        return Result.success(searchVo);
    }


}
