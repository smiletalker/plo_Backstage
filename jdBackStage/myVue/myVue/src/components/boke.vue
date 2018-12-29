<template>
  <div id="app">
    <header>
      <projectnav></projectnav>
    </header>
    <mymenu></mymenu>
    <subpagetitle pagetitle="博客管理"></subpagetitle>
    <router-link to="/faBoke">
      <button @click="resh" class="an">发布博客</button>
    </router-link>
    <!--<div class="sou">-->
      <!--<myInput placeholder="请输入搜索类容" v-model="message"></myinput>-->
      <!--<el-input v-model="message" placeholder="请输入搜索类容" :class="{shuru:true}"></el-input>-->
      <!--<p style="display: none">{{message}}</p>-->
      <!--<i class="el-icon-search" :class="{btn:true}" @click="shousuo"></i>-->
    <!--</div>-->
    <bokeTable :class="{three:true}"></bokeTable>
  </div>
</template>

<script>
  import mymenu from '../components/menu'
  import myBtn from './common/button'
  import myInput from './common/input'
  import myLabel from './common/label'
  import subpagetitle from './common/subpagetitle'
  import bokeTable from './common/bokeTable'
   import search from './common/search'
  import projectnav from './nav.vue'
  export default {
    name: 'App',
    components:{
      mymenu:mymenu,
      myBtn:myBtn,
      myInput:myInput,
      myLabel:myLabel,
      subpagetitle:subpagetitle,
      bokeTable:bokeTable,
      search:search,
      projectnav:projectnav,
    },
    methods:{
      tk () {
        console.log("225548")
      },
      myblur () {
        console.log("00000blur")
      },
      myfocus () {
        console.log("00000focus")
      },
      resh(){
        window.location.reload();
      }
    },
    data() {
      return {
        formInline: {
          user: '',
          region: '',
        },
        message:''
      }
    }
  }

</script>

<style>
  *{
    margin: 0;
    padding: 0;
  }
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }
  .marginTop{
    position: absolute;
    top:0.4%;
    left: 62%;
  }
  .one{
    position: absolute;
    top: 23px;
    left: 32%;
  }
  .two{
    position: absolute;
    left: 22%;
    top: 18%;
  }
  .three{
    position: absolute;
    top: 20%;
    left: -3%;
  }
  .for{
    position: absolute;
    left: 27.5%;
    top: 17%;
  }
  .five{
    position: absolute;
    left: 55%;
    top: 18%;
  }
  .six{
    position: absolute;
    left: 62%;
    top: 16.4%;
    width: 100px;
    height: 30px;
  }
  input{
    height: 35px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
  }
  input:focus{
    outline: none;
  }
  .shuru{
    width: 200px;
  }
  .an{
    letter-spacing: 1px;
    color: black;
    padding: 10px 15px;
    background-color: white;
    border-radius: 3px;
    margin-left: -3px;
    border: 1px solid #CECECE;
    height: 38px;
    position: absolute;
    top: 3%;
    left: 32%;
  }
  .an:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  .an:focus{
    outline: none;
  }
  .btn{
    letter-spacing: 1px;
    color: black;
    padding: 10px 15px;
    background-color: white;
    border-radius: 3px;
    margin-left: -3px;
    border: 1px solid #CECECE;
    height: 18px;
  }
  .btn:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  .btn:focus{
    outline: none;
  }
  .sou{
    width: 300px;
    height: 60px;
    position: absolute;
    top: 3%;
    left: 70%;
  }
</style>
