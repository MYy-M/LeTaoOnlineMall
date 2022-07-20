package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.letao.mall.dao.entity.Orderitem;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
@Data
public class OrderVo {
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date orderTime;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long orderId;

    private BigDecimal total;

    private List<Orderitem> itemList;
}