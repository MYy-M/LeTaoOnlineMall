package com.letao.mall.vo.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;

@Data
public class SpecsParam {
    private MultipartFile pic;

    private BigDecimal price;

    private String spData;

    private Integer stock;
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long cid;
}
