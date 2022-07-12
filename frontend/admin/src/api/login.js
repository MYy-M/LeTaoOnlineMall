import request from '@/utils/request'
import axios from 'axios'

export function login2(id, password) {
  console.log("login")
  return request({
    // url: '/admin/login',
    url: '/mall/login',
    method: 'post',
    headers: {
      "Content-Type": "application/json" // 如果写成contentType会报错
    },
    data: {
      id,
      password
    }
  })
}

export function login(id, password) {
  return axios({
    url: "http://localhost:8088/mall/admin/login",
    method: "POST",
    data: { id, password }
  })
}



export function getInfo(token) {
  return axios({
    url: "http://localhost:8088/mall/admin/currentAdmin",
    method: "GET",
    headers: {
      'Authorization': token
    }
  })
}

export function logout(token) {
  return axios({
    url: 'http://localhost:8088/mall/admin/logout',
    method: 'get',
    headers: {
      'Authorization': token
    }
  })
}

export function fetchList(params) {
  return request({
    url: '/admin/list',
    method: 'get',
    params: params
  })
}

export function createAdmin(data) {
  return request({
    url: '/admin/register',
    method: 'post',
    data: data
  })
}

export function updateAdmin(id, data) {
  return request({
    url: '/admin/update/' + id,
    method: 'post',
    data: data
  })
}

export function updateStatus(id, params) {
  return request({
    url: '/admin/updateStatus/' + id,
    method: 'post',
    params: params
  })
}

export function deleteAdmin(id) {
  return request({
    url: '/admin/delete/' + id,
    method: 'post'
  })
}

export function getRoleByAdmin(id) {
  return request({
    url: '/admin/role/' + id,
    method: 'get'
  })
}

export function allocRole(data) {
  return request({
    url: '/admin/role/update',
    method: 'post',
    data: data
  })
}
