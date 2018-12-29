<template>
    <!--实现多选非常简单:
    手动添加一个el-table-column，
    设type属性为selection即可；
    默认情况下若内容过多会折行显示，
    若需要单行显示可以使用show-overflow-tooltip属性，
    它接受一个Boolean，为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。-->
  <div class="bigbox">
    <!--表格，用的是element里面的Table表格-->
    <el-table ref="multipleTable" :data="tableData3" tooltip-effect="dark" style="width: 100%"
              @selection-change="handleSelectionChange">

      <el-table-column type="selection" width="55"></el-table-column>

      <el-table-column label="日期" width="120">
        <template slot-scope="scope">{{ scope.row.date }}</template>
      </el-table-column>

      <el-table-column prop="name" label="姓名" width="120"></el-table-column>

      <el-table-column prop="address" label="地址" show-overflow-tooltip></el-table-column>

    </el-table>

    <div style="margin-top: 20px;outline: 1px solid green;height:37px;">
      <!--分页-->
      <mypaging></mypaging>
      <!--增加、删除、取消、刷新四个按钮-->
      <div class="btndiv">
        <!--增加-->
        <mybtn class-name="el-icon-plus"></mybtn>
        <!--删除-->
        <mybtn class-name="el-icon-delete"></mybtn>
        <!--刷新-->
        <mybtn class-name="el-icon-refresh"></mybtn>

      </div>

    </div>
  </div>

</template>

<script>
  import mybtn from './button'
  import mypaging from './paging'
    export default {
      name: "mytable",
      components:{
        mybtn:mybtn,
        mypaging:mypaging
      },
      data() {
        return {
          tableData3: [{
            date: '2016-05-03',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-02',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-04',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-01',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-08',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-06',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            date: '2016-05-07',
            name: '王小虎',
            address: '上海市普陀区金沙江路 1518 弄'
          }],
          multipleSelection: []
        }
      },
      methods: {
      }
    }
</script>

<style scoped>
  .bigbox{
    width: 70%;
    margin-left: 25%;
    outline: 1px solid red;
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    outline: 1px solid pink;
    float: right;
  }
</style>
