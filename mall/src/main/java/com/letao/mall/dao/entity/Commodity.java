package com.letao.mall.dao.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
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
public class Commodity implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "cid", type = IdType.AUTO)
    private Integer cid;

    private String cname;

    private BigDecimal cprice;

    private Integer cnum;

    //商品介绍
    private String cdetail;

    //图片
    private Blob cpicture;

    //类别、标签
    private String categoryId;


}
