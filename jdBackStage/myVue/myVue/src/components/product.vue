<template>
    <div id="myproduct">
      <header>
        <projectnav></projectnav>
      </header>
      <div>
        <header>
          <subpagetitle pagetitle="产品信息管理"></subpagetitle>
          <!--分类-->
          <div id="btngroup">
            <router-link to="/producttable">
              <mybtn btn-text="服饰"></mybtn>
            </router-link>
            <router-link to="/producttrousers">
              <mybtn btn-text="裤子"></mybtn>
            </router-link>
            <mybtn btn-text="鞋子"></mybtn>
            <mybtn btn-text="帽子"></mybtn>
            <mybtn btn-text="手套"></mybtn>
            <mybtn btn-text="包"></mybtn>
            <mybtn btn-text="眼镜"></mybtn>
            <mybtn btn-text="头盔"></mybtn>
            <mybtn btn-text="手杖"></mybtn>
            <mybtn btn-text="发带"></mybtn>
            <mybtn btn-text="绳子"></mybtn>
            <mybtn btn-text="安全带"></mybtn>
            <mybtn btn-text="安全锁"></mybtn>
            <mybtn btn-text="滑雪板"></mybtn>
          </div>
        </header>

        <router-view></router-view>
      </div>


    </div>
</template>

<script>
  import subpagetitle from './common/subpagetitle'
  import mybtn from './common/button'
  import projectnav from './nav.vue'
  // import mytable from './common/producttable'

    export default {
        name: "myproduct",
      data(){
          return {
            isshow:true,
            title:[
              {name:'服饰'},
              {name:'裤子'},
              {name:'鞋子'},
              {name:'帽子'},
              {name:'手套'},
              {name:'包'},
              {name:'眼镜'},
              {name:'头盔'},
              {name:'手杖'},
              {name:'发带'},
              {name:'绳子'},
              {name:'滑雪板'},
              {name:'安全带'},
              {name:'滑雪板'}
            ]
          }
      },
      components:{
        subpagetitle:subpagetitle,
        mybtn:mybtn,
        projectnav:projectnav,
        // mytable:mytable
      },
      methods:{
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
  *{
    margin: 0;
    padding: 0;
  }
  /*header{*/
    /*position: absolute;*/
    /*top: 0;*/
    /*left: 0;*/
    /*width: 100%;*/
    /*height: 85px;*/
  /*}*/
  #btngroup{
    width: 66%;
    position: absolute;
    top: 25px;
    right: 8px;
  }

</style>
