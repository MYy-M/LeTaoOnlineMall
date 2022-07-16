package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.LtOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.SearchOrderParam;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 骑手反叛联盟
 * @since 2022-06-30
 */
public interface LtOrderService extends IService<LtOrder> {

    int getOrderState(@Param("oid") long id);

    Boolean deleteOrder(@Param("oid") long id);

    int modifyOrderState(@Param("id") long id,@Param("state") int state);

    Page getOrderListById(long id, int current);

    Page getOrderList(int current);

    Result getStoreListByCondition( SearchOrderParam searchOrderParamm);
}
