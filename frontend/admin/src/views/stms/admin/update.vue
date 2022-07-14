<template> 
  <store-detail :is-edit='true' v-bind:value="value"></store-detail>
</template>
<script>
import StoreDetail from './component/StoreDetail'
import { getStoreById } from '@/api/store.js'
export default {
  name: 'updateProduct',
  components: { StoreDetail },
  data() {
    return {
      value: {
        id: '',
        name: '',
        address: '',
        phone: ''
      }
    }
  },
  mounted() {
    this.value.id = this.$route.query.sid;
    getStoreById(this.value.id).then(res => {
      this.value.name = res.data.data.sname;
      this.value.address = res.data.data.saddress;
      this.value.phone = res.data.data.sphone;
    })
  }
}
</script>
<style>
</style>
