package com.letao.mall.controller.Consumer;


import com.letao.mall.service.RecommendService;
import com.letao.mall.util.UploadPic;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/commodity")
@CrossOrigin
public class CCommodityController {

    /**
     * 获取轮播图
     * @return
     */
    @PostMapping("/carousel")
    public Result getRecommend(){
        return null;
    }

}

