import axios from "axios"

export function getStoreList(pid, params) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store' ,
        method: 'get',
        params: params
    })
}
export function addStore(pid, data) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store',
        method: 'post',
        data: data
    })
}
export function updateStore(pid, data) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store',
        method: 'post',
        data: data
    })
}

export function deleteStore(params) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store',
        method: 'post',
        params: params
    })
}