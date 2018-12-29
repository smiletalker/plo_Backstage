<template>
  <!--element组件中的select选择器中的
      基础多选-->
  <el-select v-model="value5" multiple placeholder="请选择">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value">
    </el-option>
  </el-select>
</template>

<script>
  export default {
    name: "ybmulti",
    data() {
      return {
        options: [{
          value: '选项1',
          label: '订单上下架'
        }, {
          value: '选项2',
          label: '订单查看'
        }, {
          value: '选项3',
          label: '发表活动'
        }, {
          value: '选项4',
          label: '轰动删除'
        },],
        value5: [],
        value11: []
      }
    }
  }
</script>

<style scoped>

</style>
