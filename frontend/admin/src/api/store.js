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
export function addStore(store) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store/add',
        method: 'post',
        data: {
            sname:store.sname,
            saddress:store.saddress,
            sphone:store.sphone
        }
    })
}
export function updateStore(store) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store/modify',
        method: 'post',
        data: {
            sid:store.sid,
            sname:store.sname,
            saddress:store.saddress,
            sphone:store.sphone
        }
    })
}

export function deleteStore(id) {
    return axios({
        url: 'http://localhost:8088/mall/admin/store/delete',
        method: 'get',
        params:{id}
    })
}
export function getStoreById(id){
    return axios({
        url:'http://localhost:8088/mall/admin/store/getStoreByID',
        method:'get',
        params:{
            id
        }
    })
}