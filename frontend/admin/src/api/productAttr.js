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
  console.log(data)
  return axios({
    url: 'http://localhost:8088/mall/admin/category/addAttributeKey',
    method: 'post',
    data: {
      id:data.categoryId,
      attributeKey:data.name,
      attributeValue:data.valueList
    }
  })
}

export function updateProductAttr(data) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/modifyAttribute',
    method: 'post',
    data: {
      id:data.categoryId,
      attributeKey:data.name,
      attributeValue:data.valueList
    }
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
