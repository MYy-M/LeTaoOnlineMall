package com.letao.mall.vo.param;

import com.letao.mall.dao.entity.LtOrder;
import com.letao.mall.dao.entity.Orderitem;
import lombok.Data;

import java.util.ArrayList;
@Data
public class OrderParam {
    private LtOrder ltOrder;

    private Orderitem[] itemList=new Orderitem[3];
}
