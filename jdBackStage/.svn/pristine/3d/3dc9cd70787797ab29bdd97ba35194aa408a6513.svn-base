<template>
    <!--短信弹框-->
    <div id="msgContainer">
      <div id="msg">
        <div>
          <span class="msgTitle">发送短信</span>
          <el-button type="text" size="small" class="el-icon-close" v-on:click="closePop"></el-button>
        </div>
        <div class="msgDetail">
            <span class="label">发送对象</span>
            <span class="msgReceiver">{{msgReceiver}}</span>
            <br>
            <span class="label editMsg">编辑短信</span>
            <textarea id="msgContent" cols="60" rows="8">
            </textarea>
         <div>
           <el-button type="text" size="small"
                      class="button"
                      @click="commit">
             发送
           </el-button>
         </div>

        </div>
      </div>
    </div>
</template>

<script>
    export default {
        name: "customerMsg",
      data(){
          return{
            msgtitle:'',
            msgInfo:[],
            msgReceiver:''
          }
      },
      methods:{
      //    关闭弹框
        closePop(){
          this.$emit('closeMsg');
        },
        msgMsg(info){
          this.msgReceiver=info.userName;

        },
        commit(){
          var content=document.getElementById('msgContent');
          var str=content.value;
          if(str!=''){
            this.$confirm('确定发送短信?', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              this.$message({
                type: 'info',
                message: '发送短信成功！'
              });
              this.$emit('closeMsg');
            }).catch(() => {
              this.$message({
                type: 'info',
                message: '已取消发送短信！'
              });
              this.$emit('closeMsg');
            });
          }
          else{
            this.$confirm('请先编辑短信内容, 是否继续?', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              // this.$emit('showadd');
            }).catch(() => {
              this.$message({
                type: 'info',
                message: '已取消操作',
              });
              this.$emit('closeMsg');
            });

          }
          console.log(str);
        }
      }
    }
</script>

<style scoped>
  .label{
    font-size:14px;
    color:rgb(144,147,153);
    margin-left:10%;
  }

  .msgTitle{
    margin-left:1.5%;
  }

  #msgContainer{
    background-color:rgba(0,0,0,0.8);
    width:82%;
    height:100%;
    position: absolute;
    top:0px;
    left:246px;
  }

  #msg{
    padding:4%;
    margin:3% auto auto 3%;
    width:86%;
    height:76%;
    background-color:white;
  }

  .el-icon-close{
    margin-left:90%;
  }

  .msgDetail{
    margin-left:15%;
    margin-top:50px;
  }

  .msgReceiver{
    font-size:14px;
    margin-left:10px;
  }

  .editMsg{
    margin-top:30px;
  }

  #msgContent{
    margin-top:50px;
    margin-left:10px;
  }

  .button{
    font-size:12px;
    color:rgb(96,98,102);
    border:1px solid rgb(112,112,120);
    padding:8px 16px;
    border-radius: 3px;
    margin-top:100px;
    margin-left:40%;
  }

</style>
