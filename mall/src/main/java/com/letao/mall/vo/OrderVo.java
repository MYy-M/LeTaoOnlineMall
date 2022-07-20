package com.letao.mall.vo;

import com.letao.mall.dao.entity.Orderitem;
import lombok.Data;

import java.util.Date;
import java.util.List;
@Data
public class OrderVo {
    private Date order_time;
    private List<Orderitem> itemList;
}