<template>
  <div>
    <projectnav></projectnav>
    <subpagetitle pagetitle="已收货订单">

    </subpagetitle>

    <ordertable4></ordertable4>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetitle from './common/subpagetitle'

  import ordertable4 from './ordertable4'
  export default {
    name: "orderMenu4",
    components:{
      projectnav:projectnav,
      subpagetitle:subpagetitle,

      ordertable4:ordertable4,
    }

  }
</script>

<style scoped>

</style>
