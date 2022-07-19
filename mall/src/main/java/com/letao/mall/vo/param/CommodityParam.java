package com.letao.mall.vo.param;


import lombok.Data;

import java.util.List;

@Data
public class CommodityParam {
    private List<Long> categoryID;

    private Integer currentPage;

    private Integer pageSize;
}
