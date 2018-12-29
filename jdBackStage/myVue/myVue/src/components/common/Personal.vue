<template>
  <div>
    <div class="xiz" v-show="showea">
      <div class="xiz1">
        <div class="xix">个人中心</div>
        <div class="gb el-icon-close" @click="showea=!showea"></div>
        <div class="zy">*账户名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy">*手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy">*负责工作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy">*旧的密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy">*新的密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy">*确认密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="zy2" @click="showea=!showea"><mebutton btnText="保存"></mebutton></div>
      </div>
    </div>
  </div>
</template>

<script>
  import meiput from './input.vue'
  import mebutton from './button.vue'
    export default {
        name: "personal",
      components:{
        meiput:meiput,
        mebutton:mebutton
      },
      data(){
        return{
          showea:false,
        }
      },
    }
</script>

<style scoped>
  .xiz{
    height: 700px;
    width: 85%;
    margin-left: 16.5%;
    /*margin-top: -600px;*/
    background-color: rgba(0,0,0,0.73);
    position: relative;
    z-index: 9;
  }
  .xiz1{
    height: 600px;
    width: 85%;
    margin-left: 8%;
    background-color: white;
    position: absolute;
    top: 50px;
    z-index: 10;
  }
  .xix{
    margin-top: 50px;
    margin-left: 4%;
  }
  .gb{
    margin-left: 90%;
  }
  .zy{
    margin-left: 20%;
    margin-top: 30px;
  }
  .zy2{
    margin-left: 45%;
    margin-top: 35px;
  }
</style>
