<template> 
  <div class="app-container">
    <el-card
      class="operate-container"
      shadow="never"
    >

      <i
        class="el-icon-tickets"
        style="margin-top: 5px"
      ></i>
      <span style="margin-top: 5px">数据列表</span>
      <el-button
        class="btn-add"
        @click="addProductAttr()"
        size="mini"
      >
        添加
      </el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="productAttrTable"
        :data="list"
        style="width: 100%"
        @selection-change="handleSelectionChange"
        v-loading="listLoading"
        border
      >
        <el-table-column
          type="selection"
          width="60"
          align="center"
        ></el-table-column>
        <el-table-column
          label="编号"
          width="200"
          align="center"
        >
          <template slot-scope="scope">{{scope.row.id}}</template>
        </el-table-column>
        <el-table-column
          label="属性名称"
          width="200"
          align="center"
        >
          <template slot-scope="scope">{{scope.row.attributeName}}</template>
        </el-table-column>
        <el-table-column
          label="商品类型"
          width="200"
          align="center"
        >
          <template
            slot-scope="scope"
            v-bind="categoryName"
          > {{categoryName}} </template>
        </el-table-column>
        <el-table-column
          label="可选值列表"
          align="center"
        >
          <template slot-scope="scope">{{scope.row.value.toString()}}</template>
        </el-table-column>
        <el-table-column
          label="操作"
          width="200"
          align="center"
        >
          <template slot-scope="scope">
            <el-button
              size="mini"
              @click="handleUpdate(scope.$index, scope.row)"
            >编辑
            </el-button>
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.row.id)"
            >删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="batch-operate-container">
      <el-select
        size="small"
        v-model="operateType"
        placeholder="批量操作"
      >
        <el-option
          v-for="item in operates"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        >
        </el-option>
      </el-select>
      <el-button
        style="margin-left: 20px"
        class="search-button"
        @click="handleBatchOperate()"
        type="primary"
        size="small"
      >
        确定
      </el-button>
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
        :total="total"
      >
      </el-pagination>
    </div>
  </div>
</template>
<script>
import { fetchList, deleteProductAttr, fetchValueList } from '@/api/productAttr'

export default {
  name: 'productAttrList',
  data() {
    return {
      list: [],
      total: null,
      listLoading: true,
      listQuery: {
        pageNum: 1,
        pageSize: 5,
        type: this.$route.query.type
      },
      operateType: null,
      multipleSelection: [],
      operates: [
        {
          label: "删除",
          value: "deleteProductAttr"
        }
      ],
      categoryName: null
    }
  },
  created() {
    this.getList();
    this.categoryName = this.$route.query.cname;
  },
  methods: {
    getList() {
      this.listLoading = true;
      fetchList(this.$route.query.cid, this.listQuery).then(async response => {
        this.listLoading = false;
        const arr = response.data.data.records;
        for (var key of arr) {
          key.value = [];
          var res = await this.getValueList(key.id);
          if (res != null) {
            for (var i = 0; i < res.data.data.length; i++) {
              key.value.push(res.data.data[i].attributeValue);
            }
          }
        }
        this.list = arr
        this.total = response.data.data.total;
      });
    },
    async getValueList(id) {
      return await fetchValueList(id)
    },
    addProductAttr() {
      this.$router.push({ path: '/pms/addProductAttr', query: { cid: this.$route.query.cid } });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleBatchOperate() {
      if (this.multipleSelection < 1) {
        this.$message({
          message: '请选择一条记录',
          type: 'warning',
          duration: 1000
        });
        return;
      }
      if (this.operateType !== 'deleteProductAttr') {
        this.$message({
          message: '请选择批量操作类型',
          type: 'warning',
          duration: 1000
        });
        return;
      }
      let ids = [];
      for (let i = 0; i < this.multipleSelection.length; i++) {
        ids.push(this.multipleSelection[i].id);
      }
      this.handleDeleteProductAttr(ids);
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
    handleUpdate(index, row) {
      this.$router.push({ name: 'updateProductAttr',params: { value: row.value, name:row.attributeName,id:row.id} });
    },
    handleDeleteProductAttr(id) {
      this.$confirm('是否要删除该属性', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteProductAttr(id).then(response => {
          this.$message({
            message: '删除成功',
            type: 'success',
            duration: 1000
          });
          this.getList();
        });
      });
    },
    handleDelete(id) {
      this.handleDeleteProductAttr(id);
    },
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
</style>


