package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.letao.mall.dao.entity.Orderitem;
import lombok.Data;

import java.util.Date;
import java.util.List;
@Data
public class OrderVo {
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date order_time;
    private List<Orderitem> itemList;
}