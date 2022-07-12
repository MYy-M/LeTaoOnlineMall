<template> 
  <store-detail :is-edit='true'></store-detail>
</template>
<script>
  import StoreDetail from './component/StoreDetail'
  export default {
    name: 'updateProduct',
    components: { StoreDetail }
  }
</script>
<style>
</style>
