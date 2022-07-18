package com.letao.mall.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.entity.Recommend;
import com.letao.mall.service.CommodityService;
import com.letao.mall.service.RecommendService;
import com.letao.mall.util.UploadPic;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.AddCommodityParam;
import com.letao.mall.vo.param.CpictureParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/commodity")
@CrossOrigin
public class ACommodityController {

    @Autowired
    private CommodityService cms;

    @Autowired
    private UploadPic uploadPic;

    @Autowired
    private RecommendService recommendService;

    private int pSize = 10;

//    /**
//     * 返回总页数
//     * * @return
//     */
//    @RequestMapping("/pageTotal")
//    public int getAdminTotalPage(){
//        int n=cms.countAdminTotal();
//        return (n%10!=0) ? (n/10+1) : (n/10);
//    }
    /**
     * 分页显示商品
     * @return
     */
  /*  @RequestMapping("/page/{pnum}")
    public IPage getPage(@PathVariable("pnum") long pnum){
        Page<Commodity> page=new Page<>(pnum,2);
        return cms.page(page);
    }*/

    /**
     * 添加商品(商品名，属性列表，价格都相同就不能添加)
     *
     * @param cm
     * @return
     */
    @PostMapping("/add")
    public Result addCommodity(@RequestBody Commodity cm) {
        if (cms.isExisted(cm.getCname(), cm.getAttribute_list(), cm.getCprice())) {
            return cms.save(cm) ? Result.success(new Boolean(true)) : Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
        }
        return Result.fail(ErrorCode.ADD_ERROR.getCode(), ErrorCode.ADD_ERROR.getMsg());
    }

    /**
     * 修改图片
     *
     * @param file
     * @param id
     * @return
     * @throws IOException
     */
    @PostMapping("/modifyCpicture")
    public Result modifyCpicture(long id, MultipartFile file) throws IOException {
        String urlImg = uploadPic.upPic(file);
        return cms.setPicture(id, urlImg) ? Result.success(new Boolean(true)) : Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
    }

    /**
     * 显示图片
     *
     * @param cid
     * @param response
     */
    @PostMapping("/loadCpicture")
    public void loadCpicture(long cid, HttpServletResponse response) {
        String cpicture = cms.getPicture(cid);
        uploadPic.load(cpicture, response);
    }

    /**
     * 根据id删除商品（只把cnum改为0）
     *
     * @param id
     * @return
     */
    @PostMapping("/delete")
    public Result deleteCommodity(long id) {
        if (cms.deleteCommodity(id) > 0) {
            return Result.success(new Boolean(true));
        }
        return Result.fail(ErrorCode.DELETE_ERROR.getCode(), ErrorCode.DELETE_ERROR.getMsg());
    }

    /**
     * 根据id修改商品属性
     *
     * @param cm
     * @return
     */
    @PostMapping("/modify")
    public Result modifyCommodityAttribute(@RequestBody Commodity cm) {

        return cms.updateById(cm) ? Result.success(new Boolean(true)) : Result.fail(ErrorCode.MODIFY_ERROR.getCode(), ErrorCode.MODIFY_ERROR.getMsg());
    }


    /**
     * 添加推荐商品
     * @param cid
     * @param file
     * @return
     * @throws IOException
     */
    @PostMapping("/recommend")
    public Result recommendCommodity(long cid, MultipartFile file) throws IOException {
        return recommendService.recommend(cid,file);
    }
}

