<template>
  <div id="app">
    <mymenu></mymenu>
    <subpagetitle pagetitle="发布活动"></subpagetitle>
    <div class="bigbox">
      <div class="one">
        <span>活动标题:</span>
        <el-input v-model="input" placeholder="请输入活动标题" :class="{two:true}"></el-input>
      </div>
      <div class="one da">
        <span :class="{tu:true}">图片上传:</span>
        <el-upload
          class="upload-demo"
          drag
          action="https://jsonplaceholder.typicode.com/posts/"
          multiple :class="{two:true}">
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          <div class="el-upload__tip shang" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
        </el-upload>
      </div>
      <div class="one">
        <div class="block shijian">
          <span class="demonstration">结束时间:</span>
          <el-date-picker
            v-model="value1"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </div>
      </div>
      <div class="one renshu">
        <span :class="{biao:true}">人数上限:</span>
        <el-input v-model="input" placeholder="请输入人数上限" :class="{two:true}">
        </el-input>
      </div>
      <div class="one">
        <div class="miao">
          <span :class="{tu:true}">活动描述:</span>
          <el-input
            type="textarea"
            :rows="3"
            placeholder="请输入内容"
            v-model="textarea" :class="{two:true}">
          </el-input>
        </div>
      </div>
      <div class="one">
        <mybtn btnText="提交" v-on:btnClick="tk"></mybtn>
      </div>



    </div>
  </div>
</template>

<script>
  import mymenu from '../components/menu'
  import subpagetitle from './common/subpagetitle'
  import input from './common/input'
  import mybtn from './common/button'
  export default {
    name: 'App',
    components: {
      mymenu: mymenu,
      subpagetitle: subpagetitle,
      input:input,
      mybtn:mybtn,
      methods: {},
    },
    data() {
      return {
        pickerOptions1: {
          disabledDate(time) {
            return time.getTime() > Date.now();
          },
          shortcuts: [{
            text: '今天',
            onClick(picker) {
              picker.$emit('pick', new Date());
            }
          }, {
            text: '昨天',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit('pick', date);
            }
          }, {
            text: '一周前',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
        },
        value1: '',
        value2: '',
        value13: '',
      };
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

  .bigbox {
    width: 850px;
    height: 600px;
    margin-left: 26%;
    margin-top: 3%;
    -webkit-box-shadow: 0 2px 5px 0 #afafaf;
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .one{
    width: 600px;
    height: 80px;
    /*border: 1px solid red;*/
    margin-top: 30px;
    margin-left: 6%;
  }
  .da{
    height: 150px;
  }
  .two{
    width: 300px;
    margin-top: 5.5%;
  }
  .el-upload-dragger {
    background-color: #fff;
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    width: 300px;
    height: 150px;
    text-align: center;
    position: relative;
    overflow: hidden;
    margin-left: 63%;
    margin-top: -20%;
  }
  .tu{
    margin-left: -50%;
  }
  .miao{
    margin-left: 34%;
    margin-top: -3%;
  }
  .shijian{
    margin-left: -12%;
    margin-top: 5%;
  }
  .biao{
    margin-left: -10%;
  }
  .shang{
    margin-left: 60%;
    width: 300px;
  }
  .renshu{
    margin-left: 10%;
    margin-top: -5%;
  }

</style>
