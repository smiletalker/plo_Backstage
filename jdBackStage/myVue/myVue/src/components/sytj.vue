<template>
  <div id="bigD">
    <h1>收益统计：</h1>
    <div id="main"></div>
  </div>
</template>

<script>
  var echarts=require('echarts');


    export default {
      name: "datamsg",
      mounted() {
        /*ECharts图表*/
        var myChart = echarts.init(document.getElementById('main'));
        var date = [["2000-06-05",116],["2000-06-06",129],["2000-06-07",135],["2000-06-08",86],["2000-06-09",73],["2000-06-10",85],["2000-06-11",73],["2000-06-12",68],["2000-06-13",92],["2000-06-14",130],["2000-06-15",245],["2000-06-16",139],["2000-06-17",115],["2000-06-18",111],["2000-06-19",309],["2000-06-20",206],["2000-06-21",137],["2000-06-22",128],["2000-06-23",85],["2000-06-24",94],["2000-06-25",71],["2000-06-26",106],["2000-06-27",84],["2000-06-28",93],["2000-06-29",85],["2000-06-30",73],["2000-07-01",83],["2000-07-02",125],["2000-07-03",107],["2000-07-04",82],["2000-07-05",44]];

        var dateList = date.map(function (item) {
          return item[0];
        });
        var valueList = date.map(function (item) {
          return item[1];
        });
        myChart.setOption({

          visualMap: [{
            show: false,
            type: 'continuous',
            seriesIndex: 0,
            min: 0,
            max: 400
          }],


          title: [{
            top: '10%',
            left: 'center',
            text: '本月销售额折线图'
          }],
          tooltip: {
            trigger: 'axis'
          },
          xAxis: [{
            data: dateList
          }],
          yAxis: [{
            splitLine: {show: false}
          }],
          grid: [{
            top: '30%'
          }],
          series: [{
            type: 'line',
            showSymbol: false,
            data: valueList
          }, ]
        });
      }
    }




</script>

<style scoped>
  h1{
    font-size: 16px;
    font-weight: lighter;
    margin-left: -800px;
  }
  #main{
    width: 1000px;
    height: 300px;
    border: 1px solid red;
  }
</style>
