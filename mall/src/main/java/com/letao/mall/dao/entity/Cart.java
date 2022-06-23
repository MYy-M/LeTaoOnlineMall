package com.letao.mall.dao.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
public class Cart implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "cartId", type = IdType.ASSIGN_ID)
    private Integer cartId;

    private Integer uid;

    private Integer cid;

    //购买数量
    private Integer cartNum;

    //value = ""1"表示“可以购买”，”0“表示“商品已失效”
    private Integer commodityState;


}
