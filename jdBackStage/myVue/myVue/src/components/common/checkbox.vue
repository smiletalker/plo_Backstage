<template>
  <!-- `checked` 为 true 或 false -->
  <el-checkbox v-model="checked"></el-checkbox>
</template>

<script>
    export default {
        name: "mycheckbox",
      data() {
        return {
          checked: false
        };
      }
    }
</script>

<style scoped>
</style>
