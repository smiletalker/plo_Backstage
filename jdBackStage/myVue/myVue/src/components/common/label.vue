<template>
  <label :class="className"
         :id="idName">
    {{labelText}}
  </label>
</template>

<script>
    export default {
        name: "mylabel",
      props:['className','idName','labelText']
    }
</script>

<style scoped>
  label{
    font-size: 14px;
    letter-spacing: 2px;
  }
  .right{
    margin-right: 3%;
  }
</style>
