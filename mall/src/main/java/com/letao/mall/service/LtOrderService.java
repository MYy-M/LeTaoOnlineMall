package com.letao.mall.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.letao.mall.dao.entity.LtOrder;
import com.baomidou.mybatisplus.extension.service.IService;
import com.letao.mall.dao.entity.Orderitem;
import com.letao.mall.vo.Result;
import com.letao.mall.vo.param.SearchOrderParam;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

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

    Page getOrderListById(long id, int current,int pageSize);

    Page getOrderList(int current,int pageSize);

    Result getStoreListByCondition( SearchOrderParam searchOrderParamm);

    List<Orderitem> getOrderList(@Param("order_id") long order_id);

    Date getTime(long id);

    List<Long> getOrderId(@Param("uid") long uid);
}
