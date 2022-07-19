package com.letao.mall.vo.param;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductParam {

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cartId;

    private Boolean check;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;

    private String cname;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long csId;

    private String cpicture;
    //单个商品购买数量
    private Integer num;

    private BigDecimal price;

}
