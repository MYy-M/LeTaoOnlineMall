package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
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

    @JsonSerialize(using= ToStringSerializer.class)
    @TableId(value = "cid", type = IdType.ASSIGN_ID)
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;

    private String cname;

    private BigDecimal cprice;

    private String cpicture;

    private Integer cnum;

    //规格列表

    private String attributeList;

    //商品介绍
    private String cdetail;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long categoryId;

    private Integer csales;

    private Integer isRecommend = 0;

}
