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
public class Category implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "category", type = IdType.ASSIGN_ID)
    private Integer categoryId;

    //分类名称
    private String categoryName;

    //父类id
    private Integer parentId;

    //分类层级
    private Integer categoryLevel;


}
