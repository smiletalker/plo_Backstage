<template>
  <div>
    <header>
      <projectnav></projectnav>
    </header>
    <subpagetitle pagetitle="换货"></subpagetitle>
    <div id="btngroup">
      <ul>
        <li >待处理</li>
        <li >退货中</li>
        <li >已完成</li>
        <li >已拒绝</li>
      </ul>
    </div>

    <!--搜索-->
    <div id="search">
      <div>
        <mylabel label-text="订单编号"></mylabel>
        <input type="text" placeholder="订单编号" v-model="search1">
      </div>
      <div>
        <mylabel label-text="收货人"></mylabel>
        <input type="text" placeholder="收货人" v-model="search2">
      </div>
      <div>
        <mylabel label-text="申请时间"></mylabel>
        <input type="text" placeholder="请选择时间" v-model="search3">
      </div>




    </div>

    <!--表格-->
    <!--<ordertable5></ordertable5>-->
    <div class="bigbox">
      <!--表格，用的是element里面的Table表格-->
      <el-table ref="multipleTable" :data="tables.slice((currentPage-1)*pagesize,currentPage*pagesize)" tooltip-effect="dark" style="width: 100%"
      >

        <el-table-column type="selection" show-overflow-tooltip></el-table-column>

        <el-table-column prop="orderId" label="订单编号" show-overflow-tooltip></el-table-column>

        <el-table-column prop="getTime" label="申请时间" show-overflow-tooltip></el-table-column>

        <el-table-column prop="userName" label="用户名" show-overflow-tooltip></el-table-column>
        <el-table-column prop="goodsPrice" label="退款金额" show-overflow-tooltip></el-table-column>

        <el-table-column prop="state" label="申请状态" show-overflow-tooltip></el-table-column>





      </el-table>

      <div style="margin-top: 20px;height:37px;">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[4, 8, 12, 16]"
          :page-size="pagesize"
          :total="total"
          layout="total, sizes, prev, pager, next, jumper">
        </el-pagination>

      </div>
    </div>

  </div>
</template>

<script>
  import mymenu from '../components/menu'
  import subpagetitle from './common/subpagetitle'
  import mybtn from './common/button'
  import mylabel from './common/label'
  import myinput from './common/input'
  import projectnav from './nav.vue'

  export default {
    name: "orderHuan",
    components:{
      mymenu:mymenu,
      subpagetitle:subpagetitle,
      mybtn:mybtn,
      mylabel:mylabel,
      myinput:myinput,
      projectnav:projectnav,
    },
    data() {
      return {
        tableData3: [],
        multipleSelection: [],
        search1:'',
        search2:'',
        search3:'',
        total:0,
        pagesize:4,//每页的数据条数
        currentPage:1,//默认开始页面
        dialogFormVisible: false,

      }
    },
    created () {
      let that=this;
      /*发起请求，请求数据，向node发起请求*/
      this.$axios.get("/api/orderHuan.do")
        .then(function (resp) {
          that.tableData3=resp.data;
          that.total=that.tableData3.length
        }).then(function () {
        /* that.$store.dispatch('wfhnumber', that.total);*/
      })
    },
    computed: {
      tables() {
        var arr = sessionStorage.getItem('data');
        var array = JSON.parse(arr);
        console.log(arr);
        var adm_name=document.getElementsByClassName("adm_name")[0];
        var adm_attribute=document.getElementsByClassName("adm_attribute")[0];
        console.log(adm_name);
        adm_name.innerHTML=array.adm_name;
        adm_attribute.innerHTML=array.adm_attribute;
        var that=this;
        return this.tableData3.filter(function(value){
          // console.log(value.orderId.indexOf(that.searchText));
          return (String(value['orderId']).toLowerCase().indexOf(that.search1)>-1 && String(value['userName']).toLowerCase().indexOf(that.search2)>-1 && String(value['getTime']).toLowerCase().indexOf(that.search3)>-1) ;
        })
      },
      updated(){
        var arr = sessionStorage.getItem('data');
        var array = JSON.parse(arr);
        console.log(arr);
        var adm_name=document.getElementsByClassName("adm_name")[0];
        var adm_attribute=document.getElementsByClassName("adm_attribute")[0];
        console.log(adm_name);
        adm_name.innerHTML=array.adm_name;
        adm_attribute.innerHTML=array.adm_attribute;
      }

    },
    methods:{
      /*分页*/
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
    }


  }
</script>

<style scoped>
  #btngroup{
    width: 66%;
    position: absolute;
    top: 20px;
    right: 8px;
  }


  #search{
    /*outline: 1px solid red;*/
    width: 82%;
    height: 85px;
    margin-left: 18%;
    position: relative;
  }
  #search>div{
    /*outline: 1px solid red;*/
    float: left;
    margin: 25px 0 0 7%;
  }
  #searchbtn{
    position: absolute;
    top: 0;
    right: 8%;
  }

  *{
    margin: 0;
    padding: 0;
  }
  li{
    letter-spacing: 1px;
    color: black;
    padding: 10px 15px;
    background-color: white;
    border: none;
    border-radius: 3px;
    margin-left: -3px;
    list-style: none;
    float: left;
    margin-right: 3px;
    cursor: pointer;
  }
  li:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  li:focus{
    outline: none;
  }


  .bigbox{
    width: 68%;
    margin-left: 24%;
    /*outline: 1px solid red;*/
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    /*outline: 1px solid pink;*/
    float: right;
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
</style>
