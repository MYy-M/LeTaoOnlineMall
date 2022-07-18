package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.dao.entity.Admin;
import com.letao.mall.dao.entity.Recommend;
import com.letao.mall.vo.Result;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface RecommendService extends IService<Recommend> {
    Result recommend(long cid, MultipartFile file) throws IOException;

    Result getCarousel() throws IOException;

}
