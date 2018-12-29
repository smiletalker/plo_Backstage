<template>
    <div class="main">
        <div class="left marginLeft">
          <span>订单编号:</span>
          <input type="text" placeholder="订单编号">
        </div>
        <div class="right">
          <span>提交日期:</span>
          <el-date-picker v-model="value4" type="datetimerange" range-separator="至" start-placeholder="开始日期"  end-placeholder="结束日期">
        </el-date-picker>
          <!--<i class="el-icon-search fontSize"></i>-->
        </div>
    </div>
</template>

<script>
    export default {
        name: "timeSelect",

      data() {
        return {
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
          value4: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
          value5: ''
        };
      }
    }
</script>

<style scoped>
  * {
    margin: 0;
    padding: 0;
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
