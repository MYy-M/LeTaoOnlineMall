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
public class Admin implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "aid", type = IdType.ASSIGN_ID)
    private Integer aid;

    private String ausername;

    private String apassword;

    //权限级别
    private Integer alevel;


}
