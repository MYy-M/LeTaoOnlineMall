<!--
 * @Description: 商品详情页面组件
 * @Author: hai-27
 * @Date: 2020-02-16 20:20:26
 * @LastEditors: hai-27
 * @LastEditTime: 2020-03-07 21:59:26
 -->
<template>
  <div id="details">
    <!-- 头部 -->
    <div class="page-header">
      <div class="title">
        <p>{{ productDetails.cname }}</p>
        <div class="list">
          <ul>
            <li>
              <router-link to>概述</router-link>
            </li>
            <li>
              <router-link to>参数</router-link>
            </li>
            <li>
              <router-link to>用户评价</router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- 头部END -->

    <!-- 主要内容 -->
    <div class="main">
      <!-- 左侧商品轮播图 -->
      <div class="block">
        <el-carousel height="560px" v-if="productPicture.length > 1">
          <el-carousel-item v-for="item in productPicture" :key="item.csId">
            <img style="height:560px;width: 100%;;" :src="'data:image/png;base64,' + item.pic" :alt="item.cprice" />
          </el-carousel-item>
        </el-carousel>
        <div v-if="productPicture.length == 1">
          <img style="height:560px;width: 100%; " :src="'data:image/png;base64,' + productPicture[0].pic"
            :alt="productPicture[0].cprice" />
        </div>
      </div>
      <!-- 左侧商品轮播图END -->

      <!-- 右侧内容区 -->
      <div class="content">
        <h1 class="name">{{ productDetails.cname }}</h1>
        <p class="intro">{{ productDetails.cdetail }}</p>
        <p class="store">乐淘自营</p>
        <div class="price">
          <span>{{ productDetails.cprice }}元</span>
          <span v-show="productDetails.product_price != productDetails.product_selling_price" class="del">{{
              productDetails.product_price
          }}元</span>
        </div>
        <div class="pro-list">
          <span class="pro-name">{{ productDetails.cname }}</span>
          <span class="pro-price">
            <span>{{ productDetails.cprice }}元</span>
            <span v-show="productDetails.product_price != productDetails.product_selling_price" class="pro-del">{{
                productDetails.product_price
            }}元</span>
          </span>
          <p class="price-sum">总计 : {{ productDetails.cprice }}元</p>
        </div>
        <div class="sku" v-if="this.propertyId">
          <h3>规格</h3>
          <el-form>
            <el-form-item v-for="(property, propertyIndex) in property" :key="propertyIndex"
              :label="property.attributeName">
              <!-- <div v-for="(item,index) in ">
                <el-radio
                  v-model="radio2"
                  label="1"
                  border
                  size="medium"
                >备选项1</el-radio>
                <el-radio
                  v-model="radio2"
                  label="2"
                  border
                  size="medium"
                >备选项2</el-radio>
              </div> -->
              <!-- <div class="sku-box-area">
              <div v-for="(attribute, attributeIndex) in property.attributes">
                <div :key="attributeIndex" :class="[
                  'sku-box',
                  'sku-text',
                  attribute.isActive ? 'active' : '',
                  attribute.isDisabled ? 'disabled' : '',
                ]" @click="handleClickAttribute(propertyIndex, attributeIndex)">
                  {{ attribute.value }}
                </div>
              </div>
            </div> -->
            </el-form-item>
          </el-form>
        </div>
        <!-- 内容区底部按钮 -->
        <div class="button">
          <el-button class="shop-cart" :disabled="dis" @click="addShoppingCart">加入购物车</el-button>
          <el-button class="like" @click="addCollect">喜欢</el-button>
        </div>
        <!-- 内容区底部按钮END -->
        <div class="pro-policy">
          <ul>
            <li>
              <i class="el-icon-circle-check"></i> 乐淘自营
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 乐淘发货
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 7天无理由退货
            </li>
            <li>
              <i class="el-icon-circle-check"></i> 7天价格保护
            </li>
          </ul>
        </div>
      </div>
      <!-- 右侧内容区END -->
    </div>
    <!-- 主要内容END -->
  </div>
