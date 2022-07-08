package com.letao.mall.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.service.CommodityService;
import com.letao.mall.util.UploadPic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/admin/commodity")
public class ACommodityController {

    @Autowired
    private CommodityService cms;
    @Autowired
    private UploadPic uploadPic;
    private int pSize=10;

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
    @RequestMapping("/page/{pnum}")
    public IPage getPage(@PathVariable("pnum") long pnum){
        Page<Commodity> page=new Page<>(pnum,2);
        return cms.page(page);
    }

    /**
     * 添加商品(商品名，属性列表，价格都相同就不能添加)
     * 先加商品，成功再加图片
     * @param cm
     * @return
     */
    @RequestMapping("/add")
    public Boolean addCommodity(MultipartFile file, Commodity cm) throws Exception{

        if(cms.isExisted(cm.getCname(),cm.getAttribute_list(),cm.getCprice())){
            if(cms.save(cm)&&!file.isEmpty()){
                String urlImg=uploadPic.upPic(file);
                return cms.setPicture(cm.getCid(),urlImg);
            }
            return true;
        }
        return false;
    }

    /**
     * 修改图片
     * @param id(商品id)
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping("/modifyCpicture")
    public Boolean modifyCpicture(long id,MultipartFile file) throws IOException{
        String urlImg=uploadPic.upPic(file);
        return cms.setPicture(id,urlImg);
    }

    /**
     * 显示图片
     * @param cid
     * @param response
     */
    @RequestMapping("/loadCpicture")
    public void loadCpicture(long cid, HttpServletResponse response){
        String cpicture=cms.getPicture(cid);
        uploadPic.load(cpicture,response);
    }

    /**
     * 根据id删除商品（只把cnum改为0）
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public Boolean deleteCommodity(Integer id){
        if(cms.deleteCommodity(id)>0){
            return true;
        }
        return false;
    }

    /**
     * 根据id修改商品属性
     * @param cm
     * @return
     */
    @RequestMapping("/modify")
    public Boolean modifyCommodityAttribute(Commodity cm){
        return cms.updateById(cm);
    }
}

