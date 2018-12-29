<template>
    <div id="content">
      <header>
        <projectnav></projectnav>
      </header>
      <myDataUl></myDataUl>
      <mySyTj></mySyTj>
      <myXlTj></myXlTj>
      <myKcTj></myKcTj>
      <myScTj></myScTj>
      <myGwTj></myGwTj>
    </div>
</template>

<script>
  import myDataUl from'./sjtj/dataul';
  import mySyTj from './sjtj/sytj';
  import myXlTj from './sjtj/xltj';
  import myKcTj from './sjtj/kctj';
  import myScTj from './sjtj/sctj';
  import myGwTj from './sjtj/gwtj';
  import projectnav from './nav.vue'
    export default {
        name: "sjtj",
      components:{
        myDataUl:myDataUl,
        mySyTj:mySyTj,
        myXlTj:myXlTj,
        myKcTj:myKcTj,
        myScTj:myScTj,
        myGwTj:myGwTj,
        projectnav:projectnav
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
    }
</script>

<style scoped>

</style>
