<template>
    <div>
      <myinput placeholder="请输入搜索内容" width="width:78.5%"></myinput>
      <mybtn class-name="el-icon-search" id-name="whitebtn"></mybtn>
    </div>
</template>

<script>
  import myinput from './input'
  import mybtn from './button'
    export default {
        name: "mysearch",
      components:{
        myinput:myinput,
        mybtn:mybtn
      }
    }
</script>

<style scoped>
  div{
    /*outline: 1px solid pink;*/
    height: 37px;
    width: 30%;
    float: right;
    margin-top: 25px;
    margin-right: 6%;
  }
</style>