</template>
<script>
import { mapActions } from "vuex";
export default {
  name: "SkuSelector",
  components: {},
  computed: {},
  data() {
    return {
      dis: false, // 控制“加入购物车按钮是否可用”
      cid: "", // 商品id
      cprice: "",//商品价格
      productDetails: "", // 商品详细信息
      productPicture: "",// 商品图片
      productSku: [],//商品规格
      property: [],
      propertyId: [], // property 列表
      propertyList: []
    };
  },
  // 通过路由获取商品id
  activated() {
    if (this.$route.query.productID != undefined) {
      this.cid = this.$route.query.productID;
    }
  },
  watch: {
    // 监听商品id的变化，请求后端获取商品数据
    cid: function (val) {
      this.getDetails(val);
      this.getCommoditySku(val);
      this.getDetailsPicture(val);
    }
  },

  methods: {
    ...mapActions(["unshiftShoppingCart", "addShoppingCartNum"]),
    // 获取商品详细信息
    getDetails(val) {
      this.$axios
        .post("/mall/commodity/getDetail", null, {
          params: { cid: val }
        })
        .then(res => {
          this.productDetails = res.data.data;
          if (this.productDetails.attributeList != "") {
            for (var key of JSON.parse(this.productDetails.attributeList)) {
              this.propertyId.push(key.productAttributeId)
            }
            for (var i = 0; i < this.propertyId.length; i++) {
              this.$axios
                .post("/mall/admin/category/getKey", null, {
                  params: { id: this.propertyId[i] }
                })
                .then(res => {
                  this.property.push(res.data.data)
                  console.log(this.property)
                })
            }
          }
          this.propertyList = JSON.parse(this.productDetails.attributeList);
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    // 获取商品图片
    getDetailsPicture(val) {

      this.$axios
        .post("/mall/commoditySpecs/getCommodityPic", null, {
          params: { cid: val }
        })
        .then(res => {
          this.productPicture = res.data.data;

        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    //获取商品规格
    getCommoditySku(val) {
      this.$axios
        .post("/mall/commoditySpecs/getSpecs", null, {
          params: { cid: val }
        })
        .then(res => {
          if (res.data.code == 200) {
            for (var key of res.data.data) {
              var obj = {
                cspecs: JSON.parse(key.cspecs),
                cstock: key.cstock,
                cprice: key.cprice,
                cpicture: key.cpicture,
                cid: key.cid,
                csid: key.csId
              };
              this.productSku.push(obj);
            }
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    // 加入购物车
    addShoppingCart() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }

      this.$axios
        .post("/mall/consumer/cart/addCommodity", {
          uid: this.$store.getters.getUser.uid,
          csId: this.productSku[0].csid,
        })
        .then(res => {
          switch (res.data.code) {
            case 100:
              // 新加入购物车成功
              this.unshiftShoppingCart(res.data.data);
              this.notifySucceed(res.data.msg);
              break;
            case 200:
              // 该商品已经在购物车，数量+1
              this.addShoppingCartNum(res.data.data);
              this.notifySucceed(res.data.msg);
              break;
            case 300:
              // 商品数量达到限购数量
              this.dis = true;
              this.notifyError(res.data.msg);
              break;
            default:
              this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },
    addCollect() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      this.$axios
        .post("/mall/collection/addCollection", {
          uid: this.$store.getters.getUser.uid,
          cid: this.cid
        })
        .then(res => {
          if (res.data.code == 200) {
            // 添加收藏成功
            this.notifySucceed(res.data.msg);
          } else {
            // 添加收藏失败
            this.notifyError(res.data.msg);
          }
        })
        .catch(err => {
          return Promise.reject(err);
        });
    },

  }
};
</script>
<style>
/* 头部CSS */
#details .page-header {
  height: 64px;
  margin-top: -20px;
  z-index: 4;
  background: #fff;
  border-bottom: 1px solid #e0e0e0;
  -webkit-box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
  box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
}

#details .page-header .title {
  width: 1225px;
  height: 64px;
  line-height: 64px;
  font-size: 18px;
  font-weight: 400;
  color: #212121;
  margin: 0 auto;
}

#details .page-header .title p {
  float: left;
}

#details .page-header .title .list {
  height: 64px;
  float: right;
}

#details .page-header .title .list li {
  float: left;
  margin-left: 20px;
}

#details .page-header .title .list li a {
  font-size: 14px;
  color: #744e4e;
}

#details .page-header .title .list li a:hover {
  font-size: 14px;
  color: #5b3c27;
}

/* 头部CSS END */

/**规格css */
.sku {
  width: 350px;
  padding: 24px;
}

.sku-box-area {
  display: flex;
  flex: 1;
  flex-direction: row;
  flex-wrap: wrap;
}

.sku-box {
  border: 1px solid #cccccc;
  border-radius: 6px;
  margin-right: 12px;
  padding: 8px 10px;
  margin-bottom: 10px;
}

.sku-text {
  font-size: 16px;
  line-height: 16px;
  color: #666666;
}

.active {
  border-color: #598479c8;
  color: #598479c8;
}

.disabled {
  opacity: 0.5;
  border-color: #e0e0e0;
  color: #999999;
}

/* 主要内容CSS */
#details .main {
  width: 1225px;
  height: 560px;
  padding-top: 30px;
  margin: 0 auto;
}

#details .main .block {
  float: left;
  width: 560px;
  height: 560px;
}

#details .el-carousel .el-carousel__indicator .el-carousel__button {
  background-color: rgba(163, 163, 163, 0.8);
}

