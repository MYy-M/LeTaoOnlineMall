package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CommodityVo {
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long csId;

    private String pic;

    private BigDecimal cprice;
}
