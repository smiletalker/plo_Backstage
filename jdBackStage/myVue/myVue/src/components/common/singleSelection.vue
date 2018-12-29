<template>
  <!--为el-select设置clearable属性，则可将选择器清空。需要注意的是，clearable属性仅适用于单选。
      element组件中的select选择器的
      可清空多选-->
  <el-select v-model="value4" clearable placeholder="请选择" class="myselect">
    <el-option
      v-for="item in parentoption"
      :key="item.value"
      :label="item.label"
      :value="item.value"
      :class="className"
      :id="idName">
    </el-option>

  </el-select>
</template>

<script>
  export default {
    name: "singleSelection",
    data() {
      return {
        value4: '',
        isshow:true
      }
    },
    props:['className','idName','parentoption']
  }
</script>

<style scoped>
  .myselect{
    width: 90px;
    height: 30px;
    margin-top: -15px;
  }
</style>