#details .main .content {
  float: left;
  margin-left: 25px;
  width: 640px;
}

#details .main .content .name {
  height: 30px;
  line-height: 30px;
  font-size: 24px;
  font-weight: normal;
  color: #212121;
}

#details .main .content .intro {
  color: #b0b0b0;
  padding-top: 10px;
}

#details .main .content .store {
  color: #61543e;
  padding-top: 10px;
}

#details .main .content .price {
  display: block;
  font-size: 18px;
  color: #61543e;
  border-bottom: 1px solid #e0e0e0;
  padding: 25px 0 25px;
}

#details .main .content .price .del {
  font-size: 14px;
  margin-left: 10px;
  color: #b0b0b0;
  text-decoration: line-through;
}

#details .main .content .pro-list {
  background: #f9f9fa;
  padding: 30px 60px;
  margin: 50px 0 50px;
}

#details .main .content .pro-list span {
  line-height: 30px;
  color: #616161;
}

#details .main .content .pro-list .pro-price {
  float: right;
}

#details .main .content .pro-list .pro-price .pro-del {
  margin-left: 10px;
  text-decoration: line-through;
}

#details .main .content .pro-list .price-sum {
  color: #598479c8;
  font-size: 24px;
  padding-top: 20px;
}

#details .main .content .button {
  height: 55px;
  margin: 10px 0 20px 0;
}

#details .main .content .button .el-button {
  float: left;
  height: 55px;
  font-size: 16px;
  color: #fff;
  border: none;
  text-align: center;
}

#details .main .content .button .shop-cart {
  width: 340px;
  background-color: #598479c8;
}

#details .main .content .button .shop-cart:hover {
  background-color: #598479c8;
}

#details .main .content .button .like {
  width: 260px;
  margin-left: 40px;
  background-color: #b0b0b0;
}

#details .main .content .button .like:hover {
  background-color: #757575;
}

#details .main .content .pro-policy li {
  float: left;
  margin-right: 20px;
  color: #b0b0b0;
}

/* 主要内容CSS END */
</style>