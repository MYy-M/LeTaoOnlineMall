package com.letao.mall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.letao.mall.dao.entity.Recommend;
import com.letao.mall.dao.mapper.RecommendMapper;
import com.letao.mall.service.RecommendService;
import com.letao.mall.util.PicUtils;
import com.letao.mall.util.UploadPic;
import com.letao.mall.vo.ErrorCode;
import com.letao.mall.vo.RecommendVo;
import com.letao.mall.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class RecommendServiceImpl extends ServiceImpl<RecommendMapper, Recommend> implements RecommendService {

    @Autowired
    private RecommendMapper recommendMapper;

    @Autowired
    private UploadPic uploadPic;

    @Autowired
    private  PicUtils picUtils;

    @Override
    public Result recommend(long cid, MultipartFile file) throws IOException {
        Recommend recommend = this.getOne(new LambdaQueryWrapper<Recommend>().eq(Recommend::getCid, cid));
        if (recommend != null) {
            return Result.fail(ErrorCode.RECOMMEND_EXIST.getCode(), ErrorCode.RECOMMEND_EXIST.getMsg());
        } else {
            String imageUrl = uploadPic.upPic(file);
            Recommend recommendA = new Recommend();
            recommendA.setCid(cid);
            recommendA.setCpicture(imageUrl);
            return Result.success(this.save(recommendA));
        }
    }

    @Override
    public Result getCarousel() throws IOException {
        List<Recommend> recommends = recommendMapper.selectList(null);
        Recommend recommend;
//        HashMap<String, Object> map = new HashMap<>(2);
//        List<Map<String,Object>> mapList = new ArrayList<>();
        List<RecommendVo> list = new ArrayList<>();
        for (int i = 0; i < recommends.size(); i++) {
            recommend = recommends.get(i);
            String imageUrl = recommend.getCpicture();
            String data = picUtils.encrypt(imageUrl);
            RecommendVo recommendVo = new RecommendVo();
            recommendVo.setRid(recommend.getRid());
            recommendVo.setCid(recommend.getCid());
            recommendVo.setImage(data);
            list.add(recommendVo);
//            map.put("image",data);
//            mapList.add(map);
        }
        //return Result.success(mapList);
        return Result.success(list);
    }


}



