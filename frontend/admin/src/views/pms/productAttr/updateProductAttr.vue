<template>
  <product-attr-detail :is-edit='true'></product-attr-detail>
</template>

<script>
  import ProductAttrDetail from './components/ProductAttrDetail'
  export default {
    name: 'updateProductAttr',
    data(){
      return{}
    },
    components: { ProductAttrDetail }
  }
</script>

<style scoped>

</style>
