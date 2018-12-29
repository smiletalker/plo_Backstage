<template>
  <div>
    <projectnav></projectnav>
    <subpagetitle pagetitle="未付款订单">

    </subpagetitle>

    <ordertable1></ordertable1>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetitle from './common/subpagetitle'

  import ordertable1 from './ordertable2'
  export default {
    name: "orderMenu2",
    components:{
      projectnav:projectnav,
      subpagetitle:subpagetitle,

      ordertable1:ordertable1,
    }

  }
</script>

<style scoped>

</style>
