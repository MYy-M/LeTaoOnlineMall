package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Cart;
import com.letao.mall.dao.entity.Commodity;
import com.letao.mall.dao.entity.CommoditySpecs;
import com.letao.mall.dao.mapper.CartMapper;
import com.letao.mall.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.service.CommodityService;
import com.letao.mall.service.CommoditySpecsService;
import com.letao.mall.util.PicUtils;
import com.letao.mall.vo.CartVo;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.PageParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

    @Autowired
    private CommoditySpecsService commoditySpecsService;

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private PicUtils picUtils;

    @Override
    public Result addToCart(Cart cart) throws IOException {
        Long uid = cart.getUid();
        Long csId = cart.getCsId();//此处应该是规格表的id
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,uid).eq(Cart::getCsId,csId);
        Cart c = this.getOne(queryWrapper);
        if(c==null){
            if(this.save(cart)){
                CartVo cartVo = new CartVo();
                Cart cv = this.getOne(queryWrapper);
                cartVo.setCartId(cv.getCartId());
                cartVo.setCsId(csId);
                cartVo.setNum(cv.getCartNum());
                CommoditySpecs commoditySpecs = commoditySpecsService.getById(csId);
                Long cid = commoditySpecs.getCid();
                cartVo.setCid(cid);
                cartVo.setCPicture(picUtils.encrypt(commoditySpecs.getCpicture()));
                cartVo.setPrice(commoditySpecs.getCprice());
                cartVo.setCname(commodityService.getById(cid).getCname());
                return Result.success(cartVo);
            }
        }else{
            LambdaUpdateWrapper<Cart> updateWrapper=new LambdaUpdateWrapper<>();
            updateWrapper.eq(Cart::getCartId,c.getCartId());
            updateWrapper.set(Cart::getCartNum,c.getCartNum()+1);
            if(this.update(updateWrapper)) {
                return Result.success(c.getCartId()+"");
            }
        }
        return Result.fail(ErrorCode.PARAMS_ERROR.getCode(),ErrorCode.PARAMS_ERROR.getMsg());
    }

    @Override
    public Result showCart(PageParam pageParam) {
        Page<Cart> cartPage = new Page<>(pageParam.getPage(),pageParam.getPageSize());
        LambdaQueryWrapper<Cart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cart::getUid,pageParam.getUid());
        return Result.success(this.page(cartPage,queryWrapper));
    }
}
