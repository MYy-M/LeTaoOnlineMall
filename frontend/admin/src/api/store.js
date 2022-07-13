import axios from "axios"

export function getStoreList(params) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store' ,
        method: 'get',
        params: params
    })
}
export function addStore(data) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store',
        method: 'post',
        data: data
    })
}
export function updateStore(bdata) {
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