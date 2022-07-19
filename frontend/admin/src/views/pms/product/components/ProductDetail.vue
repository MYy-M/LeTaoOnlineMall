<template> 
  <el-card class="form-container" shadow="never">
    <el-steps :active="active" finish-status="success" align-center>
      <el-step title="填写商品信息"></el-step>
      <el-step title="填写商品属性"></el-step>
    </el-steps>
    <product-info-detail
      v-show="showStatus[0]"
      v-model="productParam"
      :is-edit="isEdit"
      @nextStep="nextStep">
    </product-info-detail>
    <product-attr-detail
      v-show="showStatus[1]"
      v-model="productParam"
      :is-edit="isEdit"
      @prevStep="prevStep"
      @finishCommit="finishCommit">
    </product-attr-detail>
  </el-card>
</template>
<script>
  import ProductInfoDetail from './ProductInfoDetail';
  import ProductAttrDetail from './ProductAttrDetail';
  import {createProduct,getProduct,updateProduct} from '@/api/product';

  const defaultProductParam = {
    description: '',
    name: '',
    pic: '',
    price: 0,
    productAttributeCategoryId: null,
    //商品属性相关{productAttributeId: 0, value: ''}
    productAttributeValueList: [],  
    //商品sku库存信息{lowStock: 0, pic: '', price: 0, sale: 0, skuCode: '', spData: '', stock: 0}
    skuStockList: [],
    productCategoryId: null,
    stock: 0,
  };
  export default {
    name: 'ProductDetail',
    components: {ProductInfoDetail,  ProductAttrDetail},
    props: {
      isEdit: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        active: 0,
        productParam: Object.assign({}, defaultProductParam),
        showStatus: [true, false]
      }
    },
    created(){
      if(this.isEdit){
        getProduct(this.$route.query.id).then(response=>{
          this.productParam=response.data;
        });
      }
    },
    methods: {
      hideAll() {
        for (let i = 0; i < this.showStatus.length; i++) {
          this.showStatus[i] = false;
        }
      },
      prevStep() {
        if (this.active > 0 && this.active < this.showStatus.length) {
          this.active--;
          this.hideAll();
          this.showStatus[this.active] = true;
        }
      },
      nextStep() {
        if (this.active < this.showStatus.length - 1) {
          this.active++;
          this.hideAll();
          this.showStatus[this.active] = true;
        }
      },
      finishCommit(isEdit) {
        this.$confirm('是否要提交该产品', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          // if(isEdit){
          //   updateProduct(this.$route.query.id,this.productParam).then(response=>{
          //     this.$message({
          //       type: 'success',
          //       message: '提交成功',
          //       duration:1000
          //     });
          //     this.$router.back();
          //   });
          // }else{
          //   createProduct(this.productParam).then(response=>{
          //     this.$message({
          //       type: 'success',
          //       message: '提交成功',
          //       duration:1000
          //     });
          //     location.reload();
          //   });
          // }
        })
      }
    }
  }
</script>
<style>
  .form-container {
    width: 800px;
  }
</style>


