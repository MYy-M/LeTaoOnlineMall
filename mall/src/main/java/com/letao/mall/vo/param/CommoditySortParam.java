package com.letao.mall.vo.param;

import lombok.Data;

@Data
public class CommoditySortParam {
    private String cmname;
    private int pagenum = 1;
    private int pagesize = 10;
}
