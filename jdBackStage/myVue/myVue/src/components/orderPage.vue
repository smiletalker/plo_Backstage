<template>
  <el-pagination class="pagingstyle"
                 @size-change="handleSizeChange"
                 @current-change="handleCurrentChange"
                 :current-page.sync="currentPage3"
                 :page-size="100"
                 layout="prev, pager, next, jumper"
                 :total="1000"><!--total页面数据总条数  pagesize当前页显示的条数 -->
  </el-pagination>
</template>

<script>
  export default {
    name: "mypaging",
    methods: {
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        console.log(`当前页: ${val}`);
      }
    },
    data() {
      return {
        currentPage1: 5,
        currentPage2: 5,
        currentPage3: 5,
        currentPage4: 4
      };
    }
  }
</script>

<style scoped>
  *{
    margin: 0;
    padding: 0;
  }
  .pagingstyle{
    float: left;
    margin-top: 5px;
  }
</style>
