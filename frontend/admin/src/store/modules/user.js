import { login, logout, getInfo } from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'

const user = {
  state: {
    token: getToken(),
    name: '',
    avatar: '',
    roles: []
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    }
  },

  actions: {
    // 登录
    Login({ commit }, userInfo) {
      const id = userInfo.id.trim()

      return new Promise((resolve, reject) => {
        login(id, userInfo.password).then(response => {
          const data = response.data
          console.log(data)
          // const tokenStr = data.tokenHead+data.token
          // console.log(tokenStr)
          setToken(data.data)
          commit('SET_TOKEN', data.data)
          resolve()
        }).catch(error => {
          console.log(error)
          reject(error)
        })
      })
    },

    // 获取用户信息
    GetInfo({ commit, state }) {
      return new Promise((resolve, reject) => {
        getInfo(state.token).then(response => {
          const data = response.data
          // if (true) { // 验证返回的roles是否是一个非空数组
          commit('SET_ROLES', 0)
          // } else {
          //   reject('getInfo: roles must be a non-null array !')
          // }
          commit('SET_NAME', data.ausername)
          commit('SET_AVATAR', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.KCJw3UfhV081PCC37LZojQAAAA?w=203&h=203&c=7&r=0&o=5&dpr=1.5&pid=1.7')
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    LogOut({ commit, state }) {
      return new Promise((resolve, reject) => {
        logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          removeToken()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  }
}

export default user
