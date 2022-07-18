package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartVo {
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cartId;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long csId;

    private String cname;

    private String cPicture;

    private BigDecimal price;

    private int num;

    private boolean check = false;
}
