const dbpool=require("../config/poolConfig");
const fjfDao={
    juristDao(params){
        let p1=new Promise(function (resolve,reject) {
            dbpool.connect("SELECT administrator.adm_id,administrator.adm_name,administrator.adm_tel,administrator.adm_attribute,permissions.permission_name,administrator.adm_isNo,\n" +
                "GROUP_CONCAT(permissions.permission_name SEPARATOR ',')\n" +
                "permissionName FROM administrator \n" +
                "JOIN permissions ON\n" +
                "administrator.adm_id=permissions.adm_id\n" +
                "GROUP BY administrator.adm_id", params, (err, data) => {
                if(!err){
                      for(var m=0;m<data.length;m++){
                      if(data[m].adm_attribute=="2"||data[m].adm_isNo=="1"){
                          data[m].adm_attribute="普通管理员";
                          data[m].adm_isNo="启用";
                      }else if(data[m].adm_attribute=="1"||data[m].adm_isNo=="2"){
                          data[m].adm_attribute="超级管理员";
                          data[m].adm_isNo="禁用"
                      }
                  }
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },
    jurist_up(params){
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("DELETE FROM administrator WHERE administrator.adm_id=?",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jurist_alls(params){
        console.log(params);
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("DELETE from permissions where adm_id=?",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jurist_all(params){
        console.log(params);
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("insert into permissions values(?,?)",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jurist_allIsNO(params){
        console.log(params);
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("update  administrator set adm_isNo=? where adm_id=?",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jurist_save(params){
        console.log(params);
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("insert into administrator values(NULL,'123456',?,?,?,1)",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jurist_saveAll(params){
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("insert into permissions values(?,?);",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },

    jur_change(params){
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("\n" +
                "SELECT * FROM (SELECT administrator.adm_id,administrator.adm_name,administrator.adm_tel,administrator.adm_attribute,permissions.permission_name,administrator.adm_isNo,\n" +
                "GROUP_CONCAT(permissions.permission_name SEPARATOR ',')\n" +
                "permissionName FROM administrator \n" +
                "LEFT JOIN permissions ON\n" +
                "administrator.adm_id=permissions.adm_id\n" +
                "GROUP BY administrator.adm_id) jur_all WHERE jur_all.adm_name=?",params,(err,data)=>{
                if(!err){
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },
    login(params){
        let p1=new Promise(function (resolve,reject){
            dbpool.connect("SELECT * FROM (SELECT administrator.adm_id,administrator.adm_name,administrator.adm_tel,\n" +
                "administrator.adm_password,\n" +
                "administrator.adm_attribute,permissions.permission_name,administrator.adm_isNo,\n" +
                "GROUP_CONCAT(permissions.permission_name SEPARATOR ',')\n" +
                "permissionName FROM administrator \n" +
                "JOIN permissions ON\n" +
                "administrator.adm_id=permissions.adm_id\n" +
                "GROUP BY administrator.adm_id) adm_jur\n" +
                "WHERE adm_jur.adm_name=? AND adm_jur.adm_password=?\n",params,(err,data)=>{
                if(!err){
                    for(var m=0;m<data.length;m++){
                        if(data[m].adm_attribute=="2"||data[m].adm_isNo=="1"){
                            data[m].adm_attribute="普通管理员";
                            data[m].adm_isNo="启用";
                        }else if(data[m].adm_attribute=="1"||data[m].adm_isNo=="2"){
                            data[m].adm_attribute="超级管理员";
                            data[m].adm_isNo="禁用"
                        }
                    }
                    resolve(data);
                }else{
                    reject(err);
                }
            });
        });
        return p1;
    },
};
module.exports=fjfDao;