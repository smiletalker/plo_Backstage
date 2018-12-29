<template>
  <div id="pyzzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "pyZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('pyzzt'));
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
          name: '销量',
          type: 'bar',
          data: [450, 390,576, 420, 620]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #pyzzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 100px;

  }
</style>
