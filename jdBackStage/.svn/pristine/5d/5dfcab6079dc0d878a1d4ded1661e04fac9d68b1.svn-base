<template>
  <input :type="type"
         :placeholder="placeholder"
         :style="width"
         v-on:focus="$emit('focus')"
         v-on:blur="$emit('blur')"
         :name="name"
         :class="className"
         :id="idName"
         :value="value" :readonly="readonly">
</template>

<script>
    export default {
        name: "myinput",
      props:['type','placeholder','width','name','className','idName','value','readonly']
    }
</script>

<style scoped>
  *{
    padding: 0;
    margin: 0;
  }
  input{
    height: 35px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
  }
  input:focus{
    outline: none;
  }
</style>
