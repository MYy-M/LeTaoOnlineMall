<!--
 * @Description: 我的订单页面组件
 * @Author: hai-27
 * @Date: 2020-02-20 17:21:54
 * @LastEditors: hai-27
 * @LastEditTime: 2020-02-27 13:36:27
 -->
<template>
  <div class="order">
    <!-- 我的订单头部 -->
    <div class="order-header">
      <div class="order-header-content">
        <p>
          <i
            class="el-icon-s-order"
            style="font-size: 30px;color: #598479c8;"
          ></i>
          我的订单
        </p>
      </div>
    </div>
    <!-- 我的订单头部END -->

    <!-- 我的订单主要内容 -->
    <div
      class="order-content"
      v-if="this.orders.length>0"
    >
      <div
        class="content"
        v-for="(item,index) in this.orders"
        :key="index"
      >
        <ul>
          <!-- 我的订单表头 -->
          <li class="order-info">
            <div class="order-id">订单编号: {{item.orderId}}</div>
            <div class="order-time">订单时间: {{item.orderTime| dateFormat}}</div>
          </li>
          <li class="header">
            <div class="pro-img"></div>

            <div class="pro-price">单价</div>
            <div class="pro-num">数量</div>
            <div class="pro-total">小计</div>
          </li>
          <!-- 我的订单表头END -->

          <!-- 订单列表 -->
          <li
            class="product-list"
            v-for="(product,i) in item.itemList"
            :key="i"
          >
            <div class="pro-img">
              <router-link :to="{ path: '/goods/details', query: {productID:product.cid} }">
                <img :src="'data:image/png;base64,' + product.cpicture" />
              </router-link>
            </div>
            <!-- <div class="pro-name">

              <router-link :to="{ path: '/goods/details', query: {productID:product.cid} }">{{product.cname}}</router-link>
            </div> -->
            <div class="pro-price">{{product.cprice}}元</div>
            <div class="pro-num">{{product.cnum}}</div>
            <div class="pro-total pro-total-in">{{product.cprice*product.cnum}}元</div>
          </li>
        </ul>
        <div class="order-bar">
          <div class="order-bar-left">
            <span class="order-total">
              共
              <span class="order-total-num">{{item.itemList.length}}</span> 件商品
            </span>
          </div>
          <div class="order-bar-right">
            <span>
              <span class="total-price-title">合计：</span>
              <span class="total-price">{{item.total}}元</span>
            </span>
          </div>
          <!-- 订单列表END -->
        </div>
      </div>
      <div style="margin-top:-40px;"></div>
    </div>
    <!-- 我的订单主要内容END -->

    <!-- 订单为空的时候显示的内容 -->
    <div
      v-else
      class="order-empty"
    >
      <div class="empty">
        <h2>您的订单还是空的！</h2>
        <p>快去购物吧！</p>
      </div>
    </div>
    <!-- 订单为空的时候显示的内容END -->
  </div>
</template>
<script>
export default {
  data() {
    return {
      orders: [], // 订单列表
      itemList:[]
    };
  },
  activated() {
    // 获取订单数据
    this.$axios
      .post("/mall/lt-order/getlist", {
        uid: this.$store.getters.getUser.uid,
        current: 1,
        pageSize: 100000
      })
      .then(res => {
        if (res.data.code === 200) {
          this.orders = res.data.data;
          for (var key of this.orders){
            this.itemList = key.itemList   
            console.log(key.itemList)  
            console.log(this.itemList)    
          }
          // for (var key of this.orders) {
          //   this.$axios
          //     .post("/mall//getlist", {
          //       id: key.orderId,
          //       current: 1
          //     })
          //     .then(res => {
          //       key.orderItems = []
          //       if (res.data.code === 200) {
          //         key.orderItems = res.data.data.records;
          //       } else {
          //         this.notifyError(res.data.msg);
          //       }
          //       console.log(key)
          //     })
          //     .catch(err => {
          //       return Promise.reject(err);
          //     });
          // }
        } else {
          this.notifyError(res.data.msg);
        }
      })
      .catch(err => {
        return Promise.reject(err);
      });
  }
};
</script>
<style scoped>
.order {
  background-color: #f5f5f5;
  padding-bottom: 20px;
}
/* 我的订单头部CSS */
.order .order-header {
  height: 64px;
  border-bottom: 2px solid #598479c8;
  background-color: #fff;
  margin-bottom: 20px;
}
.order .order-header .order-header-content {
  width: 1225px;
  margin: 0 auto;
}
.order .order-header p {
  font-size: 28px;
  line-height: 58px;
  float: left;
  font-weight: normal;
  color: #424242;
}
/* 我的订单头部CSS END */
.order .content {
  width: 1225px;
  margin: 0 auto;
  background-color: #fff;
  margin-bottom: 50px;
}

.order .content ul {
  background-color: #fff;
  color: #424242;
  line-height: 85px;
}
/* 我的订单表头CSS */
.order .content ul .order-info {
  height: 60px;
  line-height: 60px;
  padding: 0 26px;
  color: #424242;
  border-bottom: 1px solid #598479c8;
}
.order .content ul .order-info .order-id {
  float: left;
  color: #598479c8;
}
.order .content ul .order-info .order-time {
  float: right;
}

.order .content ul .header {
  height: 85px;
  padding-right: 26px;
  color: #424242;
}
/* 我的订单表头CSS END */

/* 订单列表CSS */
.order .content ul .product-list {
  height: 85px;
  padding: 15px 26px 15px 0;
  border-top: 1px solid #e0e0e0;
}
.order .content ul .pro-img {
  float: left;
  height: 85px;
  width: 120px;
  padding-left: 80px;
}
.order .content ul .pro-img img {
  height: 80px;
  width: 80px;
}
.order .content ul .pro-name {
  float: left;
  width: 380px;
}
.order .content ul .pro-name a {
  color: #424242;
}
.order .content ul .pro-name a:hover {
  color: #598479c8;
}
.order .content ul .pro-price {
  float: left;
  width: 160px;
  padding-right: 18px;
  text-align: center;
}
.order .content ul .pro-num {
  float: left;
  width: 190px;
  text-align: center;
}
.order .content ul .pro-total {
  float: left;
  width: 160px;
  padding-right: 81px;
  text-align: right;
}
.order .content ul .pro-total-in {
  color: #598479c8;
}

.order .order-bar {
  width: 1185px;
  padding: 0 20px;
  border-top: 1px solid #598479c8;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
}
.order .order-bar .order-bar-left {
  float: left;
}
.order .order-bar .order-bar-left .order-total {
  color: #757575;
}
.order .order-bar .order-bar-left .order-total-num {
  color: #598479c8;
}
.order .order-bar .order-bar-right {
  float: right;
}
.order .order-bar .order-bar-right .total-price-title {
  color: #598479c8;
  font-size: 14px;
}
.order .order-bar .order-bar-right .total-price {
  color: #598479c8;
  font-size: 30px;
}
/* 订单列表CSS END */

/* 订单为空的时候显示的内容CSS */
.order .order-empty {
  width: 1225px;
  margin: 0 auto;
}
.order .order-empty .empty {
  height: 300px;
  padding: 0 0 130px 558px;
  margin: 65px 0 0;
  background: url(../assets/imgs/cart-empty.png) no-repeat 124px 0;
  color: #b0b0b0;
  overflow: hidden;
}
.order .order-empty .empty h2 {
  margin: 70px 0 15px;
  font-size: 36px;
}
.order .order-empty .empty p {
  margin: 0 0 20px;
  font-size: 20px;
}
/* 订单为空的时候显示的内容CSS END */
</style>