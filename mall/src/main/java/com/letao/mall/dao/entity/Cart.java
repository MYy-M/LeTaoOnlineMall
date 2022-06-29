package com.letao.mall.dao.entity;

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
public class Cart implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "cart_id", type = IdType.AUTO)
    private Integer cartId;

    private Integer uid;

    private Integer cid;

   //购买数量
    private Integer cartNum;

    //"1"表示“可以购买”，”0“表示“商品已失效”
    private Integer commodityState;


}
