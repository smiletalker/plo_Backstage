const dbpool=require("../config/poolConfig");
const lmjDao={
ordertable1Dao(params){
    return new Promise(function (resolve,reject) {
        dbpool.connect("SELECT ug.userId,ua.userName,ua.phoneName,ur.userOderAddress,ur.orderNo,ur.orderId,ur.goodsId,ur.goodsKind,ur.goodsImageSrc,\n" +
            "ur.goodsName,ur.goodsSize,ur.goodsColor,ur.goodsPrice,ur.goodsNum,ur.payTime,ur.isDelivery\n" +
            "FROM userregist ug JOIN userorder ur\n" +
            "ON ur.userId=ug.userId\n" +
            "JOIN useraddress ua\n" +
            "ON ur.userId=ua.userId\n" +
            "WHERE ur.isDelivery=1",params,(err,data)=>{
            // console.log(data);
            resolve(data);
        })
    })
},
ordertable2Dao(params){
    return new Promise(function (resolve,reject) {
        dbpool.connect("SELECT ug.userId,ua.userName,ua.phoneName,ur.userOderAddress,ur.orderNo,ur.orderId,ur.goodsId,ur.goodsKind,ur.goodsImageSrc,\n" +
            "ur.goodsName,ur.goodsSize,ur.goodsColor,ur.goodsPrice,ur.goodsNum,ur.payTime,ur.isPay                           \n" +
            "FROM userregist ug JOIN userorder ur\n" +
            "ON ur.userId=ug.userId\n" +
            "JOIN useraddress ua\n" +
            "ON ur.userId=ua.userId\n" +
            "WHERE ur.isPay=1",params,(err,data)=>{
            // console.log(data);
            resolve(data);
        })
    })
},
ordertable3Dao(params){
    return new Promise(function (resolve,reject) {
        dbpool.connect("SELECT ug.userId,ua.userName,ua.phoneName,ur.userOderAddress,ur.orderNo,ur.orderId,ur.goodsId,ur.goodsKind,ur.goodsImageSrc,\n" +
            "ur.goodsName,ur.goodsSize,ur.goodsColor,ur.goodsPrice,ur.goodsNum,ur.payTime,ur.isArriva                           \n" +
            "FROM userregist ug JOIN userorder ur\n" +
            "ON ur.userId=ug.userId\n" +
            "JOIN useraddress ua\n" +
            "ON ur.userId=ua.userId\n" +
            "WHERE ur.isArriva=1",params,(err,data)=>{
            // console.log(data);
            resolve(data);
        })
    })
},
ordertable4Dao(params){
    return new Promise(function (resolve,reject) {
        dbpool.connect("SELECT ug.userId,ua.userName,ua.phoneName,ur.userOderAddress,ur.orderNo,ur.orderId,ur.goodsId,ur.goodsKind,ur.goodsImageSrc,\n" +
            "ur.goodsName,ur.goodsSize,ur.goodsColor,ur.goodsPrice,ur.goodsNum,ur.payTime,ur.isArriva                           \n" +
            "FROM userregist ug JOIN userorder ur\n" +
            "ON ur.userId=ug.userId\n" +
            "JOIN useraddress ua\n" +
            "ON ur.userId=ua.userId\n" +
            "WHERE ur.isArriva=0",params,(err,data)=>{
            // console.log(data);
            resolve(data);
        })
    })
},


//退货

orderTuiDao:function (parasm) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT\n" +
                "    returnorder.userId\n" +
                "    , returnorder.state\n" +
                "    , returnorder.orderId\n" +
                "    , userregist.userName\n" +
                "    , userorder.goodsPrice\n" +
                "    , userorder.getTime\n" +
                "FROM\n" +
                "    jd.returnorder\n" +
                "    INNER JOIN jd.userorder \n" +
                "        ON (returnorder.orderNo = userorder.orderNo)\n" +
                "    INNER JOIN jd.userregist \n" +
                "        ON (userorder.userId = userregist.userID)\n";
            dbpool.connect(sql,parasm,(err, data)=>{
                if (!err){
                    // console.log(data.length);
                    for (var i=0;i<data.length;i++){
                        if (data[i].state == 1){
                            data[i].state="待处理";
                        }else if(data[i].state == 2){
                            data[i].state="退货中";
                        }else if(data[i].state == 3){
                            data[i].state="已完成";
                        }else if(data[i].state == 4){
                            data[i].state="已拒绝";
                        }
                    }
                    resolve(data);
                } else {
                    reject(err);
                }
            })
        })
    },





//换货
    orderHuanDao:function (parasm) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT\n" +
                "    changeOrder.userId\n" +
                "    , changeOrder.state\n" +
                "    , changeOrder.orderId\n" +
                "    , userregist.userName\n" +
                "    , userorder.goodsPrice\n" +
                "    , userorder.getTime\n" +
                "FROM\n" +
                "    jd.changeOrder\n" +
                "    INNER JOIN jd.userorder \n" +
                "        ON (changeOrder.orderNo = userorder.orderNo)\n" +
                "    INNER JOIN jd.userregist \n" +
                "        ON (changeOrder.userId = userregist.userID)\n";
            dbpool.connect(sql,parasm,(err, data)=>{
                if (!err){
                    // console.log(data.length);
                    for (var i=0;i<data.length;i++){
                        if (data[i].state == 1){
                            data[i].state="待处理";
                        }else if (data[i].state == 2) {
                            data[i].state="换货中";
                        }else if (data[i].state == 3) {
                            data[i].state="已完成";
                        }else if (data[i].state == 4) {
                            data[i].state="已拒绝";
                        }
                    }
                    resolve(data);
                } else {
                    reject(err);
                }
            })
        })
    },
    ordertable10Dao:function (parasm) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT\n" +
                "    changeOrder.userId\n" +
                "    , changeOrder.state\n" +
                "    , changeOrder.orderId\n" +
                "    , userregist.userName\n" +
                "    , userorder.goodsPrice\n" +
                "    , userorder.getTime\n" +
                "FROM\n" +
                "    jd.changeOrder\n" +
                "    INNER JOIN jd.userorder \n" +
                "        ON (changeOrder.orderNo = userorder.orderNo)\n" +
                "    INNER JOIN jd.userregist \n" +
                "        ON (changeOrder.userId = userregist.userID)\n" +
                "WHERE (changeOrder.state=2);";
            dbpool.connect(sql,parasm,(err, data)=>{
                if (!err){
                    // console.log(data.length);
                    for (var i=0;i<data.length;i++){
                        if (data[i].state == 1){
                            data[i].state="待处理";
                        }else if (data[i].state == 2) {
                            data[i].state="换货中";
                        }else if (data[i].state == 3) {
                            data[i].state="已完成";
                        }else if (data[i].state == 4) {
                            data[i].state="已拒绝";
                        }
                    }
                    resolve(data);
                } else {
                    reject(err);
                }
            })
        })
    },


};
module.exports=lmjDao;