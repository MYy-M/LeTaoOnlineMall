package com.letao.mall.controller.Consumer;

import com.letao.mall.service.RecommendService;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@RestController
@RequestMapping("/mall/consumer/recommend")
@CrossOrigin
public class RecomendController {

    @Autowired
    private RecommendService recommendService;

    /**
     * 获取轮播图
     * @return
     */
    @PostMapping("/carousel")
    public Result getRecommend() throws IOException {
        return recommendService.getCarousel();
    }
}
