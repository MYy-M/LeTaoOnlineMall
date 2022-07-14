<template> 
  <store-detail :is-edit='false' ></store-detail>
</template>
<script>
  import StoreDetail from './component/StoreDetail'
  export default {
    name: 'addStore',
    components: { StoreDetail },
  }
</script>
<style>
</style>
