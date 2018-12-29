<template>
<div id="app">
    <div class="person_all">
      <el-col :span="4">
        <div class="person_infor">
          <p>
            <router-link to="/index">
              <img src="../../static/images/logoW.png" height="80" width="130">
            </router-link>
          </p>
          <p style="font-size:16px">账号：<span class="adm_name"></span></p>
          <router-link to="/denglu">
          <i class="el-icon-back" @click="changepage"></i>
          </router-link>
          <i class="el-icon-setting"></i>
          <p>身份：<span class="adm_attribute"></span></p>
          <p>本次登录时间：<span>{{nowTime}}</span></p>
          <p>上次登录时间：<span>{{beforeTime}}</span></p>
          <!--<p class="nav_name">导航</p>-->
        </div>
      </el-col>
      <el-row class="tac">
        <el-col :span="4" id="mymenu">
          <el-menu
            default-active="2"
            class="el-menu-vertical-demo"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            :unique-opened="true">
              <el-menu-item index="2" class="pro_all">
                <router-link to="/product" class="pro_allA">
                  产品管理
                </router-link>
                <span style="margin-left: 10px;">----------------------&nbsp;I</span>
              </el-menu-item>



            <el-submenu index="3" class="order_all">
              <template slot="title">
                <!--<i class="el-icon-location"></i>-->
                <span>订单管理</span><span style="margin-left: 10px;">----------------------&nbsp;II</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="3-1" class="oeder1" ><router-link to="/orderMenu">未发货订单</router-link></el-menu-item>
                <el-menu-item index="3-2" class="oeder2"><router-link to="/orderMenu2">未付款订单</router-link></el-menu-item>
                <el-menu-item index="3-3" class="oeder3"><router-link to="/orderMenu3">未收货订单</router-link></el-menu-item>
                <el-menu-item index="3-4" class="oeder4"><router-link to="/orderMenu4">已收货订单</router-link></el-menu-item>
                <el-menu-item index="3-5" class="oeder5"><router-link to="/orderTui">退款</router-link></el-menu-item>
                <el-menu-item index="3-6" class="oeder6"><router-link to="/orderHuan">换货</router-link></el-menu-item>
              </el-menu-item-group>
            </el-submenu>

            <el-menu-item index="4" class="customer_all"><router-link to="/customer">客户管理</router-link><span style="margin-left: 10px;">----------------------&nbsp;III</span></el-menu-item>

            <el-submenu index="5" class="staff_all">
              <template slot="title">
                <!--<i class="el-icon-location"></i>-->
                <span>员工管理</span><span style="margin-left: 10px;">----------------------&nbsp;IV</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="5-1" class="staff1"><router-link to="/staff">员工管理</router-link></el-menu-item>
                <el-menu-item index="5-2" class="staff2"><router-link to="/jurist">权限管理</router-link></el-menu-item>
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="6" class="blog_all">
              <template slot="title">
                <!--<i class="el-icon-location"></i>-->
                <span>博客管理</span><span style="margin-left: 10px;">----------------------&nbsp;V</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="6-1" class="blog_man"><router-link to="/boke">博客管理</router-link></el-menu-item>
                <el-menu-item index="6-2" class="blog_save"><router-link to="/faBoke">发布博客</router-link></el-menu-item>
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="7" class="acti_all">
              <template slot="title">
                <!--<i class="el-icon-location"></i>-->
                <span>活动管理</span><span style="margin-left: 10px;">----------------------&nbsp;VI</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="7-1" class="acti_man"><router-link to="/activit">活动管理</router-link></el-menu-item>
                <el-menu-item index="7-2" class="acti_save"><router-link to="/faActivit">发布活动</router-link></el-menu-item>
              </el-menu-item-group>
            </el-submenu>

            <el-menu-item index="8" class="data_all" active-text-color='#ffffff'><router-link to="/sjtj">数据统计</router-link> <span style="margin-left: 10px;">----------------------&nbsp;VII</span>
            </el-menu-item>

          </el-menu>
        </el-col>
      </el-row>
    </div>
</div>
</template>

<script>


  export default {
    name: 'projectnav',
    components:{

    },
    data(){
      return{
        nowTime:'',
        beforeTime:'2018-11-30- 02:40'
      }
    },
   /* props:[adm_name,adm_attribute],*/
    methods:{
      //阻止a标签跳转事件
   /*   stop_A(e){
        var pro_allA=document.getElementsByClassName("pro_allA")[0];
        console.log(pro_allA);
        if ( e && e.preventDefault )
          e.preventDefault();
        else
          window.event.returnValue = false;
      },*/



      // 获取当前时间函数
      timeFormate(timeStamp) {
        let year = new Date(timeStamp).getFullYear();
        let month = new Date(timeStamp).getMonth() + 1 < 10 ? "0" + (new Date(timeStamp).getMonth() + 1) : new Date(timeStamp).getMonth() + 1;
        let date = new Date(timeStamp).getDate() < 10 ? "0" + new Date(timeStamp).getDate() : new Date(timeStamp).getDate();
        let hh = new Date(timeStamp).getHours() < 10 ? "0" + new Date(timeStamp).getHours() : new Date(timeStamp).getHours();
        let mm = new Date(timeStamp).getMinutes() < 10 ? "0" + new Date(timeStamp).getMinutes() : new Date(timeStamp).getMinutes();
        // let ss =new Date(timeStamp).getSeconds() < 10? "0" + new Date(timeStamp).getSeconds(): new Date(timeStamp).getSeconds();
        // return year + "年" + month + "月" + date +"日"+" "+hh+":"+mm ;
        this.nowTime = year + "-" + month + "-" + date + "-" + " " + hh + ":" + mm;
        // console.log(this.nowTime);
      },
      // 定时器函数
      nowTimes(){
        this.timeFormate(new Date());
        setInterval(this.nowTimes,30*1000);
      },
      tk () {
        console.log("225548")
      },
      myblur () {
        console.log("00000blur")
      },
      myfocus () {
        console.log("00000focus")
      },
      changepage(){
        window.sessionStorage.removeItem('data');
        alert("seccess");
        window.location.reload()
      }
    },
    // 创建完成时
    created() {
      this.nowTimes();
    },
    mounted(){
      var i_name=document.getElementsByClassName("el-submenu__icon-arrow");
      var el_icon=document.getElementsByClassName("el-icon-arrow-down");
      console.log(i_name[0]);
      for(var i=0;i<i_name.length;i++){
        i_name[i].parentNode.removeChild( i_name[i]);
        for(var j=0;j<el_icon.length;j++){
          el_icon[j].parentNode.removeChild(el_icon[j]);
        }
      }
      for(var j=0;j<el_icon.length;j++){
        el_icon[j].parentNode.removeChild(el_icon[j]);
      }
    }
  }

</script>

<style>
  @import "../assets/nav.css";
</style>
