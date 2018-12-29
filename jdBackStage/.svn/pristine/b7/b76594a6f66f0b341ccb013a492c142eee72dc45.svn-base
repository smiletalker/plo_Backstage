const dbpool=require("../config/poolConfig");
const fjfDao=require("../dao/fjfDao");

const fjfController={
    jurist(req,resp){
        fjfDao.juristDao([]).then(function (result) {
            resp.send(result);
        });
    },

    jurist_up(req,resp){
        let row=req.body.row;
        console.log(row);
        fjfDao.jurist_up([row]).then(function (result) {
            resp.send(result);
        })
    },

    jurist_all(req,resp){
        let array=req.body.array;
        let jur_id=req.body.jurs_id;
        console.log(array);
        console.log(jur_id);
        fjfDao.jurist_alls([jur_id]).then(function () {
            for(let j=1;j<array.length;j++){
                fjfDao.jurist_all([jur_id,array[j]]);//更改权限内容
            }
        }).then(function () {
            fjfDao.jurist_allIsNO([array[0],jur_id]);//更改权限启用/禁用状态
        }).then(function (result) {
            console.log("success");
        });
    },
    jurist_save(req,resp){
        let jur_names=req.body.jur_names;
        let jur_tels=req.body.jur_tels;
        let jur_shuxins=req.body.jur_shuxins;
        if(jur_shuxins=="普通管理员"){
            jur_shuxins=2;
        }else if(jur_shuxins=="超级管理员"){
            jur_shuxins=1;
        }
        fjfDao.jurist_save([jur_names,jur_tels,jur_shuxins]).then(function () {
            console.log("success1");
        })
    },
    jurist_saveAll(req,resp){
        let jur_id=req.body.jur_id;
        let jur_selects=req.body.jur_selects;
        fjfDao.jurist_saveAll([jur_id,jur_selects]).then(function () {
            console.log("success2");
        })
    },
    jur_change(req,resp){
        let jur_change=req.body.jur_change;
        console.log(jur_change);
        fjfDao.jur_change([jur_change]).then(function (result) {
            console.log("success3");
            resp.send(result);
        });
    },
    login(req,resp){
        let username_jur=req.body.username_jur;
        let password_jur=req.body.password_jur;
        fjfDao.login([username_jur,password_jur]).then(function (result) {
            if(result.length==0){
                console.log("请检查用户和密码");
                resp.send("输入错误，请检查用户和密码")
            }else{
                resp.send(result);
            }
        });
    }
};

module.exports=fjfController;