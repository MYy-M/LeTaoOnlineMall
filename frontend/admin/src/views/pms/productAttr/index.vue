<template> 
  <div class="app-container">
    <el-card class="operate-container" shadow="never">
      <i class="el-icon-tickets" style="margin-top: 5px"></i>
      <span style="margin-top: 5px">数据列表</span>
    </el-card>
    <div class="table-container">
      <el-table ref="productAttrCateTable"
                style="width: 100%"
                :data="list"
                v-loading="listLoading"
                border>
        <el-table-column label="编号" width="300" align="center">
          <template slot-scope="scope">{{scope.row.categoryId}}</template>
        </el-table-column>
        <el-table-column label="类型名称" align="center">
          <template slot-scope="scope">{{scope.row.categoryName}}</template>
        </el-table-column>
        <!-- <el-table-column label="属性数量" width="200" align="center">
          <template slot-scope="scope">{{scope.row.attributeCount==null?0:scope.row.attributeCount}}</template>
        </el-table-column> -->
        <el-table-column label="设置" width="200" align="center">
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="getAttrList(scope.row)">属性列表
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination-container">
      <el-pagination
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        layout="total, sizes,prev, pager, next,jumper"
        :page-size="listQuery.pageSize"
        :page-sizes="[5,10,15]"
        :current-page.sync="listQuery.pageNum"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>
<script>
  import {fetchList} from '@/api/productAttrCate'

  export default {
    name: 'productAttrCateList',
    data() {
      return {
        list: null,
        total: null,
        listLoading: true,
        listQuery: {
          pageNum: 1,
          pageSize: 5
        },
        dialogVisible: false,
        dialogTitle:'',
        productAttrCate:{
          name:'',
          id:null
        },
        rules: {
          name: [
            { required: true, message: '请输入类型名称', trigger: 'blur' }
          ]
        }
      }
    },
    created() {
      this.getList();
    },
    methods: {
      getList() {
        this.listLoading = true;
        fetchList(this.listQuery).then(response => {
          this.listLoading = false;
          this.list = response.data.data.records;
          this.total = response.data.data.total;
        });
      },
      handleSizeChange(val) {
        this.listQuery.pageNum = 1;
        this.listQuery.pageSize = val;
        this.getList();
      },
      handleCurrentChange(val) {
        this.listQuery.pageNum = val;
        this.getList();
      },
      getAttrList(row) {
        this.$router.push({path: '/pms/productAttrList',query:{cid:row.categoryId,cname:row.categoryName}})
      },
    }
  }
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
</style>


