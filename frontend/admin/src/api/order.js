import request from '@/utils/request'
import axios from 'axios'
export function fetchList(listQuery) {
  return axios({
    url:'http://localhost:8088/mall/admin/lt-order/getOrderListByC',
    method:'post',
    data:{
      orderID:listQuery.orderId,
      date:listQuery.time,
      state:listQuery.orderState,
      pagenum:listQuery.pageNum,
      pagesize:listQuery.pageSize
    }
  })
}

export function closeOrder(params) {
  return request({
    url:'/order/update/close',
    method:'post',
    params:params
  })
}

export function deliveryOrder(data) {
  return request({
    url:'/order/update/delivery',
    method:'post',
    data:data
  });
}

export function getOrderDetail(id) {
  return axios({
    url:'http://localhost:8088/mall/admin/lt-order/getOrderListByC',
    method:'post',
    data:{
      orderID:id,
      pagenum:1,
      pagesize:1
    }
  });
}
export function getOrderItem(id) {
  return axios({
    url:'http://localhost:8088/mall/orderitem/get',
    method:'post',
    data:{
      id,
      current:1
    }
  });
}
export function updateReceiverInfo(data) {
  return request({
    url:'/order/update/receiverInfo',
    method:'post',
    data:data
  });
}


