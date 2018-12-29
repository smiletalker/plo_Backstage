<template>
  <!--地址弹框-->
  <div id="addressContainer">
    <div id="address">
      <div>
        <span class="addressTitle">{{addresstitle}}</span>
        <el-button type="text" size="small" class="el-icon-close" v-on:click="closePop"></el-button>
      </div>
      <div class="addressDetail">
        <!--用户地址列表-->
        <el-table class="elTable" ref="multipleTable"
                  :data="addressInfo"
                  tooltip-effect="dark"
                  style="width: 100%">

          <el-table-column prop="userName" label="收货人" width="200"></el-table-column>

          <el-table-column prop="phoneName" label="联系电话" show-overflow-tooltip  width="200"></el-table-column>

          <el-table-column prop="userAddress1" label="收货地址" show-overflow-tooltip  width="300"></el-table-column>

        </el-table>
      </div>
    </div>
  </div>
    
</template>

<script>
    export default {
        name: "customerAddress",
      data(){
          return{
            addressInfo:[],
            addresstitle:'',
          }
      },
      methods:{
          closePop(){
            this.$emit('closeAddress');
          },
        addressMsg(info){
          this.addresstitle=info.userName+'的地址信息';
          let that=this;
        //发送请求获取指定id用户的地址列表数据
          this.$axios.get("/api/getAddress.do",{params:{userID:info.userID}})
            .then(function(resp){
              console.log(resp.data);
              that.addressInfo=resp.data;
            })
        },
      }
    }
</script>

<style scoped>
  .addressTitle{
    margin-left:1.5%;

  }

  #addressContainer{
    background-color:rgba(0,0,0,0.8);
    width:82%;
    height:100%;
    position: absolute;
    top:0px;
    left:246px;
  }

  #address{
    padding:4%;
    margin:3% auto auto 3%;
    width:86%;
    height:76%;
    background-color:white;
  }

  .elTable{
    margin-top:3%;
  }

  .el-icon-close{
    margin-left:90%;
  }

  .addressDetail{
    margin-left:15%;
  }

</style>
