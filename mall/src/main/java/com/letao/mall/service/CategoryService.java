package com.letao.mall.service;

import com.letao.mall.dao.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface CategoryService extends IService<Category> {

<<<<<<< Updated upstream
=======
    Page getCategoryFirst(int current);

    Page getCategorySecond(@Param("pid") long pid, int current,int pageSize);

    Page getAllCategorySecond(int current,int pageSize);
    List<Category> getAllSecondCategory(long id);

    int deleteCategoryByid(@Param("id") long id);
>>>>>>> Stashed changes
}
