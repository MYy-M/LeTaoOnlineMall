package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class AttributeParam {
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private long id;

    private String attributeKey;

    private String attributeValue;
}
