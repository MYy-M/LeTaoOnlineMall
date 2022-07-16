package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class LoginParam {
    private long id;
    private String username;
    private String password;
}
