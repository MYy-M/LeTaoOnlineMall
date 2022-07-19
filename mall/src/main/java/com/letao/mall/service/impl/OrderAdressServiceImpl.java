package com.letao.mall.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Consumer;
import com.letao.mall.dao.entity.OrderAddress;
import com.letao.mall.dao.mapper.ConsumerMapper;
import com.letao.mall.dao.mapper.OrderAddressMapper;
import com.letao.mall.service.ConsumerService;
import com.letao.mall.service.OrderAddressService;
import com.letao.mall.service.TokenService;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class OrderAdressServiceImpl extends ServiceImpl<OrderAddressMapper,OrderAddress> implements OrderAddressService {

}
