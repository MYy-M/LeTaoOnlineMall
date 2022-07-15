import request from '@/utils/request'
import axios from 'axios'
export function fetchList(listQuery) {
  return axios({
    url:'http://localhost:8088/mall/admin/category/getAllCategorySecond',
    method:'post',
    data:{
      current:listQuery.pageNum,
      pageSize:listQuery.pageSize
    }
  })
}

export function createProductAttrCate(data) {
  return request({
    url:'/productAttribute/category/create',
    method:'post',
    data:data
  })
}

export function updateProductAttrCate(id,data) {
  return request({
    url:'/productAttribute/category/update/'+id,
    method:'post',
    data:data
  })
}
export function fetchListWithAttr() {
  return request({
    url:'/productAttribute/category/list/withAttr',
    method:'get'
  })
}
