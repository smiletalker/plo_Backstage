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
//      created(){
//        this.$axios.get("http://172.16.6.4:8888/sytjT.do").then(function (resp) {
//          console.log(1111);
//        })
//      },
      mounted() {
        /*ECharts图表*/
        var myChart = echarts.init(document.getElementById('main'));
        var date = [["2017-09-01",28435],["2017-09-02",16328],["2017-09-03",19384],["2017-09-04",13479],["2017-09-05",12373],["2017-09-06",10289],["2017-09-07",14783],["2017-09-08",10928],["2017-09-09",15874],["2017-09-10",17629],["2017-09-11",14382],["2017-09-12",14248],["2017-09-13",9092],["2017-09-14",10878],["2017-09-15",8208],["2017-09-16",12308],["2017-09-17",15788],["2017-09-18",13698],["2017-09-19",16908],["2017-09-20",19732],["2017-09-21",20021],["2017-09-22",17232],["2017-09-23",14230],["2017-09-24",16322],["2017-09-25",10392],["2017-09-26",10347],["2017-09-27",9028],["2017-09-28",14023],["2017-09-29",13987],["2017-09-30",15922]];

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
            left: '45%',
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
            top: '30%',
            left:'15%',
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
    margin-top: 30px;
    margin-left: 30px;
  }
  #main{
    width: 1000px;
    height: 300px;
  }
  #bigD{
    overflow: hidden;
    width: 1000px;
    height:430px;
    margin-left: 22.5%;
    margin-top: 50px;
    background: white;
    box-shadow:darkgray 2px 2px 8px 1px;
  }
</style>
