<template>
  <el-pagination class="pagingstyle"
                 @cucurrent-size="handleSizeChange"
                 @current-change="handleCurrentChange"
                 layout="prev, pager, next, jumper"
                 :page-size="$lyGlobal.pageSize"
                 :total="$lyGlobal.totalPages"><!--total页面数据总条数  pagesize当前页显示的条数 -->
  </el-pagination>
</template>

<script>
    export default {
        name: "productpaging",
    data() {
      return {
      };
    },
      methods: {
        handleSizeChange(val) {
          console.log(`每页 ${val} 条`);
        },
        handleCurrentChange(val) {
          console.log(`当前页: ${val}`);
        }
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
