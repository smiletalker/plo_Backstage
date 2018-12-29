<template>
  <div id="khxzzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "khxZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('khxzzt'));
      myChart.setOption({
        color: ['#3398DB'],
        tooltip: {},
        title:{
          subtext:'滑雪',
          x:'170px',
          y:'10px',
          subtextStyle:{
            fontSize:15,
          }
        },
        xAxis: {
          data: ["头盔","滑雪服","手套","单板","双板","滑雪靴"]
        },

        yAxis: {},
        series: [{
          name: '库存',
          type: 'bar',
          data: [5422, 2023, 3642, 1042, 1230, 2320]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #khxzzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 70px;

  }
</style>
