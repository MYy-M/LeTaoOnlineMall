<template> 
  <div class="app-container">
    <el-card
      class="filter-container"
      shadow="never"
    >
      <div>
        <i class="el-icon-search"></i>
        <span>筛选搜索</span>
        <el-button
          style="float: right"
          @click="handleSearchList()"
          type="primary"
          size="small"
        >
          查询结果
        </el-button>
        <el-button
          style="float: right;margin-right: 15px"
          @click="handleResetSearch()"
          size="small"
        >
          重置
        </el-button>
      </div>
      <div style="margin-top: 15px">
        <el-form
          :inline="true"
          :model="listQuery"
          size="small"
          label-width="140px"
        >
          <el-form-item label="商品名称：">
            <el-input
              style="width: 203px"
              v-model="listQuery.keyword"
              placeholder="名称"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品货号：">
            <el-input
              style="width: 203px"
              v-model="listQuery.productSn"
              placeholder="货号"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品分类：">
            <el-select
              v-model="listQuery.productCategoryId"
              placeholder="请选择"
            >
              <el-option
                v-for="item in productCateOptions"
                :key="item.categoryId"
                :label="item.categoryName"
                :value="item.categoryId"
              >
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
    <el-card
      class="operate-container"
      shadow="never"
    >
      <i class="el-icon-tickets"></i>
      <span>数据列表</span>
      <el-button
        class="btn-add"
        @click="handleAddProduct()"
        size="mini"
      >
        添加
      </el-button>
    </el-card>
    <div class="table-container">
      <el-table
        ref="productTable"
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
          <template slot-scope="scope">{{scope.row.cid}}</template>
        </el-table-column>
        <el-table-column
          label="商品图片"
          width="120"
          align="center"
        >
          <template slot-scope="scope"><img
              style="height: 80px"
              :src="scope.row.cpicture"
            ></template>
        </el-table-column>
        <el-table-column
          label="商品名称"
          align="center"
        >
          <template slot-scope="scope">
            <p>{{scope.row.cname}}</p>
          </template>
        </el-table-column>
        <el-table-column
          label="价格"
          width="120"
          align="center"
        >
          <template slot-scope="scope">
            <p>价格：￥{{scope.row.cprice}}</p>
          </template>
        </el-table-column>
        <el-table-column
          label="标签"
          width="140"
          align="center"
        >
          <template slot-scope="scope">
            <!-- <p>上架：
              <el-switch
                @change="handlePublishStatusChange(scope.$index, scope.row)"
                :active-value="1"
                :inactive-value="0"
                v-model="scope.row.publishStatus">
              </el-switch>
            </p> -->
            <!--  -->
            <p>推荐：
              <el-switch
                @change="handleRecommendStatusChange(scope.$index, scope.row)"
                :active-value="1"
                :inactive-value="0"
                v-model="scope.row.isRecommend"
              >
              </el-switch>
            </p>
          </template>
        </el-table-column>
        <!-- <el-table-column label="排序" width="100" align="center">
          <template slot-scope="scope">{{scope.row.sort}}</template>
        </el-table-column> -->
        <el-table-column
          label="库存"
          width="100"
          align="center"
        >
          <template slot-scope="scope">
            {{scope.row.cnum}}
          </template>

        </el-table-column>
        <el-table-column
          label="销量"
          width="100"
          align="center"
        >
          <template slot-scope="scope">{{scope.row.csales}}</template>
        </el-table-column>
        <el-table-column
          label="操作"
          width="160"
          align="center"
        >
          <template slot-scope="scope">
            <p>
              <el-button
                size="mini"
                @click="handleUpdateProduct(scope.$index, scope.row)"
              >编辑
              </el-button>
            </p>
            <p>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)"
              >删除
              </el-button>
            </p>
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
    <el-dialog
      title="设为推荐"
      :visible.sync="showUpdateNewDialog"
      width="40%"
    >
      <el-upload
        class="upload-demo"
        action=""
        :auto-upload=false
        :on-preview="handlePreview"
        :data="fileList"
        :show-file-list=true
        list-type="picture"
        accept=".jpg,.jpeg,.png"
        :limit=1
        :on-change="upLoadFile"
      >
        <el-button
          size="small"
          type="primary"
        >点击上传</el-button>
        <div
          slot="tip"
          class="el-upload__tip"
        >只能上传jpg/jpeg/png文件，且不超过500kb</div>
      </el-upload>
      <span
        slot="footer"
        class="dialog-footer"
      >
        <el-button @click="showUpdateRecommendDialog = false">取 消</el-button>
        <el-button
          type="primary"
          @click="updateRecommendStatus"
        >确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import {
  fetchList,
  updateDeleteStatus,
  updateRecommendStatus,
  cancelRecommendStatus
} from '@/api/product'
import { fetchList as fetchSkuStockList, update as updateSkuStockList } from '@/api/skuStock'
import { fetchList as fetchProductAttrList } from '@/api/productAttr'
import { fetchList as fetchProductCateList } from '@/api/productAttrCate'

