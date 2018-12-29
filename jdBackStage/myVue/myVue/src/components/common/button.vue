<template>
  <button class="btn"
          v-on:click="$emit('btnClick')"
          :class="className"
          :id="idName">{{btnText}}</button>
</template>

<script>
    export default {
        name: "mybutton",
      props:['btnText','className','idName']
    }
</script>

<style scoped>
  *{
    margin: 0;
    padding: 0;
  }
  .btn{
    letter-spacing: 1px;
    color: black;
    padding: 10px 15px;
    background-color: white;
    border: none;
    border-radius: 3px;
    margin-left: -3px;
  }
  .btn:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  .btn:focus{
    outline: none;
  }
  #whitebtn{
    border: 1px solid #cecece;
    height: 37px;
    padding: 10px 10px;
    /*width: 21.5%;*/
    border-radius: 0;
    margin-left: -5px;
    float: right;
  }
</style>
