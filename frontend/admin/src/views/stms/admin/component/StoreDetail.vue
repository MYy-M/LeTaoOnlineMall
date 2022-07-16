<template>
  <el-card
    class="form-container"
    shadow="never"
  >
    <div>
      <div>
        <h1
          v-if="isEdit"
          style="text-align: center;"
        >修改门店</h1>
        <h1
          v-else
          style="text-align: center;"
        >添加门店</h1>
      </div>
      <el-form
        :model="store"
        :rules="rules"
        ref="storeInfoForm"
        label-width="120px"
        style="width: 600px"
        size="small"
      >
        <el-form-item
          label="门店名称："
          prop="sname"
        >
          <el-input v-model="store.sname"></el-input>
        </el-form-item>
        <el-form-item
          label="门店地址："
          prop="saddress"
        >
          <el-input v-model="store.saddress"></el-input>

        </el-form-item>
        <el-form-item
          label="联系电话："
          prop="sphone"
        >
          <el-input v-model="store.sphone"></el-input>
        </el-form-item>
        <el-form-item style="text-align: center">
          <el-button
            type="primary"
            size="medium"
            @click="saveStore"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </div>
  </el-card>
</template>

<script>
import { addStore, updateStore } from '@/api/store';
const defaultStore = {
  sname: '',
  saddress: '',
  sphone: '',
  sid: ''
}
export default {
  name: "StoreDetail",
  props: {
    value: {
      type: Object,
      default: {
        name: '',
        address: '',
        phone: '',
        id: ''
      }
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
        sname: [
          { required: true, message: '请输入门店名称', trigger: 'blur' },
          { min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur' }
        ],
        saddress: [{ required: true, message: '请输入门店地址', trigger: 'blur' }],
        sphone: [{ required: true, message: '请输入门店电话', trigger: 'blur' },
        { min: 7, max: 12, message: '长度在 7 到 12 个字符', trigger: 'blur' }],
      },
      store: {
        sname: '',
        saddress: '',
        sphone: '',
        sid: ''
      }
    };
  },
  created() {
    if (this.isEdit) {
      this.store.sname = this.value.name;
      this.store.sid = this.value.id;
      this.store.saddress = this.value.address;
      this.store.sphone = this.value.phone;
    }
    else {
      this.store = Object.assign({}, defaultStore);
    }
  },
  methods: {
    saveStore() {
      if (this.isEdit) {
        updateStore(this.store).then(response => {
          this.$message({
            message: '修改成功',
            type: 'success',
            duration: 1000
          });
        }
        )
      }
      else {
        addStore(this.store).then(response => {
          this.$message({
            message: '添加成功',
            type: 'success',
            duration: 1000
          });
        })
      }
    }
  }
}
</script>
<style scoped>
</style>
