<template>
  <el-card
    class="form-container"
    shadow="never"
  >
    <div>
      <h1
        v-if="isEdit"
        style="text-align: center;"
      >修改分类</h1>
      <h1
        v-else
        style="text-align: center;"
      >添加分类</h1>
    </div>
    <el-form
      :model="productCate"
      ref="productCateFrom"
      label-width="150px"
    >
      <el-form-item
        label="分类名称："
        prop="name"
      >
        <el-input v-model="productCate.categoryName"></el-input>
      </el-form-item>
      <el-form-item label="上级分类：">
        <el-select
          v-model="productCate.parentId"
          placeholder="请选择分类"
        >
          <el-option
            v-for="item in selectProductCateList"
            :key="item.categoryId"
            :label="item.categoryName"
            :value="item.categoryId"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          @click="onSubmit('productCateFrom')"
        >提交</el-button>
        <el-button
          v-if="!isEdit"
          @click="resetForm('productCateFrom')"
        >重置</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
import { createProductCate, updateProductCate, getProductCate, fetchFirstCateList, } from '@/api/productCate';
import SingleUpload from '@/components/Upload/singleUpload';

const defaultProductCate = {
  categoryName: '',
  parentId: 0,
};
export default {
  name: "ProductCateDetail",
  components: { SingleUpload },
  props: {
    isEdit: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      productCate: Object.assign({}, defaultProductCate),
      selectProductCateList: [],
    }
  },
  created() {
    if (this.isEdit) {
      getProductCate(this.$route.query.id).then(response => {
        console.log(response)
        this.productCate = response.data.data;
      });
    } else {
      this.productCate = Object.assign({}, defaultProductCate);
    }
    this.getSelectProductCateList();
  },
  methods: {
    getSelectProductCateList() {
      fetchFirstCateList({ pageSize: 100, pageNum: 1 }).then(response => {
        this.selectProductCateList = response.data.data.records;
        this.selectProductCateList.unshift({ categoryId: 0, categoryName: '无上级分类' });
      });
    },
    onSubmit(formName) {
      if (this.categoryName != '') {
        this.$confirm('是否提交数据', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var categoryLevel;
          if (this.isEdit) {

            if (this.productCate.parentId == 0)
              categoryLevel = 1;
            else
              categoryLevel = 2;
            updateProductCate(this.$route.query.id, this.productCate).then(response => {
              this.$message({
                message: '修改成功',
                type: 'success',
                duration: 1000
              });
              this.$router.back();
            });
          } else {

            if (this.productCate.parentId == 0)
              categoryLevel = 1;
            else
              categoryLevel = 2;
            createProductCate(this.productCate, categoryLevel).then(response => {
              this.$refs[formName].resetFields();
              this.resetForm(formName);
              this.$message({
                message: '提交成功',
                type: 'success',
                duration: 1000
              });
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
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
      this.productCate = Object.assign({}, defaultProductCate);
      this.getSelectProductCateList();
    }
  }
}
</script>

<style scoped>
</style>
