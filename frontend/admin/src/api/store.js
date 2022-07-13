import axios from "axios"

export function getStoreList(pagenum,pagesize,storeaddress,storename,storephone) {

    return axios({
        url: 'http://localhost:8088/mall/admin/store/getstorelist' ,
        method: 'post',
        data: {
            pagenum,
            pagesize,
            storeaddress,
            storename,
            storephone
        }
    })
}
export function addStore(data) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store/add',
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