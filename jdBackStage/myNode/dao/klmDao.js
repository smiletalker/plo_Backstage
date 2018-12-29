const dbPool = require("../config/poolConfig");
const bokeModel={

    dao_boke(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("DELETE FROM bloginformation WHERE blogId=?",
                params,(err,data)=>{
                    if (!err){
                        resolve(data);
                    } else{
                        reject(err)
                    }
                })
        })
    },

    dao_activit(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("DELETE FROM activityinformation WHERE activityId=?",
                params,(err,data)=>{
                    if (!err){
                        resolve(data);
                    } else{
                        reject(err)
                    }
                })
        })
    },





    addboke(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("insert into bloginformation values(null,null,?,null,?,?)  ",params,(err,data)=>{
                if (!err){
                    console.log("插入成功");
                    resolve("插入成功");
                }else {
                    console.log("插入失败");
                    resolve(err);
                }


            })
        })
    },

    addactivit(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("insert into activityinformation values(null,?,?,?,?,null,null)  ",params,(err,data)=>{
                if (!err){
                    console.log("插入成功");
                    resolve("插入成功");
                }else {
                    console.log("插入失败");
                    resolve(err);
                }


            })
        })
    },

    editboke(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("UPDATE bloginformation SET blogTitle=?,blogLable=? WHERE blogId=?",params,(err,data)=>{
                if (!err){
                }else {
                }

            })
        })
    },


};

module.exports=bokeModel;