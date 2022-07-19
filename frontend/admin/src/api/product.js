import request from '@/utils/request'
import axios from 'axios'
export function fetchList(data) {
  return axios({
    url:'http://localhost:8088/mall/admin/commodity/getCommodityByC',
    method:'post',
    data:{
      cname:data.keyword,
      cid:data.productSn,
      categoryID:data.productCategoryId,
      currentPage:data.pageNum,
      pageSize:data.pageSize
    }
  })
}

export function fetchSimpleList(params) {
  return request({
    url:'/product/simpleList',
    method:'get',
    params:params
  })
}

export function updateDeleteStatus(id) {
  return axios({
    url:'http://localhost:8088/mall/admin/commodity/delete',
    method:'post',
    params:{id}
  })
}

export function updateRecommendStatus(fd) {

  return axios({
    url:'http://localhost:8088/mall/admin/commodity/recommend',
    method:'post',
    headers:{
      'Content-Type':'multipart/form-data'
    },
    data:{
      cid:fd.get("cid"),
      file:fd.get("file")
    }
  })
}
export function cancelRecommendStatus(cid) {
  console.log(cid)
  return axios({
    url:'http://localhost:8088/mall/admin/commodity/cancelRecommend',
    method:'post',
    params:{
      cid
    }
  })
}
export function updatePublishStatus(params) {
  return request({
    url:'/product/update/publishStatus',
    method:'post',
    params:params
  })
}

export function createProduct(data) {
  return request({
    url:'/product/create',
    method:'post',
    data:data
  })
}

export function updateProduct(id,data) {
  return request({
    url:'/product/update/'+id,
    method:'post',
    data:data
  })
}

export function getProduct(id) {
  return request({
    url:'/product/updateInfo/'+id,
    method:'get',
  })
}

