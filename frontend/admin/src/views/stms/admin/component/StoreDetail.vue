<template>
  <el-card
    class="form-container"
    shadow="never"
  >
    <div>
      <div>
        <h1 v-if="isEdit" style="text-align: center;">修改门店</h1>
        <h1 v-else style="text-align: center;">添加门店</h1>
      </div>
      <el-form
        :model="value"
        :rules="rules"
        ref="storeInfoForm"
        label-width="120px"
        style="width: 600px"
        size="small"
      >
        <el-form-item
          label="门店名称："
          prop="name"
        >
          <el-input v-model="value.sname"></el-input>
        </el-form-item>
        <el-form-item
          label="门店地址："
          prop="address"
        >
          <el-input v-model="value.saddress"></el-input>

        </el-form-item>
        <el-form-item
          label="联系电话："
          prop="phone"
        >
          <el-input v-model="value.sphone"></el-input>
        </el-form-item>
        <el-form-item style="text-align: center">
          <el-button
            type="primary"
            size="medium"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-card>
</template>

<script>


export default {
  name: "StoreDetail",
  props: {
    value: {
      type: Object,
      default: '',
      sname: String,
      saddress: String,
      sphone: String
    },
    isEdit: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      hasEditCreated: false,
      rules: {
        name: [
          { required: true, message: '请输入门店名称', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        address: [{ required: true, message: '请输入门店地址', trigger: 'blur' }],
        phone: [{ type: number, required: true, message: '请输入门店电话', trigger: 'blur' },
        { min: 7, max: 12, message: '长度在 7 到 12 个字符', trigger: 'blur' }],
      }
    };
  },
  // created() {
  //   this.getProductCateList();
  // },
  // computed:{
  //   //商品的编号
  //   productId(){
  //     return this.value.id;
  //   }
  // },
  // watch: {
  //   productId:function(newValue){
  //     if(!this.isEdit)return;
  //     if(this.hasEditCreated)return;
  //     if(newValue===undefined||newValue==null||newValue===0)return;
  //     this.handleEditCreated();
  //   },
  // },
  // methods: {
  //   //处理编辑逻辑
  //   handleEditCreated(){
  //     if(this.value.productCategoryId!=null){
  //       this.selectProductCateValue.push(this.value.cateParentId);
  //       this.selectProductCateValue.push(this.value.productCategoryId);
  //     }
  //     this.hasEditCreated=true;
  //   },
  //   handleNext(formName){
  //     this.$refs[formName].validate((valid) => {
  //       if (valid) {
  //         this.$emit('nextStep');
  //       } else {
  //         this.$message({
  //           message: '验证失败',
  //           type: 'error',
  //           duration:1000
  //         });
  //         return false;
  //       }
  //     });
  //   }
  // }
}
</script>
<style scoped>
</style>
