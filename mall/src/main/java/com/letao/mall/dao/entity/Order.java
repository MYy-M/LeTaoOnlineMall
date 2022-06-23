package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;

/**
 * <p>
 * 
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-23
 */
@Data
public class Order implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "orderId", type = IdType.ASSIGN_ID)
    private Integer orderId;

    private Integer uid;

    private String address;

    private Date time;

    private BigDecimal price;

    //物流情况
    private String logistic;

    //“0”表示未收到，“1”表示已收到
    private Integer orderState;


}
