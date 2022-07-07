package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
public class Orderitem implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "Order_id", type = IdType.ASSIGN_ID)
    private Long orderId;

    private Long csId;

    //单个商品购买数量
    private Integer cnum;

    //商品单/总价(同一件商品的总价)
    private BigDecimal cprice;


}
