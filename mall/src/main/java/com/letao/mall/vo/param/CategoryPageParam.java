package com.letao.mall.vo.param;

import lombok.Data;

@Data
public class CategoryPageParam {
    private long id;
    private int current;
    private int pageSize;
}
