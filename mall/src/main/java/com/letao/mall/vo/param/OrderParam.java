package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.letao.mall.vo.CartVo;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class OrderParam {
    List<CartVo> products;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long uid;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long addressId;
    private BigDecimal totalPrice;
}
