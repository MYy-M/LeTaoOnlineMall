package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface CategoryService extends IService<Category> {

    Page getCategoryFirst(int current);

    Page getCategorySecond(@Param("pid") long pid, int current);

    List<Category> getAllSecondCategory(long id);

    int deleteCategoryByid(@Param("id") long id);
}
