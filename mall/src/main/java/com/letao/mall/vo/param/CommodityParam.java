package com.letao.mall.vo.param;

import lombok.Data;

import java.util.List;

@Data
public class CommodityParam {

    private String cname;
    private List<Long> categoryID;
    private Integer currentPage;
    private Long cid;
    private Integer pageSize;
}
