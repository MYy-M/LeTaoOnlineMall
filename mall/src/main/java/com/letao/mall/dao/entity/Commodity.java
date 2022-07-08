package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
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
public class Commodity implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "cid", type = IdType.ASSIGN_ID)
    private Long cid;

    private String cname;

    private BigDecimal cprice;

    private Integer cnum;

    //规格列表
    private String attribute_list;

    //商品介绍
    private String cdetail;

    //图片
    private String cpicture;

    private Long categoryId;


}
