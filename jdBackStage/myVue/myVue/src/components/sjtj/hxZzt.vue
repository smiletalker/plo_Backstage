<template>
  <div>

    <div id="zzt"></div>
  </div>
</template>

<script>
  var echarts=require('echarts');

    export default {
        name: "hxZzt",
      mounted(){
        var myChart = echarts.init(document.getElementById('zzt'));
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
            name: '销量',
            type: 'bar',
            data: [786, 566, 316, 539, 456, 950]
          }]
        });



        // 使用刚指定的配置项和数据显示图表。

      }
    }
</script>

<style scoped>
   #zzt{
     width:400px;
     height: 300px;
     float: left;
     margin-left: 70px;

   }

</style>
