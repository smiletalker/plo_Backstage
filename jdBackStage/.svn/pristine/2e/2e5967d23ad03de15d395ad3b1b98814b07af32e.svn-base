/**
 * Created by shu on 2018/12/6.
 */
const dbPool=require("../config/poolConfig");
const ygdao={
    ygcontrodao(params){
        return new Promise(function (resolve,reject) {
            dbPool.connect("SELECT administrator.adm_id, administrator.adm_password, administrator.adm_name, administrator.adm_tel, administrator.adm_attribute, administrator.adm_isNo, permissions.permission_name FROM jd.permissions INNER JOIN jd.administrator ON (permissions.adm_id = administrator.adm_id);",
                params,(err,data)=>{
                    console.log(data);
                    resolve(data);
                })
        })
    },
};
module.exports=ygdao;