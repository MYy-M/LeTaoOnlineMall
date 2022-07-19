<template>
  <div style="margin-top: 50px">
    <el-form
      :model="value"
      ref="productAttrForm"
      label-width="120px"
      style="width: 720px"
      size="small"
    >
      <el-form-item label="属性类型：">
        <el-select
          v-model="value.productAttributeCategoryId"
          placeholder="请选择属性类型"
          @change="handleProductAttrChange"
        >
          <el-option
            v-for="item in productAttributeCategoryOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品规格：">
        <el-card
          shadow="never"
          class="cardBg"
        >
          <div v-for="(productAttr,idx) in selectProductAttr">
            {{productAttr.name}}：
            <el-checkbox-group v-model="selectProductAttr[idx].values">
              <el-checkbox
                v-for="item in productAttr.inputList"
                :label="item.attributeValue"
                :key="item.id"
                class="littleMarginLeft"
              ></el-checkbox>
            </el-checkbox-group>
          </div>
        </el-card>
        <el-table
          style="width: 100%;margin-top: 20px"
          :data="value.skuStockList"
          border
        >
          <el-table-column
            v-for="(item,index) in selectProductAttr"
            :label="item.name"
            :key="item.id"
            align="center"
          >
            <template slot-scope="scope">
              {{getProductSkuSp(scope.row,index)}}
            </template>
          </el-table-column>
          <el-table-column
            label="销售价格"
            width="80"
            align="center"
          >
            <template slot-scope="scope">
              <el-input v-model="scope.row.price"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            label="商品库存"
            width="80"
            align="center"
          >
            <template slot-scope="scope">
              <el-input v-model="scope.row.stock"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            width="80"
            align="center"
          >
            <template slot-scope="scope">
              <el-button
                type="text"
                @click="handleRemoveProductSku(scope.$index, scope.row)"
              >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <el-button
          type="primary"
          style="margin-top: 20px"
          @click="handleRefreshProductSkuList"
        >生成sku列表
        </el-button>
        <el-button
          type="primary"
          style="margin-top: 20px"
          @click="handleSyncProductSkuPrice"
        >同步sku价格
        </el-button>
        <el-button
          type="primary"
          style="margin-top: 20px"
          @click="handleSyncProductSkuStock"
        >同步sku库存
        </el-button>
      </el-form-item>
      <el-form-item
        label="属性图片："
        v-if="hasAttrPic"
      >
        <el-card
          shadow="never"
          class="cardBg"
        >
          <div v-for="(item,index) in selectProductAttrPics">
            <span>{{item.name}}:</span>
            <!-- <el-upload
              class="upload-demo"
              action=""
              :auto-upload=false
              :data="fileList"
              :show-file-list=true
              list-type="picture"
              accept=".jpg,.jpeg,.png"
              :limit=1
              :on-change="upLoadFile"
              v-model="item.pic"
              style="width: 300px;display: inline-block;margin-left: 10px"
            >
              <el-button
                size="small"
                type="primary"
              >点击上传</el-button>
              <div
                slot="tip"
                class="el-upload__tip"
              >只能上传jpg/jpeg/png文件，且不超过500kb</div>
            </el-upload> -->
          </div>
        </el-card>
      </el-form-item>
      <el-form-item label="商品相册：">
        <el-button id="select_img_button" type="primary"
          style="margin-top: 20px">上传图片</el-button>
        <input type="file" id="inputImgFile" style="display:none" accept="image/png, image/jpeg, image/gif, image/jpg">
        <!-- <el-upload
          class="upload-demo"
          action=""
          :auto-upload=false
          :multiple="false"
          :file-list="fileList"
          :show-file-list=true
          list-type="picture"
          accept=".jpg,.jpeg,.png"
          :limit=1
          v-model="selectProductPics"
        >
          <el-button
            size="small"
            type="primary"
          >点击上传</el-button>
          <div
            slot="tip"
            class="el-upload__tip"
          >只能上传jpg/jpeg/png文件，且不超过500kb</div>
        </el-upload> -->
      </el-form-item>
      <el-form-item style="text-align: center">
        <el-button
          size="medium"
          @click="handlePrev"
        >上一步，填写商品促销</el-button>
        <el-button
          type="primary"
          size="medium"
          @click="handleFinishCommit()"
        >完成，提交商品</el-button>
      </el-form-item>
      <div>{{this.selectProductPics}}</div>
    </el-form>
  </div>
