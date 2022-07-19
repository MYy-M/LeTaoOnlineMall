package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class OrderParam {

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long id;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long order_id;

    private Date order_time;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long product_id;

    private String product_name;

    private Integer product_num;

    private String product_picture;

    private BigDecimal product_price;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long user_id;





}
