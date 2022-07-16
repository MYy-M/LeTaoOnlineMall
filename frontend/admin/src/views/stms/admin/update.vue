<template> 
  <store-detail
    :is-edit='true'
    v-bind:value="value"
    v-if="flag"
  ></store-detail>
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
      },
      flag:false
    }
  },
  async created() {
    this.value.id = this.$route.query.sid;
    var res = await getStoreById(this.value.id)
    this.value.name = res.data.data.sname;
    this.value.address = res.data.data.saddress;
    this.value.phone = res.data.data.sphone;
    this.flag=true;
  }
}
</script>
<style>
</style>
