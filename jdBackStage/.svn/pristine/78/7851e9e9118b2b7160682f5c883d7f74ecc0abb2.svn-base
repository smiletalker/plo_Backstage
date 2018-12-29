<template>
  <div id="gszzt"></div>
</template>

<script>
  var echarts=require('echarts');

  export default {
    name: "gsZzt",
    mounted(){
      var myChart = echarts.init(document.getElementById('gszzt'));
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
          name: '销量',
          type: 'bar',
          data: [522, 720, 636,492]
        }]
      });



      // 使用刚指定的配置项和数据显示图表。

    }
  }
</script>

<style scoped>
  #gszzt{
    width:400px;
    height: 300px;
    float: left;
    margin-left: 100px;

  }
</style>
