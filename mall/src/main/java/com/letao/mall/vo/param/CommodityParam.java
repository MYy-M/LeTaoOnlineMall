package com.letao.mall.vo.param;

import lombok.Data;

@Data
public class CommodityParam {
    private Long cid;
    private Long categoryId;
    private String cname;
    private int pageNum;
    private int pageSize;

}
