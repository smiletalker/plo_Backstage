<template>
  <div id="kpyzzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "kpyZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('kpyzzt'));
      myChart.setOption({
        color: ['#3398DB'],
        tooltip: {},
        title:{
          subtext:'攀岩',
          x:'170px',
          y:'10px',
          subtextStyle:{
            fontSize:15,
          }
        },
        xAxis: {
          data: ["头盔","安全锁","安全绳","安全带","攀岩鞋"]
        },

        yAxis: {},
        series: [{
          name: '库存',
          type: 'bar',
          data: [2342, 2534, 3665, 5665, 7456]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #kpyzzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 100px;

  }
</style>
