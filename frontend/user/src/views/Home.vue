<!--
 * @Description: 首页组件
 * @Author: hai-27
 * @Date: 2020-02-07 16:23:00
 * @LastEditors: hai-27
 * @LastEditTime: 2020-02-27 13:36:12
 -->
<template>
  <div class="home" id="home" name="home">
    <!-- 轮播图 -->
    <div class="block">
      <el-carousel height="520px">
        <el-carousel-item v-for="item in carousel" :key="item.carousel_id">
          <img style="height:100%;width:100%;" :src="'data:image/png;base64,' + item.image" :alt="item.describes" />
        </el-carousel-item>
      </el-carousel>
    </div>
    <!-- 轮播图END -->
    <div class="main-box">
      <div class="main">
        <!-- 手机商品展示区域 -->
        <div class="phone">
          <div class="box-hd">
            <div class="title">手机</div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
                <img src="../assets/imgs/phone.png" />
            </div>
            <div class="list">
              <MyList :list="phoneList" :isMore="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 手机商品展示区域END -->、

        <!-- 电脑商品展示区域 -->
        <div class="phone">
          <div class="box-hd">
            <div class="title">电脑</div>
            <div class="more" id="more">
            </div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
              <img src="../assets/imgs/computer.webp" />
            </div>
            <div class="list">
              <MyList :list="computerList" :isMore="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 电脑商品展示区域END -->

        <!-- 平板商品展示区域 -->
        <div class="phone">
          <div class="box-hd">
            <div class="title">平板</div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
              <img src="../assets/imgs/pad.webp" />
            </div>
            <div class="list">
              <MyList :list="padList" :isMore="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 平板商品展示区域END -->

        <!-- 家电商品展示区域 -->
        <div class="appliance" id="promo-menu">
          <div class="box-hd">
            <div class="title">家电</div>
            <div class="more" id="more">
              <MyMenu :val="1" @fromChild="getChildMsg">
                <span slot="1">热门</span>
              </MyMenu>
            </div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
              <ul>
                <li>
                  <img src="../assets/imgs/appliance-promo1.png" />
                </li>
                <li>
                  <img src="../assets/imgs/appliance-promo1.png" />
                </li>
              </ul>
            </div>
            <div class="list">
              <MyList :list="applianceList" :isMore="true"></MyList>
            </div>
          </div>
        </div>
        <!-- 家电商品展示区域END -->

        <!-- 配件商品展示区域 -->
        <!-- <div class="accessory" id="promo-menu">
          <div class="box-hd">
            <div class="title">配件</div>
            <div class="more" id="more">
              <MyMenu :val="3" @fromChild="getChildMsg2">
                <span slot="1">热门</span>
                <span slot="2">保护套</span>
                <span slot="3">充电器</span>
              </MyMenu>
            </div>
          </div>
          <div class="box-bd">
            <div class="promo-list">
              <ul>
                <li>
                  <img :src="$target + 'public/imgs/accessory/accessory-promo1.png'" alt />
                </li>
                <li>
                  <img :src="$target + 'public/imgs/accessory/accessory-promo2.png'" alt />
                </li>
              </ul>
            </div>
            <div class="list">
              <MyList :list="accessoryList" :isMore="true"></MyList>
            </div>
          </div>
        </div> -->
        <!-- 配件商品展示区域END -->
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // windowWidth: document.body.clientWidth,
      carousel: "", // 轮播图数据
      phoneList: "", // 手机商品列表
      // miTvList: "", // 小米电视商品列表
      computerList: "",
      computerHotList:"",
      padList: "",
      padHotList:"",
      applianceList: "", // 家电商品列表
      applianceHotList: "", //热门家电商品列表
      // accessoryList: "", //配件商品列表
      // accessoryHotList: "", //热门配件商品列表
      // protectingShellList: "", // 保护套商品列表
      // chargerList: "", //充电器商品列表
      // applianceActive: 1, // 家电当前选中的商品分类
      // accessoryActive: 1 // 配件当前选中的商品分类
    };
  },
  // mounted() {
  //   // 实时获取浏览器宽度高度
  //   const that = this
  //   window.onresize = () => {
  //     return (() => {
  //       //window.fullHeight = document.documentElement.clientHeight
  //       window.fullWidth = document.documentElement.clientWidth
  //       //that.windowHeight = window.fullHeight // 高
  //       that.windowWidth = window.fullWidth // 宽
  //     })()
  //   }
  // },
  watch: {
    // 家电当前选中的商品分类，响应不同的商品数据
    applianceActive: function (val) {
      // 页面初始化的时候把applianceHotList(热门家电商品列表)直接赋值给applianceList(家电商品列表)
      // 所以在切换商品列表时判断applianceHotList是否为空,为空则是第一次切换,把applianceList赋值给applianceHotList
      if (this.applianceHotList == "") {
        this.applianceHotList = this.applianceList;
      }
      if (val == 1) {
        // 1为热门商品
        this.applianceList = this.applianceHotList;
        return;
      }
      // if (val == 2) {
      //   // 2为电视商品
      //   this.applianceList = this.miTvList;
      //   return;
      // }
    },
    accessoryActive: function (val) {
      // 页面初始化的时候把accessoryHotList(热门配件商品列表)直接赋值给accessoryList(配件商品列表)
      // 所以在切换商品列表时判断accessoryHotList是否为空,为空则是第一次切换,把accessoryList赋值给accessoryHotList
      if (this.accessoryHotList == "") {
        this.accessoryHotList = this.accessoryList;
      }
      if (val == 1) {
        // 1为热门商品
        this.accessoryList = this.accessoryHotList;
        return;
      }
      if (val == 2) {
        // 2为保护套商品
        this.accessoryList = this.protectingShellList;
        return;
      }
      if (val == 3) {
        //3 为充电器商品
        this.accessoryList = this.chargerList;
        return;
      }
    }
  },
  created() {
    // 获取轮播图数据
    this.$axios
      .post("/mall/consumer/recommend/carousel", {})
      .then(res => {
        this.carousel = res.data.data;
      })
      .catch(err => {
        return Promise.reject(err);
      });

    // 获取各类商品数据
    this.getPromo("手机", "phoneList");
    this.getPromo("电脑", "computerList");
    this.getPromo("平板", "padList");
    this.getPromo("家电", "applianceList");
    // this.getPromo(
    //   ["家电"],
    //   "applianceList",
    //   "/mall/commodity/getHotProduct"
    // );
  },
  methods: {
    // 获取家电模块子组件传过来的数据
    getChildMsg(val) {
      this.applianceActive = val;
    },
    // 获取各类商品数据方法封装
    getPromo(categoryName, val, api) {
      api = api != undefined ? api : "/mall/commodity/showByCategoryName";
      this.$axios
        .post(api, null, {
          params: { categoryName }
        })
        .then(res => {
          this[val] = res.data.data;
        })
        .catch(err => {
          return Promise.reject(err);
        });
    }
  }
};
</script>
<style scoped>
@import "../assets/css/index.css";
</style>