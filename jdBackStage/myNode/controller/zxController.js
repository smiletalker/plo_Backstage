const zxDao=require("../dao/zxDao");

var customerInfo;
var consumeInfo;
const zxController={
    customerMsg:function(req,resp){
        /*用户基本信息*/
        zxDao.customerMsg([]).then((data)=>{
            customerInfo=data;
            // console.log(customerInfo.length);
        }).catch((err)=>{
                console.log(err);
            });
        /*用户消费信息*/
        zxDao.consume([]).then((data)=>{
            var string=JSON.stringify(data);
            var result=JSON.parse(string);
            while(result.length<customerInfo.length){
                for(var i=0;i<result.length;i++){
                    if(result[i].userid!=i+1){
                        var tempObj=new Object();
                        tempObj.userid=i+1;
                        tempObj.consume=0;
                        result.splice(i,0,tempObj);
                        break;
                    }
                }
            }
            consumeInfo=result;
        }).catch((err)=>{
            console.log(err);
        });

       for(var i=0;i<consumeInfo.length;i++){
           customerInfo[i].consume=consumeInfo[i].consume;
       }
       console.log(customerInfo);
       resp.send(customerInfo);
    },

    orderMsg:function(req,resp){
        let userID=req.query.userID;
        zxDao.orderMsg(userID).then((data)=>{
            resp.send(data);
        }).catch((err)=>{
            console.log(err);
        });
    },

    addressMsg:function(req,resp){
        let userID=req.query.userID;
        zxDao.addressMsg(userID).then((data)=>{
            resp.send(data);
            console.log(data);
        }).catch((err)=>{
            console.log(err);
        });
    },
    imagesMsg:function(req,resp){
       let goodsId=req.query.goodsId;
       let goodsKind=req.query.goodsKind;
       console.log('zxController'+goodsKind);
        console.log('zxController'+goodsId);
       zxDao.imagesMsg([goodsId,goodsKind]).then((data)=>{
           resp.send(data);
           console.log(data);
           resp.send(data);
       }).catch((err)=>{
           console.log(err);
       });
    },
    saveImg:function(req,resp){
        let imgName=req.body.imgName;
        let imgSrc=req.body.imgSrc;
        /*
        * //接收前台POST过来的base64
         var imgData = req.body.imgData;
         //过滤data:URL
         var base64Data = imgData.replace(/^data:image\/\w+;base64,/, "");
         var dataBuffer = new Buffer(base64Data, 'base64');
         fs.writeFile("image.png", dataBuffer, function(err) {
         if(err){
         res.send(err);
         }else{
         res.send("保存成功！");
         }
         });

         var fs = require('fs');
         　　　　 var path = 'public/resources/views/headPortrait/'+ Date.now() +'.png';//从app.js级开始找--在我的项目工程里是这样的
         var base64 = data.replace(/^data:image\/\w+;base64,/, "");//去掉图片base64码前面部分data:image/png;base64
         var dataBuffer = new Buffer(base64, 'base64'); //把base64码转成buffer对象，
         console.log('dataBuffer是否是Buffer对象：'+Buffer.isBuffer(dataBuffer));
         fs.writeFile(path,dataBuffer,function(err){//用fs写入文件
         if(err){
         console.log(err);
         }else{
         console.log('写入成功！');
         }
         })

         */

        var path='../public/images/upload/'+imgName;
        var base64 = data.replace(/^data:image\/\w+;base64,/, "");//去掉图片base64码前面部分data:image/png;base64
        var dataBuffer = new Buffer(base64, 'base64'); //把base64码转成buffer对象
        console.log('dataBuffer是否是Buffer对象：'+Buffer.isBuffer(dataBuffer));
        fs.writeFile(path,dataBuffer,function(err){//用fs写入文件
            if(err){
                console.log(err);
            }else{
                console.log('写入成功！');
            }
        })


        // zxDao.saveImg([imgName,imgSrc]).then((data)=>{
        //     resp.send(data);
        //     console.log(data);
        //     resp.send(data);
        // }).catch((err)=>{
        //     console.log(err);
        // });
    },
    changeImg:function(req,resp){
        let goodsId=req.query.goodsId;
        let goodsKind=req.query.goodsKind;
        zxDao.changeImg([goodsId,goodsKind]).then((data)=>{
            resp.send(data);
            console.log(data);
            resp.send(data);
        }).catch((err)=>{
            console.log(err);
        });
    }
}

module.exports=zxController;