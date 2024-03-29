package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class LtOrder implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "order_id", type = IdType.ASSIGN_ID)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long orderId;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long uid;

    private String address;

    private Date time;

    private BigDecimal price;

    //物流情况
    private String logistic;

    //“0”表示待付款，
    //“1”表示待发货
    //“2”表示待收货
    //“3”表示待评价
    //“4”表示已完成
    private Integer orderState;


}
