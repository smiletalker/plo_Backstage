<template>
  <div id="app">
    <header>
      <projectnav></projectnav>
    </header>
    <!--npm install vue-router &#45;&#45;save-->
    <div class="index_content">
      <div class="index_header">
        <div class="index_header1">
          <img src="../../static/images/icon3.png" alt="">
          <p>今日订单总数 </p>
          <h3>{{todayOrder}}</h3>
        </div>
        <div class="index_header1">
          <img src="../../static/images/icon1.png" alt="">
          <p>今日销售总额 </p>
          <h3>{{todaySell}}</h3>
        </div>
        <div class="index_header1">
          <img src="../../static/images/icon2.png" alt="">
          <p>昨日销售总额 </p>
          <h3>{{ysetodaySell}}</h3>
        </div>
      </div>
      <div class="affair">
        <div class="affair_content">
          <h2>待处理事务</h2>
          <div class="affair_eve">
            <div class="aff_all">
              <span> 未发货订单</span><span class="number">(<span>{{this.$store.state.wfhnumber}}</span>)</span>
              <hr>
            </div>
            <div class="aff_all">
              <span>未付款订单</span><span class="number">(<span>{{this.$store.state.wfknumber}}</span>)</span>
              <hr>
            </div>
            <div class="aff_all">
              <span> 未收货订单 </span><span class="number">(<span >{{this.$store.state.wshnumber}}</span>)</span>
              <hr>
            </div>
            <div class="aff_all">
              <span> 已收货订单</span><span class="number">(<span >{{this.$store.state.yshnumber}}</span>)</span>
              <hr>
            </div>
            <div class="aff_all">
              <span> 退款 </span><span class="number">(<span>{{this.$store.state.tknumber}}</span>)</span>
              <hr>
            </div>
            <div class="aff_all">
              <span>  退货</span><span class="number">(<span>{{this.$store.state.thnumber}}</span>)</span>
              <hr>
            </div>
          </div>
        </div>
      </div>
      <div class="affair affair_other">
        <div class="affair_content affair_content_other">
          <mysytj id="in"></mysytj>
        </div>
      </div>

      <div class="affair affair_sale">
        <div class="affair_content affair_content_sale">
          <h2 style="display:inline-block">商品销售统计</h2><small>(每月)</small>
          <el-table
            :data="tableData"
            style="width: 90%"
            class="psHeight"
          >
            <el-table-column
              prop="date"
              label="排行"
              width="180">
            </el-table-column>
            <el-table-column
              prop="name"
              label="商品编号"
              width="180">
            </el-table-column>
            <el-table-column
              prop="address"
              label="商品分类">
            </el-table-column>
            <el-table-column
              prop="goods_name"
              label="商品名称">
            </el-table-column>
            <el-table-column
              prop="goods_num"
              label="销售数量">
            </el-table-column>
          </el-table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
   import  mysytj from './sjtj/sytj.vue'
  export default{
    name: 'index',
    components: {
      projectnav:projectnav,
      mysytj:mysytj,
    },
    created(){
      console.log(this.$store);
    },
    data(){
      return{
        todayOrder:10,
        todaySell:5000,
        ysetodaySell:3000,
        affair:[9,9,9,9,9,9,9,9,9,9],
        tableData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄',
          goods_name:'花鸟服装',
          goods_num:800
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄',
          goods_name:'花鸟服装',
          goods_num:800
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄',
          goods_name:'花鸟服装',
          goods_num:800
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄',
          goods_name:'花鸟服装',
          goods_num:800
        }]
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
    }
  }

</script>
<style>
 @import "../assets/index.css";
  #in{
    margin-left: 3%;
  }
</style>
