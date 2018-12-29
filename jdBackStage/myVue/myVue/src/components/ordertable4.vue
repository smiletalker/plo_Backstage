<template>

  <section>
    <div class="main">
      <div class="left marginLeft">
        <span>订单编号:</span>
        <input type="text" placeholder="订单编号" v-model="searchText">
      </div>
      <div class="right">
        <span class="demonstration">提交日期:</span>
        <el-date-picker
          v-model="value5"
          type="datetimerange"
          format="yyyy-MM-dd"
          :picker-options="pickerOptions2"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          align="right">
        </el-date-picker>
        <!--<i class="el-icon-search fontSize"></i>-->
      </div>
    </div>
    <!--实现多选非常简单:
    手动添加一个el-table-column，
    设type属性为selection即可；
    默认情况下若内容过多会折行显示，
    若需要单行显示可以使用show-overflow-tooltip属性，
    它接受一个Boolean，为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。-->
    <div class="bigbox">
      <div class="mybox" v-show="show">
        <div class="smallbox">
          <i class="el-icon-close" style="cursor: pointer" @click="show=!show"></i>
          <div class="text">
            <span>订单编号:{{order.orderId}}</span>
            <span>下单时间:{{order.payTime}}</span>
          </div>
          <table  cellpadding="0" cellspacing="0">
            <tr>
              <th>商品图片</th>
              <th>商品名称</th>
              <th>尺寸</th>
              <th>颜色</th>
              <th>价格</th>
              <th>数量</th>
              <th>小计</th>
            </tr>
            <tr>
              <td><img :src="'/api/'+goodsImage" alt=""></td>
              <td>{{order.goodsName}}</td>
              <td>{{order.goodsSize}}</td>
              <td>{{order.goodsColor}}</td>
              <td>{{order.goodsPrice}}</td>
              <td>{{order.goodsNum}}</td>
              <td>{{order.goodsPrice}}</td>
            </tr>

          </table>
          <div class="footText">
            <p>
              <span>收件人姓名:</span>
              <span>{{order.userName}}</span>
            </p>
            <p>
              <span>联系电话:</span>
              <span>{{order.phoneName}}</span>
            </p>
            <p>
              <span>收货地址:</span>
              <span>{{order.userOderAddress}}</span>
            </p>
          </div>
        </div>
      </div>
      <div class="wobox" v-show="showTime">
        <div class="smallbox">
          <div class="boxText">
            <span>提醒信息</span>
          </div>
          <div class="BoxMain">
            <div class="center">
              <p>收货人姓名:&nbsp;<myInput width="width:40%" :value="order.userName" readonly="" class="fontColor"></myInput></p>
              <p>商品名称:&nbsp;<myInput width="width:40%" :value="order.goodsName" readonly class="fontColor"></myInput></p>
              <p>手机号码:&nbsp;<myInput width="width:40%" :value="order.phoneName" readonly class="fontColor"></myInput></p>
              <p>编辑信息:&nbsp;<textarea cols="57" rows="8" class="yan fontColor" >您购买的商品已到达地方，请您尽快确认，谢谢。
          </textarea></p>
            </div>
          </div>
          <div class="btn" @click="showTime=!showTime">
            <mybtn btn-text="确认"  ></mybtn>
          </div>
        </div>
      </div>
      <!--表格，用的是element里面的Table表格-->
      <el-table ref="multipleTable" :data="tables.slice((currentPage-1)*pagesize,currentPage*pagesize)" tooltip-effect="dark" style="width: 100%"
      >

        <el-table-column type="selection" show-overflow-tooltip align="center"></el-table-column>



        <el-table-column prop="orderId" label="订单编号" show-overflow-tooltip align="center"></el-table-column>
        <el-table-column prop="userName" label="用户名" show-overflow-tooltip align="center"></el-table-column>
        <el-table-column prop="goodsPrice" label="订单金额" show-overflow-tooltip align="center"></el-table-column>

        <el-table-column prop="payTime" label="提交时间"  show-overflow-tooltip align="center"></el-table-column>
        <    <el-table-column
        fixed="right"
        label="操作"
        show-overflow-tooltip align="center">
        <template slot-scope="scope">
          <i class="el-icon-view" style="cursor: pointer" @click="handleClick(scope.row)" v-on:click="show=!show"></i>
          <i class="el-icon-message" @click="handleClick(scope.row)" v-on:click="showTime=!showTime" style="cursor: pointer"></i>
        </template>
      </el-table-column>

      </el-table>

      <div style="margin-top: 20px;height:37px;">
        <!--分页-->
        <div class="block">
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
  </section>

</template>

