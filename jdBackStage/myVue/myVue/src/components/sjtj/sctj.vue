<template>
  <div id="bigD">
    <h1>收藏统计：</h1>
    <div id="sc"></div>
  </div>
</template>

<script>
  var echarts=require('echarts');


  export default {
    name: "sctj",
    mounted() {
      /*ECharts图表*/
      var myChart = echarts.init(document.getElementById('sc'));

      myChart.setOption({


        series: {
          type: 'sunburst',


          data: [
            {
              name: '登山',
              value:20,
              itemStyle: {
                color: '#f2684b'
              },
              children: [{
                name: '登山包',
                value:5,
                itemStyle: {
                  color: '#f2684b'
                },
                children: [{
                  name: 'Topsky 130',
                  value: 3,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }, {
                  name: 'OSPREY 80',
                  value: 2,
                  itemStyle: {
                    color: '#f2684b'
                  }
                },
                ]
              }, {
                name: '登山杖',
                value: 3,
                itemStyle: {
                  color: '#f2684b'
                },
                children: [{
                  name: '丛林登山杖 220',
                  value: 1.1,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }, {
                  name: '骆驼登山杖 330',
                  value:1.9,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }]
              }, {
                name: '手套',
                value: 3,
                itemStyle: {
                  color: '#f2684b'
                },
                children: [{
                  name: '运动手套 260',
                  value: 1.8,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }, {
                  name: '安德手套 180',
                  value: 1.2,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }]
              }, {
                name: '眼镜',
                value: 3,
                itemStyle: {
                  color: '#f2684b'
                },
                children: [{
                  name: '登山眼镜 260',
                  value: 2,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }, {
                  name: '护目眼镜 130',
                  value: 1,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }]

              }, {
                name: '登山鞋',
                value: 6,
                itemStyle: {
                  color: '#f2684b'
                },
                children: [{
                  name: 'NORTH 890',
                  value: 3.3,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }, {
                  name: 'Kailas 780',
                  value: 2.7,
                  itemStyle: {
                    color: '#f2684b'
                  }
                }]
              }, ]
            }, {
              name: '攀岩',
              value: 20,
              itemStyle: {
                color: '#e1841f'
              },
              children: [{
                name: '头盔',
                value: 4,
                itemStyle: {
                  color: '#e1841f'
                },
                children: [{
                  name: '攀岩头盔 480',
                  value: 2.5,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }, {
                  name: '防护头盔 160',
                  value: 1.5,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }]
              }, {
                name: '安全锁',
                value:3,
                itemStyle: {
                  color: '#e1841f'
                },
                children: [{
                  name: 'C型主锁 230',
                  value: 1.2,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }, {
                  name: 'D型主锁 360',
                  value: 1.8,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }]
              },{
                name: '安全带',
                value: 3,
                itemStyle: {
                  color: '#e1841f'
                },
                children: [{
                  name: '可调攀岩带 680',
                  value: 3,
                  itemStyle: {
                    color: '#e1841f'
                  }
                },]
              },{
                name: '安全绳',
                value: 3,
                itemStyle: {
                  color: '#e1841f'
                },
                children: [{
                  name: '9芯伞绳',
                  value: 3,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }]
              },{
                name: '攀岩鞋',
                value: 7,
                itemStyle: {
                  color: '#e1841f'
                },
                children: [{
                  name: '攀岩鞋 400',
                  value: 2.7,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }, {
                  name: 'STICKIT 330',
                  value: 2.3,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }, {
                  name: 'Kailas 300',
                  value: 2,
                  itemStyle: {
                    color: '#e1841f'
                  }
                }]
              }]
            },{
              name: '滑雪',
              value:30,
              itemStyle: {
                color: '#8b8c90'
              },
              children: [{
                name: '头盔',
                value: 7,
                itemStyle: {
                  color: '#8b8c90'
                },
                children: [{
                  name: '全地形雪盔 580',
                  value: 4.8,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '山脉滑雪盔 340',
                  value: 2.2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }]
              }, {
                name: '眼镜',
                value:6,
                itemStyle: {
                  color: '#8b8c90'
                },
                children: [{
                  name: '球面雪镜 210',
                  value: 2.3,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '柱面雪镜 380',
                  value: 3.7,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }]
              },{
                name: '滑雪服',
                value:8,
                itemStyle: {
                  color: '#8b8c90'
                },
                children: [{
                  name: '迷彩雪服 360',
                  value: 2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '套头雪服 360',
                  value: 2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '夹棉雪服 360',
                  value: 2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '印花雪服 360',
                  value: 2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }]
              },{
                name: '滑雪板',
                value:3,
                itemStyle: {
                  color: '#8b8c90'
                },
                children: [{
                  name: '涂鸦单板 190',
                  value: 1,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '男子单板 190',
                  value: 1,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: '竞技双板 190',
                  value: 1,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }]
              },{
                name: '滑雪鞋',
                value:6,
                itemStyle: {
                  color: '#8b8c90'
                },
                children: [{
                  name: 'GEA RS 200',
                  value: 1,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: 'TX COMP 240',
                  value: 1.2,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: 'Maestrale 280',
                  value: 1.3,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }, {
                  name: 'F1 360',
                  value: 2.5,
                  itemStyle: {
                    color: '#8b8c90'
                  }
                }]
              }]
            }, {
              name: '高山跑步',
              value: 15,
              itemStyle: {
                color: '#caa465'
              },
              children: [{
                name: '运动服',
                value: 4,
                itemStyle: {
                  color: '#caa465'
                },
                children: [{
                  name: '夏季跑步 240',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }, {
                  name: '长袖户外 240',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }, {
                  name: '男运动服 480',
                  value: 2,
                  itemStyle: {
                    color: '#caa465'
                  }
                }]
              }, {
                name: '腰包',
                value:4,
                itemStyle: {
                  color: '#caa465'
                },
                children: [{
                  name: '隐形腰包 370',
                  value: 2,
                  itemStyle: {
                    color: '#caa465'
                  }
                }, {
                  name: '跑步腰包 370',
                  value: 2,
                  itemStyle: {
                    color: '#caa465'
                  }
                }]
              },{
                name: '发带',
                value:3,
                itemStyle: {
                  color: '#caa465'
                },
                children: [{
                  name: '吸汗发带 260',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }, {
                  name: '民族头箍 260',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                },{
                  name: '印花发带 260',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }]
              },{
                name: '跑鞋',
                value:4,
                itemStyle: {
                  color: '#caa465'
                },
                children: [{
                  name: 'Grain 280',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }, {
                  name: 'Malt 280',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                },{
                  name: 'FREEDOM 280',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                },{
                  name: 'TX PRO 280',
                  value: 1,
                  itemStyle: {
                    color: '#caa465'
                  }
                }]
              }]
            },{
              name: '徒步旅行',
              value: 15,
              itemStyle: {
                color: '#bb764c'
              },
              children: [{
                name: '上衣',
                value:6,
                itemStyle: {
                  color: '#bb764c'
                },
                children: [ {
                  name: '拉链衫 230',
                  value: 1.3,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: '长款外套 540',
                  value: 3,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: '运动夹克 280',
                  value: 1.7,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }]
              }, {
                name: '裤子',
                value:3,
                itemStyle: {
                  color: '#bb764c'
                },
                children: [{
                  name: '男Swac 320',
                  value: 1,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: '男Cente 320',
                  value: 1,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: '女Siro 320',
                  value: 1,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }]
              }, {
                name: '背包',
                value:4,
                itemStyle: {
                  color: '#bb764c'
                },
                children: [{
                  name: '极道200 210',
                  value: 1.3,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: '极道NF0 470',
                  value: 2.7,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }]
              }, {
                name: '帽子',
                value:2,
                itemStyle: {
                  color: '#bb764c'
                },
                children: [{
                  name: 'B087帽 390',
                  value: 1,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }, {
                  name: 'NF00帽 390',
                  value: 1,
                  itemStyle: {
                    color: '#bb764c'
                  }
                }]
              }]
            }]

        }
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
  #sc{
    width: 1000px;
    height: 850px;
    margin-top: -80px;
  }
  #bigD{
    width: 1000px;
    height: 800px;
    overflow: hidden;
    margin-left: 22.5%;
    margin-top: 50px;
    background: white;
    box-shadow:darkgray 2px 2px 8px 1px;
  }
</style>
