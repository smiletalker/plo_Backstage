const dbpool=require("../config/poolConfig");
const shdDao={
    staffDao(params){
        return new Promise(function (resolve,reject) {
            dbpool.connect("SELECT adm_id,adm_password,adm_name,adm_tel,adm_attribute,adm_isNo FROM jd.administrator;",params,(err,data)=>{
                console.log(data);
                resolve(data);
            })
        })
    },
    denglu(params){
        return new Promise(function (resolve,reject) {
            dbpool.connect("SELECT * from administrator where adm_name=? and adm_password=?",params,(err,data)=>{
                console.log(data);
                resolve(data);
            })
        })
    },
    //编辑
    staff1(params){
        return new Promise(function (resolve,reject) {
            dbpool.connect("SELECT * from administrator where adm_id=? ",params,(err,data)=>{
                console.log(data);
                resolve(data);
            })
        })
    },
    //删除
    staff2(params){
        return new Promise(function (resolve,reject) {
            dbpool.connect("delete from administrator where adm_id=? ",params,(err,data)=>{
                console.log(data);
                resolve(data);
            })
        })
    },
    //删除
    staff3(params){
        return new Promise(function (resolve,reject) {
            dbpool.connect("insert into administrator values(null,?,?,?,?,1)  ",params,(err,data)=>{
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


};


module.exports=shdDao;