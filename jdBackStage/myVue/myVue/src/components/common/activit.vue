<template>
  <div id="app">
    <mymenu></mymenu>
    <subpagetitle pagetitle="活动管理"></subpagetitle>
    <myBtn btnText="发布活动" v-on:btnClick="tk" className="one"></myBtn>
    <myLabel label-text="活动名称:" className="two"></myLabel>
    <myInput type="text" placeholder="请输入活动名称" width="width:300px"
             v-on:blur="myblur"
             v-on:focus="myfocus"
             name="input"
             className="for"
             idName="myid"></myInput>
    <myLabel label-text="活动状态:" className="five"></myLabel>
    <!--<mysingleSelect :class="{six:true}"></mysingleSelect>-->
    <el-select placeholder="请选择" v-model="formInline.region" with="100px" height="30px" :class="{six:true}">
      <el-option label="请选择" value=""></el-option>
      <el-option label="进行中" value="shanghai"></el-option>
      <el-option label="已结束" value="beijing"></el-option>
    </el-select>
    <actable :class="{three:true}"></actable>
  </div>
</template>

<script>
  import mymenu from '../components/menu'
  import myBtn from './common/button'
  import myInput from './common/input'
  import myLabel from './common/label'
  //import mysingleSelect from './common/singleSelection'
  import subpagetitle from './common/subpagetitle'
  import actable from './common/activitTable'

  export default {
    name: 'App',
    components:{
      mymenu:mymenu,
      myBtn:myBtn,
      myInput:myInput,
      myLabel:myLabel,
      //mysingleSelect:mysingleSelect,
      subpagetitle:subpagetitle,
      actable:actable
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
      }
    },
    data() {
      return {
        formInline: {
          user: '',
          region: ''
        }
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
   top: 25%;
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
</style>
