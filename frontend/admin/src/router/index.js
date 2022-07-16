import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '../views/layout/Layout'

/**
 * hidden: true                   if `hidden:true` will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu, whatever its child routes length
 *                                if not set alwaysShow, only more than one route under the children
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noredirect           if `redirect:noredirect` will no redirct in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    title: 'title'               the name show in submenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar,
  }
 **/
export const constantRouterMap = [
  {path: '/login', component: () => import('@/views/login/index'), hidden: true},
  {path: '/404', component: () => import('@/views/404'), hidden: true},
  {
    path: '',
    component: Layout,
    redirect: '/home',
    children: [{
      path: 'home',
      name: 'home',
      component: () => import('@/views/home/index'),
      meta: {title: '首页', icon: 'home'}
    }]
  }
]

export const asyncRouterMap = [
  {
    path: '/pms',
    component: Layout,
    redirect: '/pms/product',
    name: 'pms',
    meta: {title: '商品', icon: 'product'},
    children: [{
      path: 'product',
      name: 'product',
      component: () => import('@/views/pms/product/index'),
      meta: {title: '商品列表', icon: 'product-list'}
    },
      {
        path: 'addProduct',
        name: 'addProduct',
        component: () => import('@/views/pms/product/add'),
        meta: {title: '添加商品', icon: 'product-add'}
      },
      {
        path: 'updateProduct',
        name: 'updateProduct',
        component: () => import('@/views/pms/product/update'),
        meta: {title: '修改商品', icon: 'product-add'},
        hidden: true
      },
      {
        path: 'productCate',
        name: 'productCate',
        component: () => import('@/views/pms/productCate/index'),
        meta: {title: '商品分类', icon: 'product-cate'}
      },
      {
        path: 'addProductCate',
        name: 'addProductCate',
        component: () => import('@/views/pms/productCate/add'),
        meta: {title: '添加商品分类'},
        hidden: true
      },
      {
        path: 'updateProductCate',
        name: 'updateProductCate',
        component: () => import('@/views/pms/productCate/update'),
        meta: {title: '修改商品分类'},
        hidden: true
      },
      {
        path: 'productAttr',
        name: 'productAttr',
        component: () => import('@/views/pms/productAttr/index'),
        meta: {title: '商品类型', icon: 'product-attr'}
      },
      {
        path: 'productAttrList',
        name: 'productAttrList',
        component: () => import('@/views/pms/productAttr/productAttrList'),
        meta: {title: '商品属性列表'},
        hidden: true
      },
      {
        path: 'addProductAttr',
        name: 'addProductAttr',
        component: () => import('@/views/pms/productAttr/addProductAttr'),
        meta: {title: '添加商品属性'},
        hidden: true
      },
      {
        path: 'updateProductAttr',
        name: 'updateProductAttr',
        component: () => import('@/views/pms/productAttr/updateProductAttr'),
        meta: {title: '修改商品属性'},
        hidden: true
      }
    ]
  },
  {
    path: '/oms',
    component: Layout,
    redirect: '/oms/order',
    name: 'oms',
    meta: {title: '订单', icon: 'order'},
    children: [
      {
        path: 'order',
        name: 'order',
        component: () => import('@/views/oms/order/index'),
        meta: {title: '订单列表', icon: 'product-list'}
      },
      {
        path: 'orderDetail',
        name: 'orderDetail',
        component: () => import('@/views/oms/order/orderDetail'),
        meta: {title: '订单详情'},
        hidden:true
      },
      {
        path: 'deliverOrderList',
        name: 'deliverOrderList',
        component: () => import('@/views/oms/order/deliverOrderList'),
        meta: {title: '发货列表'},
        hidden:true
      },
      {
        path: 'orderSetting',
        name: 'orderSetting',
        component: () => import('@/views/oms/order/setting'),
        meta: {title: '订单设置', icon: 'order-setting'}
      },
      // {
      //   path: 'returnApply',
      //   name: 'returnApply',
      //   component: () => import('@/views/oms/apply/index'),
      //   meta: {title: '退货申请处理', icon: 'order-return'}
      // },
      // {
      //   path: 'returnReason',
      //   name: 'returnReason',
      //   component: () => import('@/views/oms/apply/reason'),
      //   meta: {title: '退货原因设置', icon: 'order-return-reason'}
      // },
      // {
      //   path: 'returnApplyDetail',
      //   name: 'returnApplyDetail',
      //   component: () => import('@/views/oms/apply/applyDetail'),
      //   meta: {title: '退货原因详情'},
      //   hidden:true
      // }
    ]
  },
  {
    path: '/stms',
    component: Layout,
    redirect: '/stms/admin',
    name: 'stms',
    meta: {title: '门店', icon: 'order'},
    children: [
      {
        path: 'store',
        name: 'store',
        component: () => import('@/views/stms/admin/index'),
        meta: {title: '门店列表', icon: 'product-list'}
      },
      {
        path: 'addStore',
        name: 'addStore',
        component: () => import('@/views/stms/admin/add'),
        meta: {title: '添加门店',icon: 'product-list'},
      },
      {
        path: 'updateStore',
        name: 'updateStore',
        component: () => import('@/views/stms/admin/update'),
        meta: {title: '修改门店'},
        hidden:true
      }
    ]
  },
  {
    path:'/sms',
    component: Layout,
    redirect: '/sms/coupon',
    name: 'sms',
    meta: {title: '营销', icon: 'sms'},
    children: [
      // {
      //   path: 'flash',
      //   name: 'flash',
      //   component: () => import('@/views/sms/flash/index'),
      //   meta: {title: '秒杀活动列表', icon: 'sms-flash'}
      // },
      // {
      //   path: 'flashSession',
      //   name: 'flashSession',
      //   component: () => import('@/views/sms/flash/sessionList'),
      //   meta: {title: '秒杀时间段列表'},
      //   hidden:true
      // },
      // {
      //   path: 'selectSession',
      //   name: 'selectSession',
      //   component: () => import('@/views/sms/flash/selectSessionList'),
      //   meta: {title: '秒杀时间段选择'},
      //   hidden:true
      // },
      // {
      //   path: 'flashProductRelation',
      //   name: 'flashProductRelation',
      //   component: () => import('@/views/sms/flash/productRelationList'),
      //   meta: {title: '秒杀商品列表'},
      //   hidden:true
      // },
      // {
      //   path: 'brand',
      //   name: 'homeBrand',
      //   component: () => import('@/views/sms/brand/index'),
      //   meta: {title: '品牌推荐', icon: 'product-brand'}
      // },
      {
        path: 'new',
        name: 'homeNew',
        component: () => import('@/views/sms/new/index'),
        meta: {title: '新品推荐', icon: 'sms-new'}
      },
      {
        path: 'hot',
        name: 'homeHot',
        component: () => import('@/views/sms/hot/index'),
        meta: {title: '人气推荐', icon: 'sms-hot'}
      },
      {
        path: 'subject',
        name: 'homeSubject',
        component: () => import('@/views/sms/subject/index'),
        meta: {title: '专题推荐', icon: 'sms-subject'}
      },
    ]
  },
  {
    path: '/statistics',
    component: Layout,

    path: '/statistics/count',
    name: 'statistics',
    meta: { title: '统计', icon: 'ums' },
    children: [
      {
        path: 'comStat',

        name: 'comStat',
        component: () => import('@/views/statistics/count/comStat'),
        meta: { title: '商品统计', icon: 'ums-admin' }
      },
      {
        path: 'orderStat',
        name: 'orderStat',
        component: () => import('@/views/statistics/count/orderStat'),
        meta: { title: '订单统计', icon: 'ums-resource' }
      },
      {
        path: 'saleStat',
        name: 'saleStat',
        component: () => import('@/views/statistics/count/saleStat'),
        meta: { title: '销售统计', icon: 'ums-resource' }
      }
    ]
  },
  {
    path:'/ums',
    component: Layout,
    redirect: '/ums/admin',
    name: 'ums',
    meta: {title: '权限', icon: 'ums'},
    children: [
      {
        path: 'admin',
        name: 'admin',
        component: () => import('@/views/ums/admin/index'),
        meta: {title: '用户列表', icon: 'ums-admin'}
      },
      // {
      //   path: 'role',
      //   name: 'role',
      //   component: () => import('@/views/ums/role/index'),
      //   meta: {title: '角色列表', icon: 'ums-role'}
      // },
      // {
      //   path: 'allocMenu',
      //   name: 'allocMenu',
      //   component: () => import('@/views/ums/role/allocMenu'),
      //   meta: {title: '分配菜单'},
      //   hidden: true
      // },
      // {
      //   path: 'allocResource',
      //   name: 'allocResource',
      //   component: () => import('@/views/ums/role/allocResource'),
      //   meta: {title: '分配资源'},
      //   hidden: true
      // },
      {
        path: 'resource',
        name: 'resource',
        component: () => import('@/views/ums/resource/index'),
        meta: {title: '资源列表', icon: 'ums-resource'}
      },
      {
        path: 'resourceCategory',
        name: 'resourceCategory',
        component: () => import('@/views/ums/resource/categoryList'),
        meta: {title: '资源分类'},
        hidden: true
      }
    ]
  },
  {path: '*', redirect: '/404', hidden: true}
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({y: 0}),
  routes: constantRouterMap
})

