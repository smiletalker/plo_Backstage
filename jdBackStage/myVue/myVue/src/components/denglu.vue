<template>
  <div>
    <!--黑色背景-->
    <div class="bei">
      <div class="biao">
        <div class="dazi">
          Wide Admin
          <img class="tu" src="../../static/images/logoW.png"/>
        </div>
        <div class="xiaozi">
          powerful backend interface
        </div>
      </div>
    </div>
    <!--登录注册-->
    <div>
      <div class="div1">
        <div>登录账号&nbsp;&nbsp;&nbsp;&nbsp;<myinput class="username_jur"></myinput></div>
      </div>
     <div class="div2">
       <div>登录密码&nbsp;&nbsp;&nbsp;&nbsp;<myinput class="password_jur"></myinput></div>
     </div>
      <div class="div3" @click="show=!show">
        <div>忘记密码？</div>
      </div>

      <p class="message"></p>

      <div class="div4">

        <mybutton btnText="登录" class="login_jur" v-on:btnClick="login"></mybutton>

      </div>
    </div>
    <!--忘记密码-->
    <div class="wan" v-show="show">
      <div class="ji">
        <div class="tb el-icon-close" @click="show=!show"></div>
        <div class="yit">
          <img class="dx" src="../../static/images/liucheng.jpg"/>
        </div>
        <div class="er">输入手机账号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<myinput></myinput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入框提示</div>
        <div class="san">输入验证码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<myinput></myinput><img class="tu1" src="../../static/images/yan.jpg"/></div>
        <div class="si"><mybutton btnText="下一步" className="bian"></mybutton></div>
      </div>
    </div>
  </div>
</template>

<script>
  import myinput from './common/input.vue';
  import mybutton from './common/button.vue';
    export default {
        name: "denglu",
      components:{
        myinput:myinput,
        mybutton:mybutton,
      },
      data(){
        return{
          show:false
        }
      },
      methods:{
        login(){
          var username_jur=$(".username_jur").val();
          var password_jur=$(".password_jur").val();
          var that=this;
          $.ajax({
            type:"post",
            url:'http://localhost:8888/login.do',
            data:{
              username_jur:$(".username_jur").val(),
              password_jur:$(".password_jur").val(),
            },
            success:function (data) {
              console.log(data);
              if(data.length>0){
                var ses=window.sessionStorage;
                var d=JSON.stringify(data[0]);
                ses.setItem('data',d);
                that.$router.push({name:'index',query:{adm_name:data[0].adm_name,adm_attribute:data[0].adm_attribute}});
              }
            },
            error:function (err) {
              console.log(err.responseText);
              $(".message")[0].innerHTML=err.responseText;
            }
          })
        }
      },
  /*    methods:{
        flushCom:function(){
          //router是路由实例,例如:var router = new Router({})
          //router.go(n)是路由的一个方法，意思是在history记录中前进或者后退多少步，0就表示还是当前，类似window.history.go(n)
          this.$router.go(0);
        }
      }*/
      watch:{
        "$route":function(to,from){
          //  to , from 分别表示从哪跳转到哪，都是一个对象
          // to.path   ( 表示的是要跳转到的路由的地址 eg:  /home );
          console.log(to.path);
          console.log(from.path);
        }
      },

    }
</script>

<style scoped>
  /*<!--黑色背景-->*/
  .bei{
    width: 95%;
    height: 380px;
    background-color: black;
    margin-top: 30px;
    margin-left: 2.5%;
    position: relative;
  }
  .biao{
    text-align: center;
    position: absolute;
    top: 75%;
    left: 35%;
  }
  .dazi{
    color: white;
    font-size: 28px;
  }
  .xiaozi{
    color: white;
    font-size: 20px;
    margin-top: 5px;
    margin-left: 85px;
  }
  .tu{
    height: 60px;
    position: absolute;
    top: -15px;
  }
  /*登录注册*/
  .div1{
    margin-top: 50px;
    margin-left: 17%;
  }
  .div2{
    margin-top: -33px;
    margin-left: 47%;
  }
  .div3{
    margin-top: -30px;
    margin-left: 78%;
  }
  .div4{
    margin-top: 40px;
    margin-left: 67%;
  }
  input{
    width: 260px;
    height: 30px;
  }
  button{
    width: 80px;
    height: 40px;
    background-color: white;
  }
  /*忘记密码*/
  .wan{
    width: 100%;
    height: 90%;
    background-color: rgba(0,0,0,0.73);
    position: absolute;
    top: 0;
    /*z-index: 10;*/
  }
  .ji{
    width: 90%;
    height: 80%;
    color: rgb(224,225,225);
    font-size: 20px;
    background-color:white;
    margin-left: 5%;
    margin-top: 5%;
    /*z-index: 10;*/
  }
  .dx{
    vertical-align:middle;
    height: 40px;
    position: relative;
    top: 80px;
    left: 22%;
  }
  .er{
    width: 60%;
    color: black;
    position: relative;
    top: 160px;
    left: 29%;
  }
  .san{
    width: 60%;
    color: black;
    position: relative;
    top: 180px;
    left: 30.5%;
  }
  .tu1{
    height: 50px;
    position: relative;
    top: 20px;
  }
  .bian{
    border: 1px solid black!important;
  }
  .si{
    width: 30%;
    color: black;
    position: relative;
    top: 250px;
    left: 56%;
  }
  .tb{
    color: black;
    position: relative;
    top: 50px;
    left: 95%;
  }
  .message{
    float: right;
    font-size: 14px;
    color: red;
    margin-right: 340px;
  }
</style>
