<template>
  <!--订单弹框-->
  <div id="orderContainer">
    <div  id="order">
     <div>
      <span class="orderTitle">{{ordertitle}}</span>

      <el-button type="text" size="small" class="el-icon-close" v-on:click="closePop"></el-button>
    </div>
     <div class="orderDetail">
      <!--订单列表-->
      <el-table class="elTable" ref="multipleTable"
                :data="orderInfo"
                tooltip-effect="dark"
                style="width: 100%">

        <!--订单编号-->
        <el-table-column label="订单编号" width="120">
          <template slot-scope="scope">{{ scope.row.orderId}}</template>
        </el-table-column>

        <el-table-column prop="goodsImageSrc" label="商品图片" width="200"></el-table-column>

        <el-table-column prop="goodsName" label="商品名称" show-overflow-tooltip  width="160"></el-table-column>

        <el-table-column prop="goodsSize" label="尺寸" show-overflow-tooltip  width="80"></el-table-column>

        <el-table-column prop="goodsColor" label="颜色" show-overflow-tooltip  width="60"></el-table-column>

        <el-table-column prop="goodsPrice" label="价格" show-overflow-tooltip  width="60"></el-table-column>

        <el-table-column prop="goodsNum" label="数量" show-overflow-tooltip  width="60"></el-table-column>

        <el-table-column prop="goodsPrice*goodsNum" label="小计" show-overflow-tooltip  width="60"></el-table-column>

        <el-table-column prop="payTime" label="购物时间" show-overflow-tooltip  width="130"></el-table-column>

        <el-table-column prop="userName" label="收件人" show-overflow-tooltip  width="90"></el-table-column>

        <el-table-column prop="userOderAddress" label="收件地址" show-overflow-tooltip  width="180"></el-table-column>

      </el-table>

    </div>
    </div>
  </div>

</template>

<script>
      export default {
        name: "customerOd",
        data(){
          return{
            orderInfo:[],
            ordertitle:'',
          }
        },
        methods:{
          /*关闭弹框*/
          closePop(){
            /*调用父组件关闭方法*/
            this.$emit('closeOrder');
          },
          orderMsg(info){
            /*info:行数据*/
          console.log(info);
          console.log(info.userID);
          console.log(info.userName+'的订单');
          this.ordertitle=info.userName+'的订单';
          let that=this;
          /*发送请求获取指定id用户的订单列表数据*/
          this.$axios.get("/api/getOrder.do",{params:{userID:info.userID}})
            .then(function (resp){
              console.log(resp.data);
              that.orderInfo=resp.data;
            })
          }
        },
    }
</script>

<style scoped>
  .orderTitle{
    margin-left:1.5%;

  }

  #orderContainer{
    background-color:rgba(0,0,0,0.8);
    width:100%;
    height:100%;
    position: absolute;
    top:0px;
    left:0px;
  }

  #order{
    padding:2%;
    margin:3% auto auto 4%;
    width:90%;
    height:80%;
    background-color:white;
  }

  .elTable{
    margin-top:3%;
  }

  .el-icon-close{
    margin-left:90%;
  }



</style>


