<template>
  <div id="ktbzzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "ktbZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('ktbzzt'));
      myChart.setOption({
        color: ['#3398DB'],
        tooltip: {},
        title:{
          subtext:'徒步旅行',
          x:'170px',
          y:'10px',
          subtextStyle:{
            fontSize:15,
          }
        },
        xAxis: {
          data: ["上衣","裤子","背包","帽子"]
        },

        yAxis: {},
        series: [{
          name: '库存',
          type: 'bar',
          data: [1534,2024,3754,2336]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #ktbzzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 300px;

  }
</style>
