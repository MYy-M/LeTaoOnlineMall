import request from '@/utils/request'
import axios from 'axios'

export function fetchFirstCateList(listQuery) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getCategoryFirst',
    method: 'post',
    params: {
      current: listQuery.pageNum,
      pageSize: listQuery.pageSize
    }
  })
}
export function fetchSecondCateList(id, listQuery) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getCategorySecond',
    method: 'post',
    data: {
      id,
      current: listQuery.pageNum,
      pageSize: listQuery.pageSize
    }
  })
}
export function deleteProductCate(id) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/delete',
    method: 'get',
    params: {
      id
    }
  })
}

export function createProductCate(data, categoryLevel) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/add',
    method: 'post',
    data: { 
      categoryName:data.categoryName,
      parentId:data.parentId, 
      categoryLevel 
    }
  })
}

export function updateProductCate(id,data, categoryLevel) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/modify' ,
    method: 'post',
    data: { 
      categoryId:data.categoryId,
      categoryName:data.categoryName,
      parentId:data.parentId, 
      categoryLevel 
    }
  })
}

export function getProductCate(id) {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getCategoryByID',
    method: 'get',
    params: {
      id
    }
  })
}


export function fetchListWithChildren() {
  return axios({
    url: '/productCategory/list/withChildren',
    method: 'get'
  })
}
export function fetchAllSecondCategory() {
  return axios({
    url: 'http://localhost:8088/mall/admin/category/getAllCategorySecond',
    method: 'post',
    data:{
      current:1,
      pageSize:1000000
    }
  })
}

