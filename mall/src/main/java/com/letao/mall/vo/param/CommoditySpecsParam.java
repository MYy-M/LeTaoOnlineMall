package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.List;

@Data
public class CommoditySpecsParam {

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;

    private List<SpecsParam> specsList;
}
