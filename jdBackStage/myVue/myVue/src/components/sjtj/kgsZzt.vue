<template>
  <div id="kgszzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "kgsZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('kgszzt'));
      myChart.setOption({
        color: ['#3398DB'],
        tooltip: {},
        title:{
          subtext:'高山跑步',
          x:'170px',
          y:'10px',
          subtextStyle:{
            fontSize:15,
          }
        },
        xAxis: {
          data: ["运动服","腰包","发带","跑鞋"]
        },

        yAxis: {},
        series: [{
          name: '库存',
          type: 'bar',
          data: [3222, 2220, 2364,1925]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #kgszzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 100px;

  }
</style>
