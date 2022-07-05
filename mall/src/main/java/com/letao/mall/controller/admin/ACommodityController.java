package com.letao.mall.controller.admin;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    private int pSize=10;

    /**
     * 返回总页数
     * * @return
     */
    @RequestMapping("/pageTotal")
    public int getAdminTotalPage(){
        int n=cms.countAdminTotal();
        return (n%10!=0) ? (n/10+1) : (n/10);
    }
    /**
     * 分页
     * @return
     */
    @RequestMapping("/page/{pnum}")
    public IPage getPage(@PathVariable("pnum") long pnum){
        Page<Commodity> page=new Page<>(pnum,2);
        return cms.page(page);
    }

    /**
     * 添加商品
     * @param cm
     * @return
     */
    @RequestMapping("/add")
    public Boolean addCommodity(@RequestBody Commodity cm){
        return cms.save(cm);
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

