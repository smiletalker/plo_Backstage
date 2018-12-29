<template>
  <div id="app">
    <header>
      <projectnav></projectnav>
    </header>
    <subpagetitle pagetitle="客户管理"></subpagetitle>
    <search class="marginTop"></search>

    <div class="bigbox">
      <h4 class="boxTitle">客户信息列表</h4>
      <!--表格，用的是element里面的Table表格-->
      <el-table class="elTable" ref="multipleTable"
                                :data="customerInfo.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                                tooltip-effect="dark"
                                style="width: 100%">


        <el-table-column type="selection" width="100"></el-table-column>

        <el-table-column label="#" width="100">
          <template slot-scope="scope">{{ scope.row.userID }}</template>
        </el-table-column>

        <el-table-column prop="userName" label="姓名" width="140">

        </el-table-column>

        <el-table-column prop="userPhone" label="电话" show-overflow-tooltip  width="200"></el-table-column>

        <el-table-column prop="consume" label="购买金额" show-overflow-tooltip  width="150"></el-table-column>

        <el-table-column prop="" label="操作">
          <template slot-scope="scope">
            <el-button type="text" size="small"
                       class="button"
                       @click="order(scope.row)">
              订单
            </el-button>
            <el-button type="text" size="small"
                       class="button"
                       @click="msg(scope.row)">
              短信
            </el-button>
            <el-button type="text" size="small"
                       class="button"
                       @click="address(scope.row)">
              地址
            </el-button>
          </template>
        </el-table-column>

      </el-table>
      <!--分页-->
      <el-pagination class="paging"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[6, 12]"
        :page-size="pagesize"
        :total="total"
        layout="total, sizes, prev, pager, next, jumper"
      >
      </el-pagination>

    </div>

    <!--订单弹框-->
    <myOrder class="myOrder" ref='getOrder' v-show="orderShow" v-on:closeOrder="closeOrder"></myOrder>

    <!--短信弹框-->
    <myMsg ref='getMsg' v-show="msgShow" v-on:closeMsg="closeMsg" ></myMsg>

    <!--地址弹框-->
    <myAddress ref='getAddress' v-show="addressShow" v-on:closeAddress="closeAddress" ></myAddress>

  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetitle from './common/subpagetitle'
  import search from './common/search'
  import myOrder from './customerOd'
  import myMsg from './customerMsg'
  import myAddress from './customerAddress'

    export default {
      name: "customer",
      components:{
        subpagetitle:subpagetitle,
        search:search,
        myOrder:myOrder,
        myMsg:myMsg,
        myAddress:myAddress,
        projectnav:projectnav,
      },
      data(){
        return{
          customerInfo: [],
          userID:'',
          userName:'',
          total:0,
          pagesize:6,//每页的数据条数
          currentPage:1,//默认开始页面
          orderShow:false,
          addressShow:false,
          msgShow:false,
          orderInfo:''
        }
      },
      methods:{
        /*订单查看*/
        order(row) {
          //用户的行数据传值到用户订单弹框组件
          this.orderShow=true;
          this.$refs.getOrder.orderMsg(row);
        },
        /*发送短信*/
        msg(row) {
          this.msgShow=true;
          this.$refs.getMsg.msgMsg(row);
        },
        /*地址查看*/
        address(row) {
          this.addressShow=true;
          this.$refs.getAddress.addressMsg(row);
        },
        /*获取页面用户数据*/
        getUser:function(){
          let that=this;
          /*向node发起请求*/
          this.$axios.get("/api/customer.do")
            .then(function (resp) {
              that.customerInfo = resp.data;
              that.total=resp.data.length;
            });
        },
        handleSelectionChange(val) {
          this.multipleSelection = val;
        },
        handleSizeChange(val) {
          this.pagesize = val;
//        console.log(`每页 ${val} 条`);
        },
        handleCurrentChange(val) {
          this.currentPage = val;
        },
        /*关闭订单弹框*/
        closeOrder () {
          this.orderShow=false;
        },
        /*关闭地址弹框*/
        closeAddress(){
          this.addressShow=false;
        },
      //  关闭短信弹框
        closeMsg(){
          this.msgShow=false;
        }
      },
      created () {
        this.getUser();
      },
      mounted(){
        var arr = sessionStorage.getItem('data');
        var array = JSON.parse(arr);
        console.log(array.permissionName);
        var adm_name=document.getElementsByClassName("adm_name")[0];
        var adm_attribute=document.getElementsByClassName("adm_attribute")[0];
        /*console.log(adm_name);*/
        adm_name.innerHTML=array.adm_name;
        adm_attribute.innerHTML=array.adm_attribute;
        if(array.adm_attribute=="普通管理员"){
          var pro_all=document.getElementsByClassName("pro_all")[0];
          var staff_all=document.getElementsByClassName("staff_all")[0];
          console.log(pro_all);
          /*  pro_all.classList.add("is-disabled");*/
          staff_all.classList.add("is-disabled");
          /*staff_all.attr("is-disabled",true);*/
          $(".staff1")[0].style.display="none";
          $(".staff2")[0].style.display="none";
          /*pro_all.style.display="none";*/
          staff_all.style.display="none";
        }
      }
    }
</script>

<style scoped>
  *{
    margin:0;
    padding:0;
  }
  .marginTop{
    margin-top:-60px;
  }
  .bigbox{
    padding-top:20px;
    background-color: white;
    width:70%;
    margin-left:300px;
    margin-top:50px;
    padding-bottom:20px;
  }
  .boxTitle{
    margin:1%;
    font-weight: 400;
  }
  .elTable{
    padding-left:2%;
  }
  .button{
    font-size:12px;
    color:rgb(96,98,102);
    border:1px solid rgb(112,112,120);
    padding:4px 6px;
    border-radius: 3px;
  }
  .paging{
    margin:20px auto auto 10px;
  }
  .boxTitle{
    margin-left:30px;
  }
</style>