const defaultListQuery = {
  keyword: null,
  pageNum: 1,
  pageSize: 5,
  productSn: null,
  productCategoryId: null,

};
export default {
  name: "productList",
  data() {
    return {
      operates: [
        {
          label: "设为推荐",
          value: "recommendOn"
        },
        {
          label: "取消推荐",
          value: "recommendOff"
        },
        {
          label: "设为新品",
          value: "newOn"
        },
        {
          label: "取消新品",
          value: "newOff"
        },
        {
          label: "转移到分类",
          value: "transferCategory"
        },
        {
          label: "移入回收站",
          value: "recycle"
        }
      ],
      operateType: null,
      listQuery: Object.assign({}, defaultListQuery),
      list: null,
      total: null,
      listLoading: true,
      selectProductCateValue: null,
      multipleSelection: [],
      productCateOptions: [],
      showUpdateNewDialog: false,
      fileList: [],
      file: null,
      recommendId: null
    }
  },
  created() {
    this.getList();
    this.getProductCateList();
  },
  watch: {
    selectProductCateValue: function (newValue) {
      if (newValue != null && newValue.length == 2) {
        this.listQuery.productCategoryId = newValue[1];
      } else {
        this.listQuery.productCategoryId = null;
      }

    }
  },
  methods: {
    upLoadFile(file) {
      this.file = file.raw;
    },
    getProductSkuSp(row, index) {
      let spData = JSON.parse(row.spData);
      if (spData != null && index < spData.length) {
        return spData[index].value;
      } else {
        return null;
      }
    },
    getList() {
      this.listLoading = true;
      fetchList(this.listQuery).then(response => {
        console.log(response)
        this.listLoading = false;
        this.list = response.data.data.records;
        this.total = response.data.data.total;
      });
    },
    getProductCateList() {
      fetchProductCateList(this.listQuery).then(response => {
        let list = response.data.data.records;
        this.productCateOptions = list;
      });
    },
    handlePreview(file) {
      console.log(file)
    },
    handleSearchList() {
      this.listQuery.pageNum = 1;
      this.getList();
    },
    handleAddProduct() {
      this.$router.push({ path: '/pms/addProduct' });
    },
    handleBatchOperate() {
      if (this.operateType == null) {
        this.$message({
          message: '请选择操作类型',
          type: 'warning',
          duration: 1000
        });
        return;
      }
      if (this.multipleSelection == null || this.multipleSelection.length < 1) {
        this.$message({
          message: '请选择要操作的商品',
          type: 'warning',
          duration: 1000
        });
        return;
      }
      this.$confirm('是否要进行该批量操作?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = [];
        for (let i = 0; i < this.multipleSelection.length; i++) {
          ids.push(this.multipleSelection[i].id);
        }
        switch (this.operateType) {
          case this.operates[0].value:
            this.updateRecommendStatus(1, ids);
            break;
          case this.operates[1].value:
            this.updateRecommendStatus(0, ids);
            break;
          case this.operates[2].value:
            this.updateNewStatus(1, ids);
            break;
          case this.operates[3].value:
            this.updateNewStatus(0, ids);
            break;
          case this.operates[4].value:
            break;
          case this.operates[5].value:
            this.updateDeleteStatus(1, ids);
            break;
          default:
            break;
        }
        this.getList();
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
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },

    handleRecommendStatusChange(index, row) {

      let ids = [];
      ids.push(row.id);
      this.recommendId = row.cid
      console.log(this.recommendId)
      if (row.isRecommend == 1) {
        this.showUpdateNewDialog = true;
      }
      else if (row.isRecommend == 0)
        this.cancelRecommendStatus();
    },
    handleResetSearch() {
      this.selectProductCateValue = [];
      this.listQuery = Object.assign({}, defaultListQuery);
    },
    handleDelete(index, row) {
      this.$confirm('是否要进行删除操作?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = [];
        ids.push(row.cid);
        this.updateDeleteStatus(1, ids);
      });
    },
    handleUpdateProduct(index, row) {
      this.$router.push({ path: '/pms/updateProduct', query: { id: row.cid } });
    },
    updateRecommendStatus() {
      const fd = new FormData();
      fd.append('file', this.file)
      fd.append('cid', this.recommendId)
      updateRecommendStatus(fd).then(response => {
        this.$message({
          message: '修改成功',
          type: 'success',
          duration: 1000
        });
      });

    },
    cancelRecommendStatus() {
      console.log(this.recommendId)
      cancelRecommendStatus(this.recommendId).then(response => {
        this.$message({
          message: '修改成功',
          type: 'success',
          duration: 1000
        });
      });
    },
    updateDeleteStatus(deleteStatus, ids) {
      let params = new URLSearchParams();
      console.log(ids)
      params.append('ids', ids);
      params.append('deleteStatus', deleteStatus);
      updateDeleteStatus(ids[0]).then(response => {
        this.$message({
          message: '删除成功',
          type: 'success',
          duration: 1000
        });
      });
      this.getList();
    },
  }
}
</script>
<style></style>


