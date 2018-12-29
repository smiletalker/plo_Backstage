<!--<template>-->
  <!--&lt;!&ndash;实现多选非常简单:-->
  <!--手动添加一个el-table-column，-->
  <!--设type属性为selection即可；-->
  <!--默认情况下若内容过多会折行显示，-->
  <!--若需要单行显示可以使用show-overflow-tooltip属性，-->
  <!--它接受一个Boolean，为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。&ndash;&gt;-->
  <!--<div class="bigbox">-->
    <!--&lt;!&ndash;表格，用的是element里面的Table表格&ndash;&gt;-->
    <!--<el-table ref="multipleTable" :data="tableData3" tooltip-effect="dark" style="width: 100%"-->
    <!--&gt;-->

      <!--<el-table-column type="selection" show-overflow-tooltip></el-table-column>-->

      <!--<el-table-column prop="orderId" label="订单编号" show-overflow-tooltip></el-table-column>-->

      <!--<el-table-column prop="getTime" label="申请时间" show-overflow-tooltip></el-table-column>-->

      <!--<el-table-column prop="userName" label="用户名" show-overflow-tooltip></el-table-column>-->
      <!--<el-table-column prop="goodsPrice" label="退款金额" show-overflow-tooltip></el-table-column>-->

      <!--<el-table-column prop="state" label="申请状态" show-overflow-tooltip></el-table-column>-->
      <!--<el-table-column  label="操作" show-overflow-tooltip>-->
        <!--<template slot-scope="scope">-->
          <!--<select name="" id="">-->
            <!--<option value="1">允许</option>-->
            <!--<option value="2">拒绝</option>-->
          <!--</select>-->
        <!--</template>-->
      <!--</el-table-column>-->




    <!--</el-table>-->

    <!--<div style="margin-top: 20px;height:37px;">-->
      <!--&lt;!&ndash;分页&ndash;&gt;-->
      <!--<orderPage></orderPage>-->
    <!--</div>-->
  <!--</div>-->
<!--</template>-->

<!--<script>-->

  <!--import orderPage from './orderPage'-->
  <!--export default {-->
    <!--name: "ordertable9",-->
    <!--components:{-->

      <!--orderPage:orderPage-->

    <!--},-->
    <!--data() {-->
      <!--return {-->
        <!--formInline: {-->
          <!--user: '',-->
          <!--region: ''-->
        <!--},-->
        <!--tableData3: [],-->
        <!--multipleSelection: []-->
      <!--}-->
    <!--},-->
    <!--created () {-->
      <!--let that=this;-->
      <!--/*发起请求，请求数据，向node发起请求*/-->
      <!--this.$axios.get("/api/ordertable9.do")-->
        <!--.then(function (resp) {-->
          <!--that.tableData3=resp.data;-->
        <!--})-->
    <!--}-->

  <!--}-->
<!--</script>-->

<!--<style scoped>-->
  <!--.bigbox{
    width: 68%;
    margin-left: 24%;
    /*outline: 1px solid red;*/
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    /*outline: 1px solid pink;*/
    float: right;
  }-->


<!--</style>-->
