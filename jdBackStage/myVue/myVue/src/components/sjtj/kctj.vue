<template>
  <div id="xl">
    <h1>库存统计:</h1>
    <khxZzt></khxZzt>
    <kpyZzt></kpyZzt>
    <kdsZzt></kdsZzt>
    <kgsZzt></kgsZzt>
    <ktbZzt></ktbZzt>
  </div>
</template>

<script>
  import khxZzt from './khxZzt';
  import kpyZzt from './kpyZzt';
  import kdsZzt from './kdsZzt';
  import kgsZzt from './kgsZzt';
  import ktbZzt from './ktbZzt';
  export default {
    name: "kctj",
    components:{
      khxZzt:khxZzt,
      kpyZzt:kpyZzt,
      kdsZzt:kdsZzt,
      kgsZzt:kgsZzt,
      ktbZzt:ktbZzt,
    }
  }
</script>

<style scoped>
  #xl{
    width:1000px;
    height: 960px;
    margin-left: 22.5%;
    margin-top: 50px;
    background: white;
    box-shadow:darkgray 2px 2px 8px 1px;
    overflow: hidden;
  }
  h1{
    font-size: 16px;
    font-weight: lighter;
    margin-top: 30px;
    margin-left: 30px;
  }
</style>