</template>

<script>
import { fetchList as fetchProductAttrCateList } from '@/api/productAttrCate'
import { fetchList as fetchProductAttrList, fetchValueList } from '@/api/productAttr'
import SingleUpload from '@/components/Upload/singleUpload'
import MultiUpload from '@/components/Upload/multiUpload'

select_img_button.onclick = function(){
    var ie = navigator.appName == "Microsoft Internet Explorer" ? true : false;
      if (ie) {
        inputImgFile.click();
      } else {
        var a = document.createEvent("MouseEvents");
        a.initEvent("click", true, true);
        inputImgFile.dispatchEvent(a);
      }
}
inputImgFile.onchange = function(){
    my_data = inputImgFile.files[0];
    // 获取上传图片信息
    var reader = new FileReader();
    // 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
    reader.addEventListener("load", function () {
        show_img.src = reader.result;
        }, false);
      // 调用reader.readAsDataURL()方法，把图片转成base64
      reader.readAsDataURL(my_data);
}

export default {
  name: "ProductAttrDetail",
  components: { SingleUpload, MultiUpload },
  props: {
    value: Object,
    isEdit: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      //编辑模式时是否初始化成功
      hasEditCreated: false,
      //商品属性分类下拉选项
      productAttributeCategoryOptions: [],
      //选中的商品属性
      selectProductAttr: [],
      //选中的商品属性图片
      selectProductAttrPics: [],
      //可手动添加的商品属性
      addProductAttrValue: '',
      file: null,
      selectProductPics:null
    }
  },
  computed: {
    //是否有商品属性图片
    hasAttrPic() {
      if (this.selectProductAttrPics.length < 1) {
        return false;
      }
      return true;
    },
    //商品的编号
    productId() {
      return this.value.id;
    },
    fileList() {
      return [{
        name: this.imageName,
        url: this.imageUrl
      }]
    },
    //商品的主图和画册图片
    // selectProductPics: {
    //   get: function () {
    //     let pics = [];
    //     if (this.value.pic === undefined || this.value.pic == null || this.value.pic === '') {
    //       return pics;
    //     }
    //     pics.push(this.value.pic);
    //     return pics;
    //   },
    //   set: function (newValue) {
    //     if (newValue == null || newValue.length === 0) {
    //       this.value.pic = null;
    //     } else {
    //       this.value.pic = newValue[0];
    //     }
    //   }
    // }
  },
  created() {
    this.getProductAttrCateList();
  },
  watch: {
    productId: function (newValue) {
      if (!this.isEdit) return;
      if (this.hasEditCreated) return;
      if (newValue === undefined || newValue == null || newValue === 0) return;
      this.handleEditCreated();
    }
  },
  methods: {
    upLoadFile(file) {
      this.file = file.raw;
    },
    //ac
    handleEditCreated() {
      //根据商品属性分类id获取属性和参数
      if (this.value.productAttributeCategoryId != null) {
        this.handleProductAttrChange(this.value.productAttributeCategoryId);
      }
      this.hasEditCreated = true;
    },
    //wl
    getProductAttrCateList() {
      let param = { pageNum: 1, pageSize: 100 };
      fetchProductAttrCateList(param).then(response => {
        this.productAttributeCategoryOptions = [];
        let list = response.data.data.records;
        for (let i = 0; i < list.length; i++) {
          this.productAttributeCategoryOptions.push({ label: list[i].categoryName, value: list[i].categoryId });
        }
      });
    },
    //ac
    getProductAttrList(cid) {
      let param = { pageNum: 1, pageSize: 100 };
      fetchProductAttrList(cid, param).then(async response => {
        let list = response.data.data.records;
        this.selectProductAttr = [];
        for (let i = 0; i < list.length; i++) {

          let values = [];
          if (this.isEdit) {
            //编辑状态下获取选中属性
            values = this.getEditAttrValues(i);
          }
          var res = await this.getAttrbuteValue(list[i].id);
          this.selectProductAttr.push({
            id: list[i].id,
            name: list[i].attributeName,
            values: values,
            inputList: []
          });
          for (var j = 0; j < res.data.data.length; j++) {
            this.selectProductAttr[i].inputList.push(res.data.data[j])
          }
          // this.selectProductAttr[i].inputList=this.selectProductAttr[i].inputList.toString();
        }
        if (this.isEdit) {
          //编辑模式下刷新商品属性图片
          this.refreshProductAttrPics();
        }
      });
    },
    //ac
    async getAttrbuteValue(id) {
      return await fetchValueList(id)
    },
    //获取选中的属性值 
    getEditAttrValues(index) {
      let values = new Set();
      if (index === 0) {
        for (let i = 0; i < this.value.skuStockList.length; i++) {
          let sku = this.value.skuStockList[i];
          let spData = JSON.parse(sku.spData);
          if (spData != null && spData.length >= 1) {
            values.add(spData[0].value);
          }
        }
      } else if (index === 1) {
        for (let i = 0; i < this.value.skuStockList.length; i++) {
          let sku = this.value.skuStockList[i];
          let spData = JSON.parse(sku.spData);
          if (spData != null && spData.length >= 2) {
            values.add(spData[1].value);
          }
        }
      } else {
        for (let i = 0; i < this.value.skuStockList.length; i++) {
          let sku = this.value.skuStockList[i];
          let spData = JSON.parse(sku.spData);
          if (spData != null && spData.length >= 3) {
            values.add(spData[2].value);
          }
        }
      }
      return Array.from(values);
    },
    //获取属性的值
    getEditParamValue(id) {
      for (let i = 0; i < this.value.productAttributeValueList.length; i++) {
        if (id === this.value.productAttributeValueList[i].productAttributeId) {
          return this.value.productAttributeValueList[i].value;
        }
      }
    },
    handleProductAttrChange(value) {
      this.getProductAttrList(value);
    },
    getInputListArr(inputList) {
      return inputList.split(';');
    },
    getProductSkuSp(row, index) {
      let spData = JSON.parse(row.spData);
      if (spData != null && index < spData.length) {
        return spData[index].value;
      } else {
        return null;
      }
    },
    handleRefreshProductSkuList() {
      this.$confirm('刷新列表将导致sku信息重新生成，是否要刷新', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.refreshProductAttrPics();
        this.refreshProductSkuList();
      });
    },
    handleSyncProductSkuPrice() {
      this.$confirm('将同步第一个sku的价格到所有sku,是否继续', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.value.skuStockList !== null && this.value.skuStockList.length > 0) {
          let tempSkuList = [];
          tempSkuList = tempSkuList.concat(tempSkuList, this.value.skuStockList);
          let price = this.value.skuStockList[0].price;
          for (let i = 0; i < tempSkuList.length; i++) {
            tempSkuList[i].price = price;
          }
          this.value.skuStockList = [];
          this.value.skuStockList = this.value.skuStockList.concat(this.value.skuStockList, tempSkuList);
        }
      });
    },
    handleSyncProductSkuStock() {
      this.$confirm('将同步第一个sku的库存到所有sku,是否继续', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.value.skuStockList !== null && this.value.skuStockList.length > 0) {
          let tempSkuList = [];
          tempSkuList = tempSkuList.concat(tempSkuList, this.value.skuStockList);
          let stock = this.value.skuStockList[0].stock;
          let lowStock = this.value.skuStockList[0].lowStock;
          for (let i = 0; i < tempSkuList.length; i++) {
            tempSkuList[i].stock = stock;
            tempSkuList[i].lowStock = lowStock;
          }
          this.value.skuStockList = [];
          this.value.skuStockList = this.value.skuStockList.concat(this.value.skuStockList, tempSkuList);
        }
      });
    },
    refreshProductSkuList() {
      this.value.skuStockList = [];
      let skuList = this.value.skuStockList;
      //只有一个属性时
      if (this.selectProductAttr.length === 1) {
        let attr = this.selectProductAttr[0];
        for (let i = 0; i < attr.values.length; i++) {
          skuList.push({
            spData: JSON.stringify([{ key: attr.name, value: attr.values[i] }])
          });
        }
      } else if (this.selectProductAttr.length === 2) {
        let attr0 = this.selectProductAttr[0];
        let attr1 = this.selectProductAttr[1];
        for (let i = 0; i < attr0.values.length; i++) {
          if (attr1.values.length === 0) {
            skuList.push({
              spData: JSON.stringify([{ key: attr0.name, value: attr0.values[i] }])
            });
            continue;
          }
          for (let j = 0; j < attr1.values.length; j++) {
            let spData = [];
            spData.push({ key: attr0.name, value: attr0.values[i] });
            spData.push({ key: attr1.name, value: attr1.values[j] });
            skuList.push({
              spData: JSON.stringify(spData)
            });
          }
        }
      } else {
        let attr0 = this.selectProductAttr[0];
        let attr1 = this.selectProductAttr[1];
        let attr2 = this.selectProductAttr[2];
        for (let i = 0; i < attr0.values.length; i++) {
          if (attr1.values.length === 0) {
            skuList.push({
              spData: JSON.stringify([{ key: attr0.name, value: attr0.values[i] }])
            });
            continue;
          }
          for (let j = 0; j < attr1.values.length; j++) {
            if (attr2.values.length === 0) {
              let spData = [];
              spData.push({ key: attr0.name, value: attr0.values[i] });
              spData.push({ key: attr1.name, value: attr1.values[j] });
              skuList.push({
                spData: JSON.stringify(spData)
              });
              continue;
            }
            for (let k = 0; k < attr2.values.length; k++) {
              let spData = [];
              spData.push({ key: attr0.name, value: attr0.values[i] });
              spData.push({ key: attr1.name, value: attr1.values[j] });
              spData.push({ key: attr2.name, value: attr2.values[k] });
              skuList.push({
                spData: JSON.stringify(spData)
              });
            }
          }
        }
      }
    },
    refreshProductAttrPics() {
      this.selectProductAttrPics = [];
      if (this.selectProductAttr.length >= 1) {
        let values = this.selectProductAttr[0].values;
        for (let i = 0; i < values.length; i++) {
          let pic = null;
          if (this.isEdit) {
            //编辑状态下获取图片
            pic = this.getProductSkuPic(values[i]);
          }
          this.selectProductAttrPics.push({ name: values[i], pic: pic })
        }
      }
    },
    //获取商品相关属性的图片
    getProductSkuPic(name) {
      for (let i = 0; i < this.value.skuStockList.length; i++) {
        let spData = JSON.parse(this.value.skuStockList[i].spData);
        if (name === spData[0].value) {
          return this.value.skuStockList[i].pic;
        }
      }
      return null;
    },
    handleRemoveProductSku(index, row) {
      let list = this.value.skuStockList;
      if (list.length === 1) {
        list.pop();
      } else {
        list.splice(index, 1);
      }
    },
    handlePrev() {
      this.$emit('prevStep')
    },
    //合并商品属性
    mergeProductAttrValue() {
      this.value.productAttributeValueList = [];
      for (let i = 0; i < this.selectProductAttr.length; i++) {
        let attr = this.selectProductAttr[i];
        this.value.productAttributeValueList.push({
          productAttributeId: attr.id,
          value: attr.values
        });
      }
    },
    //合并商品属性图片
    mergeProductAttrPics() {
      this.value.pic=this.selectProductPics;
      for (let i = 0; i < this.selectProductAttrPics.length; i++) {
        for (let j = 0; j < this.value.skuStockList.length; j++) {
          let spData = JSON.parse(this.value.skuStockList[j].spData);
          if (spData[0].value === this.selectProductAttrPics[i].name) {
            this.value.skuStockList[j].pic = this.selectProductAttrPics[i].pic;
          }
        }
      }
    },
    handleFinishCommit() {
      this.mergeProductAttrValue();
      this.mergeProductAttrPics();
      console.log(this.value)
      this.$emit('finishCommit', this.isEdit);
    }
  }
}
</script>

<style scoped>
.littleMarginLeft {
  margin-left: 10px;
}

.littleMarginTop {
  margin-top: 10px;
}

.paramInput {
  width: 250px;
}

.paramInputLabel {
  display: inline-block;
  width: 100px;
  text-align: right;
  padding-right: 10px;
}

.cardBg {
  background: #f8f9fc;
}
</style>
