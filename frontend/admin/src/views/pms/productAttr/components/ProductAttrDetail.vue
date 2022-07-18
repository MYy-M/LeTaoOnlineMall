<template>
  <el-card
    class="form-container"
    shadow="never"
  >
    <el-form
      :model="productAttr"
      :rules="rules"
      ref="productAttrFrom"
      label-width="150px"
    >
      <el-form-item
        label="属性名称："
        prop="name"
      >
        <el-input v-model="productAttr.name"></el-input>
      </el-form-item>
      <el-form-item label="商品类型：">
        <el-select
          v-model="productAttr.categoryId"
          placeholder="请选择"
        >
          <el-option
            v-for="item in productAttrCateList"
            :key="item.categoryId"
            :label="item.categoryName"
            :value="item.categoryId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="属性值可选值列表:">
        <el-input
          :autosize="true"
          type="textarea"
          v-model="inputListFormat"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          @click="onSubmit('productAttrFrom')"
        >提交</el-button>
        <el-button
          v-if="!isEdit"
          @click="resetForm('productAttrFrom')"
        >重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
import { fetchList } from '@/api/productAttrCate'
import { createProductAttr, getProductAttr, updateProductAttr } from '@/api/productAttr'

const defaultProductAttr = {
  valueList: '',
  name: '',
  categoryId: 0,
};
export default {
  name: "ProductAttrDetail",
  props: {
    isEdit: {
      type: Boolean,
      default: false
    },
    attribute:{
      type:Object,
      default:{}
    }
  },
  data() {
    return {
      productAttr: Object.assign({}, defaultProductAttr),
      rules: {
        name: [
          { required: true, message: '请输入属性名称', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ]
      },
      productAttrCateList: null,
      inputListFormat: null
    }
  },
  created() {
    if (this.isEdit) {
      console.log(this.attribute)
      this.productAttr=this.attribute;
      this.inputListFormat = this.productAttr.valueList.toString().replace(/;/g, '\n');

    } else {
      this.resetProductAttr();
    }
    this.getCateList();
  },
  watch: {
    inputListFormat: function (newValue, oldValue) {
      newValue = newValue.replace(/\n/g, ';');
      this.productAttr.valueList = newValue;
    }
  },
  methods: {
    getCateList() {
      let listQuery = { pageNum: 1, pageSize: 100 };
      fetchList(listQuery).then(response => {
        this.productAttrCateList = response.data.data.records;
      });
    },
    resetProductAttr() {
      this.productAttr = Object.assign({}, defaultProductAttr);
      this.productAttr.categoryId = Number(this.$route.query.cid);
    },
    onSubmit(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.$confirm('是否提交数据', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            if (this.isEdit) {
              updateProductAttr(this.productAttr).then(response => {
                this.$message({
                  message: '修改成功',
                  type: 'success',
                  duration: 1000
                });
                this.$router.back();
              });
            } else {
              console.log(this.productAttr)
              createProductAttr(this.productAttr).then(response => {
                this.$message({
                  message: '提交成功',
                  type: 'success',
                  duration: 1000
                });
                this.resetForm('productAttrFrom');
              });
            }
          });

        } else {
          this.$message({
            message: '验证失败',
            type: 'error',
            duration: 1000
          });
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
      this.resetProductAttr();
    }
  },
}
</script>

<style scoped>
</style>
