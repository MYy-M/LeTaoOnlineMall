package com.letao.mall.vo.param;

import lombok.Data;

@Data
public class CommodityParam {
    private Long categoryID;
    private String cname;
    private Integer currentPage;
    private Long cid;
    private Integer pageSize;
}
