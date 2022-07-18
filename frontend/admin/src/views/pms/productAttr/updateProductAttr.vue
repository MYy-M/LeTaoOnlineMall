<template>
  <product-attr-detail
    :is-edit='true'
    v-if="flag"
    v-bind:attribute="attribute"
  ></product-attr-detail>
</template>

<script>
import ProductAttrDetail from './components/ProductAttrDetail'
export default {
  name: 'updateProductAttr',
  data() {
    return {
      attribute: {
        valueList: "",
        name: "",
        categoryId: ""
      },
      flag: false
    }
  },
  components: { ProductAttrDetail },
  created() {
    this.attribute.valueList = this.$route.params.value;
    this.attribute.name = this.$route.params.name;
    this.attribute.categoryId = this.$route.params.id;
    console.log(this.attribute)
    this.flag = true;
  }
}
</script>

<style scoped>
</style>
