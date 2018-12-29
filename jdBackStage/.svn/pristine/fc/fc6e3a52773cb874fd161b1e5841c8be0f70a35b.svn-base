const dbPool=require("../config/poolConfig");
const lyDao={
    /*
    return new Promise((resolve,reject)=>{
            let sql="";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    */
    searchclothmp:function (parasm) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT ct.goodsId,ct.goodsKind,ct.exerciseName,ct.goodsname,\n" +
                "ct.des,ct.sex,ct.state,gd.material,gd.price,MIN(gs.num) AS num\n" +
                "FROM clothes ct JOIN goodsmp gd\n" +
                "ON ct.goodsId=gd.goodsId AND ct.goodsKind=gd.goodsKindId AND ct.exerciseName=gd.exerciseName\n" +
                "JOIN goodsstock gs\n" +
                "ON ct.goodsId=gs.goodsId AND ct.goodsKind=gs.goodsKindId AND ct.exerciseName=gs.exerciseName\n" +
                "GROUP BY  gs.goodsId \n";

            dbPool.connect(sql,parasm,(err, data)=>{
                if (!err){
                    // console.log(data.length);
                    for (var i=0;i<data.length;i++){
                        if (data[i].state == 1){
                            data[i].state="上架";

                        } else {
                            data[i].state="下架"
                        }
                        if (data[i].num <= 10){
                            data[i].num="库存紧张";

                        } else {
                            data[i].num="库存充足"
                        }
                    }
                    resolve(data);
                } else {
                    reject(err);
                }
            })
        })
    },
    searchstock:function (parasm) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT ct.goodsId,ct.goodsKind,ct.exerciseName,ct.goodsname,ct.des,ct.sex,ct.state,gd.material,gd.price,st.color,st.size,st.num\n" +
                "FROM clothes ct JOIN goodsmp gd\n" +
                "ON ct.goodsId=gd.goodsId AND ct.goodsKind=gd.goodsKindId AND ct.exerciseName=gd.exerciseName\n" +
                "JOIN goodsstock st\n" +
                "ON ct.goodsId=st.goodsId AND ct.goodsKind=st.goodsKindId AND ct.exerciseName=st.exerciseName\n";
            dbPool.connect(sql,parasm,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    addClothDao:function (params) {
        return new Promise((resolve,reject)=>{
            console.log(params);
            return new Promise((resolve,reject)=>{
                let sql="INSERT INTO clothes VALUES(?,3,?,?,?,?,?)";
                dbPool.connect(sql,params,(err, data)=>{
                    if(!err){
                        resolve(data);
                    }else{
                        reject(err);
                    }
                })
            })
        })
    },
    addMpDao:function (params) {
        return new Promise((resolve,reject)=>{
            console.log(params);
            return new Promise((resolve,reject)=>{
                let sql="INSERT INTO goodsmp VALUES(3,?,?,?,?,'0.0000');";
                dbPool.connect(sql,params,(err, data)=>{
                    if(!err){
                        resolve(data);
                    }else{
                        reject(err);
                    }
                })
            })
        })
    },
    addStockDao:function (params) {
        return new Promise((resolve,reject)=>{
            console.log(params);
            return new Promise((resolve,reject)=>{
                let sql="INSERT INTO goodsstock VALUES(3,?,?,?,?,?);";
                dbPool.connect(sql,params,(err, data)=>{
                    if(!err){
                        resolve(data);
                    }else{
                        reject(err);
                    }
                })
            })
        })
    },
    maxidDao:function (params) {
        return new Promise((resolve,reject)=>{
            let sql="SELECT MAX(goodsId) AS maxId FROM clothes";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    // console.log(data);
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    editClothDao:function (params) {
        return new Promise((resolve,reject)=>{
            let sql="UPDATE clothes SET goodsname=?,des=?,sex=?,state=? WHERE goodsId=? ";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    editMpDao:function (params) {
        // console.log(params);
        return new Promise((resolve,reject)=>{
            let sql="UPDATE goodsmp SET material=?,price=? WHERE goodsId=? AND goodsKindId=3";
            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },
    editStockDao:function (params) {
        return new Promise((resolve,reject)=>{
            let sql="UPDATE goodsstock SET num=? WHERE size=? AND color=? AND goodsId=? AND exerciseName=? AND goodsKindId=3 ;";

            dbPool.connect(sql,params,(err, data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            })
        })
    },

};
module.exports=lyDao;