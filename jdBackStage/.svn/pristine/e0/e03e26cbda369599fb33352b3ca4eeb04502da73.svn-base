<template>
  <div id="kdszzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "kdsZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('kdszzt'));
      myChart.setOption({
        color: ['#3398DB'],
        tooltip: {},
        title:{
          subtext:'登山',
          x:'170px',
          y:'10px',
          subtextStyle:{
            fontSize:15,
          }
        },
        xAxis: {
          data: ["登山包","登山杖","手套","护膝","登山鞋"]
        },

        yAxis: {},
        series: [{
          name: '库存',
          type: 'bar',
          data: [5320, 8320, 9030, 1540, 4223]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #kdszzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 70px;

  }
</style>
