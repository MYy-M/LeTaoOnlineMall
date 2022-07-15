package com.letao.mall.vo.param;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class CpictureParam {
    private long id;
    private MultipartFile file;
}
