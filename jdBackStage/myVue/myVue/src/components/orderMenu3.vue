<template>
  <div>
    <projectnav></projectnav>
    <subpagetitle pagetitle="未收货订单">

    </subpagetitle>

    <ordertable3></ordertable3>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetitle from './common/subpagetitle'

  import ordertable3 from './ordertable3'
  export default {
    name: "orderMenu3",
    components:{
      projectnav:projectnav,
      subpagetitle:subpagetitle,

      ordertable3:ordertable3,
    }

  }
</script>

<style scoped>

</style>
