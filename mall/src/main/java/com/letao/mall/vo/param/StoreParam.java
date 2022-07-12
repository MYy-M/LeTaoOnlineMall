package com.letao.mall.vo.param;

import lombok.Data;

@Data
public class StoreParam {
    private String storeadress;
    private String storename;
    private String storephone;
    private int pagenum = 1;
    private int pagesize = 10;
}
