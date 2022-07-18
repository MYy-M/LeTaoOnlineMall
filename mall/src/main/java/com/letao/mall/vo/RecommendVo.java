package com.letao.mall.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class RecommendVo {
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long rid;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;

    private String image;
}
