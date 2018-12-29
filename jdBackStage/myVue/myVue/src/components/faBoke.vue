<template>
  <div id="app">
    <mymenu></mymenu>
    <subpagetitle pagetitle="发布博客"></subpagetitle>
    <router-link to="/boke">
      <button @click="resh" class="an">返回</button>
    </router-link>
    <div class="bigbox">
      <div class="one">
        <span>博文标题:</span>
        <el-input v-model="addtext.blogTitle" placeholder="请输入博客标题" :class="{two:true}"></el-input>
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
        <div class="miao">
          <span :class="{tu:true}">博文描述:</span>
          <el-input
            type="textarea"
            :rows="3"
            placeholder="请输入内容"
            v-model="textarea" :class="{two:true}">
          </el-input>
        </div>
      </div>
      <div class="one">
        <div class="block shijian">
          <span class="demonstration">发布时间:</span>
          <el-date-picker
            v-model="addtext.blogDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </div>
      </div>
      <div class="one">
        <span :class="{biao:true}">博文标签:</span>
        <template>
          <el-checkbox v-model="blogLable">滑雪</el-checkbox>
          <el-checkbox v-model="blogLable">攀岩</el-checkbox>
          <el-checkbox v-model="blogLable">登山</el-checkbox>
          <br><br>
          <el-checkbox v-model="blogLable">徒步旅行</el-checkbox>
          <el-checkbox v-model="blogLable">高山旅行</el-checkbox>
        </template>
      </div>

      <div class="one">
        <router-link to="/boke">
          <mybtn btnText="提交" @click="addboke"></mybtn>
        </router-link>

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
    },

    data() {
      return {
        addtext:{
          blogTitle:"",
          blogDate:"",
          blogLable:'',
        },
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
    },
    methods: {
      resh(){
        window.location.reload();
      },

      addboke(){
        // if(this.addtext.blogTitle==""||this.addtext.blogTitle==""||this.addtext.blogLable==""){
        //   alert("请输入完整的信息")
        // }else {
        //   this.$axios.get('http://172.16.6.49:8888/add.do',{params:{addtext:this.addtext}})
        //     .then( (resp)=> {
        //       console.log("vue请求成功");
        //       console.log(resp.data);
        //
        //     });
        // }
      },
    },
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
    height: 700px;
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
    left: 89%;
  }
  .an:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  .an:focus{
    outline: none;
  }
</style>
