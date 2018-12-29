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
        name: "multipleSelection",
      data() {
        return {
          options: [{
            value: '选项1',
            label: '黄金糕'
          }, {
            value: '选项2',
            label: '双皮奶'
          }, {
            value: '选项3',
            label: '蚵仔煎'
          }, {
            value: '选项4',
            label: '龙须面'
          }, {
            value: '选项5',
            label: '北京烤鸭'
          }],
          value5: [],
          value11: []
        }
      }
    }
</script>

<style scoped>

</style>