<script>

  // import orderPage from './orderPage'
  import myInput from './common/input'
  import mybtn from './common/button'

  export default {
    name: "ordertable4",
    components:{

      // orderPage:orderPage,
      myInput:myInput,
      mybtn:mybtn

    },
    data() {
      return {
        show:false,
        showTime:false,
        tableData3: [],
        multipleSelection: [],
        total:0,
        pagesize:4,//每页的数据条数
        currentPage:1,//默认开始页面
        dialogFormVisible: false,
        num:'',
        order:[],
        searchText:'',
        pickerOptions2: {
          shortcuts: [{
            text: '最近一周',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', [start, end]);
            }
          }, {
            text: '最近一个月',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit('pick', [start, end]);
            }
          }, {
            text: '最近三个月',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit('pick', [start, end]);
            }
          }]
        },
        value5: '',
      }
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
      if(array.indexOf("博客CURD")=="-1"){
        var blog_all=document.getElementsByClassName("blog_all")[0];
        blog_all.style.display="none";
      }
    },
    created(){
      var that=this;
      this.$axios.get('/api/orertable4.do')
        .then(function (resp) {
          console.log("请求成功");
          console.log(resp);
          that.tableData3=resp.data;
          that.num=that.tableData3.length;
          that.total=that.tableData3.length;
        })
    },
    computed: {
      tables() {

        var that=this;
        return this.tableData3.filter(function(value){
          // console.log(value.orderId.indexOf(that.searchText));
          return value.orderId.indexOf(that.searchText)!=-1 ;
          console.log(that.searchText);
        })

      },

    },

    methods: {
      handleClick(row){
        // console.log(row)
        // console.log(this)
        // row.orderId
        this.order=row;
        // console.log(this.order)
        this.goodsImage=this.order.goodsImageSrc;
        this.goodsImage=this.goodsImage.slice(3,this.goodsImage.length)
      },
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
  .bigbox{
    width: 70%;
    margin-left: 25%;
    /*outline: 1px solid red;*/
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    /*outline: 1px solid pink;*/
    float: right;
  }
  .smallbox i {
    position: absolute;
    top: 4%;
    right:3%;
    font-weight: bolder;
  }

  .mybox,.wobox {
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.73);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 555;
    /*display: none;*/
  }
  .smallbox {
    width: 80%;
    height: 80%;
    background: #fff;
    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    overflow: hidden;
  }
  .text {
    margin-top: 3%;
    margin-left: 3%;
    margin-bottom: 3%;
  }
  .text span {
    margin-right: 3%;
  }
  .smallbox table {
    width: 80%;
    position: relative;
    left: 50%;
    transform: translate(-50%);
    font-size: 12px;
    color: #333
  }
  .smallbox th {
    color: rgb(102, 102, 102);
    /*font-weight: 400;*/
    font-size: 14px;

    height: 45px;


  }

  .smallbox tr:first-child {
    background: rgba(249,250,252,0.7);
  }

  .smallbox tr:not(:first-child) {
    height: 80%;
    text-align: center;
  }
  .smallbox td {
    width: 120px;
  }
  img {
    height: 20%;
    object-fit: contain;
  }

  .footText {
    font-size: 12px;
    position: absolute;
    bottom: 10%;
    right: 8%;
    width: 30%;
  }

  .footText p{
    margin-bottom: 2%;
  }

  .footText span:first-child{
    width: 30%;
    text-align: right;
  }

  .footText span {
    display: inline-block;

  }

  .boxText {
    font-size: 16px;

    font-weight: 700;
    box-sizing: border-box;
    padding: 20px
  }

  .BoxMain {
    border-color: rgb(228, 228, 228);
    border-width: 1px 0px;
    border-style: solid solid;
    width: 100%;
    position: relative;
    top: 5%;
  }

  .yan {
    border-color: rgb(228, 228, 228);
  }

.center p:not(:first-child) {
  padding-left: 15px;
  box-sizing: border-box;
}

.center p {
  font-size: 14px;
  color: rgb(102, 102, 102);
  margin: 3%;
}
.fontColor {
  color: rgb(188, 188, 188);
}
textarea {
  vertical-align: top;
}
  .center {
    width: 60%;
    position: relative;
    left: 57%;
    transform: translate(-50%);
    top: 5%;
    bottom:2%
  }

  .btn {
    width: 30%;
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    bottom: 6%;
    cursor: pointer;
  }


  .main {
    width: 82%;
    margin-left: 18%;
    height: 80px;
    line-height: 80px;
  }

  .left,.right {
    display: inline-block;
    font-size: 14px;

  }

  .marginLeft {
    margin-left: 8%
  }

  .right {
    margin-left: 100px;
  }
  input[type="text"] {
    border-radius: 4px;
    border: 1px solid #dcdfe6;
    color: #606266;
    height: 35px;
    text-indent: 1em;
    outline: none;
  }


  .el-icon-search:before {
    font-size: 17px;
    font-weight: bolder;
    margin-left: 10px;
    cursor: pointer;
  }
</style>
