package com.letao.mall.vo.param;

import com.letao.mall.dao.entity.Commodity;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class AddCommodityParam {
    private MultipartFile file;
    private Commodity cm;
}
