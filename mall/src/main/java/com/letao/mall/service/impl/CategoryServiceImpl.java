package com.letao.mall.service.impl;

import com.letao.mall.dao.entity.Category;
import com.letao.mall.dao.mapper.CategoryMapper;
import com.letao.mall.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

<<<<<<< Updated upstream
=======
    @Autowired
    private CategoryMapper cgm;

    public Page getCategoryFirst(int current){
        Page<Category> page=new Page<>(current,5);
        QueryWrapper<Category> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("parent_id",0);
        return cgm.selectPage(page,queryWrapper);

    }

    public Page getCategorySecond(@Param("pid") long pid, int current,int pageSize){
        Page<Category> page=new Page<>(current,pageSize);
        QueryWrapper<Category> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("parent_id",pid);
        return cgm.selectPage(page,queryWrapper);
    }

    @Override
    public Page getAllCategorySecond(int current, int pageSize) {
        Page<Category> page=new Page<>(current,pageSize);
        QueryWrapper<Category> queryWrapper=new QueryWrapper<>();
        queryWrapper.ne("parent_id",0);
        return cgm.selectPage(page,queryWrapper);
    }

    public List<Category> getAllSecondCategory(long id){
        if(id==0){
            return null;
        }else{
            QueryWrapper<Category> queryWrapper=new QueryWrapper<>();
            queryWrapper.eq("parent_id",id);
            return cgm.selectList(queryWrapper);
        }
    }

    public  int deleteCategoryByid(@Param("id") long id){
        return cgm.deleteById(id);
    }
>>>>>>> Stashed changes
}
