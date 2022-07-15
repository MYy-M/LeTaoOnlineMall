import request from '@/utils/request'
import axios from 'axios'
export function fetchList(cid, listQuery) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getAttributeKeyById',
    method: 'post',
    data: {
      id: cid,
      current: listQuery.pageNum,
      pageSize: listQuery.pageSize
    }
  })
}
export function fetchValueList(id) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getAttributeValueByKey',
    method: 'post',
    params:{id}
  })
}
export function deleteProductAttr(id) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/deleteAttributeKey',
    method: 'post',
    params: {
      id
    }
  })
}

export function createProductAttr(data) {
  return request({
    url: '/productAttribute/create',
    method: 'post',
    data: data
  })
}

export function updateProductAttr(id, data) {
  return request({
    url: '/productAttribute/update/' + id,
    method: 'post',
    data: data
  })
}
export function getProductAttr(id) {
  return request({
    url: '/productAttribute/' + id,
    method: 'get'
  })
}

export function getProductAttrInfo(productCategoryId) {
  return request({
    url: '/productAttribute/attrInfo/' + productCategoryId,
    method: 'get'
  })
}
