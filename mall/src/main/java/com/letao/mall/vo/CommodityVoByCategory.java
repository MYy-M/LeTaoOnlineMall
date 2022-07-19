package com.letao.mall.vo;


import com.letao.mall.dao.entity.Commodity;
import lombok.Data;

import java.util.List;

@Data
public class CommodityVoByCategory {
    List<Commodity> list;
    int total;
}
