package com.letao.mall.vo.param;

import lombok.Data;

import java.util.Date;

@Data
public class SearchOrderParam {
    private Long orderID;
    private int state;
    private Date date;
    private int pagenum = 1;
    private int pagesize = 10;
}
