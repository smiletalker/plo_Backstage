<template>
    <div>
      <header>
        <projectnav></projectnav>
      </header>
      <subpagetitle pagetitle="员工信息"></subpagetitle>
      <!--<div class="wyi"><search></search></div>-->
      <div class="wei1" @click="showd=!showd"><ygtable></ygtable></div>
    </div>
</template>

<script>
  import subpagetitle from './common/subpagetitle.vue'
  import search from './common/search.vue'
  import ygtable from './common/ygtable.vue'
  import projectnav from './nav.vue'

    export default {
      name: "staff",
      components:{
        projectnav:projectnav,
        subpagetitle:subpagetitle,
        search:search,
        ygtable:ygtable,
      },
      data(){
        return{
          tableData3: [],
//          showd:false,
        }
      },
      mounted(){
        var arr = sessionStorage.getItem('data');
        var array = JSON.parse(arr);
        console.log(array.permissionName);
        var adm_name=document.getElementsByClassName("adm_name")[0];
        var adm_attribute=document.getElementsByClassName("adm_attribute")[0];
        /*console.log(adm_name);*/
        adm_name.innerHTML=array.adm_name;
        adm_attribute.innerHTML=array.adm_attribute;
        if(array.adm_attribute=="普通管理员"){
          var pro_all=document.getElementsByClassName("pro_all")[0];
          var staff_all=document.getElementsByClassName("staff_all")[0];
          console.log(pro_all);
          /*  pro_all.classList.add("is-disabled");*/
          staff_all.classList.add("is-disabled");
          /*staff_all.attr("is-disabled",true);*/
          $(".staff1")[0].style.display="none";
          $(".staff2")[0].style.display="none";
          /*pro_all.style.display="none";*/
          staff_all.style.display="none";
        }
        if(array.indexOf("博客CURD")=="-1"){
          var blog_all=document.getElementsByClassName("blog_all")[0];
          blog_all.style.display="none";
        }
      }
//     created () {
//      let that=this;
//      /*发起请求，请求数据，向node发起请求*/
//      this.$axios.get("http://172.16.6.57:8888/staff.do")
//        .then(function (resp) {
//            that.tableData3=resp.data;
//    })
//  },
    }
</script>

<style scoped>
  *{
    margin: 0;
    padding: 0;
  }
  .wyi{
    margin-top: -85px;
  }
  .wei1{
    margin-top: 80px;
  }
</style>
