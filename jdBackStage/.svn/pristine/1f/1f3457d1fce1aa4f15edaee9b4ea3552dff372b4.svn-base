const dbPool=require("../config/poolConfig");

const zxDao={
    /*查询用户基本信息*/
    customerMsg:function(parasm){
        return new Promise((resolve,reject)=>{
            let sql="SELECT userID,userName,userPhone\n" +
                "FROM userregist";
            dbPool.connect(sql,parasm,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },

    /*查询用户的消费金额*/
    consume:function(parasm){
        return new Promise((resolve,reject)=>{
            let sql="SELECT userid,SUM(goodsPrice) as consume\n" +
                "FROM userorder\n" +
                "GROUP BY userid";
            dbPool.connect(sql,parasm,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },

    //查询用户订单信息
    orderMsg:function(params){
        console.log(params);
        return new Promise((resolve,reject)=>{
            let sql="\n" +
                "SELECT ug.userId,ua.userName,ua.phoneName,ur.userOderAddress,ur.orderNo,ur.orderId,ur.goodsId,ur.goodsKind,ur.goodsImageSrc,\n" +
                "ur.goodsName,ur.goodsSize,ur.goodsColor,ur.goodsPrice,ur.goodsNum,ur.payTime,ur.isPay\n" +
                "FROM userregist ug JOIN userorder ur\n" +
                "ON ur.userId=ug.userId\n" +
                "JOIN useraddress ua\n" +
                "ON ur.userId=ua.userId\n" +
                "WHERE ua.userAddress1=ur.userOderAddress\n" +
                "AND ur.userId=?";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    //查询用户收货地址信息
    addressMsg:function(params){
        console.log(params);
        return new Promise((resolve,reject)=>{
            let sql="SELECT userAddress1,userName,phoneName\n" +
                "FROM useraddress\n" +
                "WHERE userId=?";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    // 查询产品页面的图片
    imagesMsg:function(params){
        console.log('params'+params);
        return new Promise((resolve,reject)=>{
            let sql="SELECT goodsId,goodsKindId,src1,src2,src3,src4,src5,src6,src7,src8\n" +
                "FROM goodsimages\n" +
                "WHERE goodsId=? AND goodsKindId=?";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    console.log(data);
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    saveImg:function(params){

    },
    changeImg:function(params){
        return new Promise((resolve,reject)=>{
            let sql="UPDATE goodsImages SET src1='../public/images/upload/snow_f1.png',src2='../public/images/upload/snow_f2.png',src3='../public/images/upload/snow_f3.png',src4='../public/images/upload/snow_f4.png' WHERE goodsId=? AND goodsKindId=?";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    }
}

module.exports=zxDao;