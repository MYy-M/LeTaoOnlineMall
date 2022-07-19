package com.letao.mall.vo.param;


import lombok.Data;

@Data
public class CommodityParam {
    private Long categoryID;

    private Integer currentPage;

    private Integer pageSize;
}
