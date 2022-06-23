package com.letao.mall.dao.entity;

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
public class User implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "uid", type = IdType.AUTO)
    private Integer uid;

    private String uname;

    private String upassword;

    //头像
    private Blob upicture;

    //邮箱
    private String umail;

    //用户地址
    private String uaddress;

    //电话号码
    private String uphone;

    //vip等级
    private Integer ulevel;


}
