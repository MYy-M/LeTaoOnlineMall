package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class CommodityVo {
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;
}
