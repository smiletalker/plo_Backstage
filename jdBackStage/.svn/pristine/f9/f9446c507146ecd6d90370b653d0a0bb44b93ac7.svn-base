const shdDao=require("../dao/shdDao");

const shdController={
    staff: function (req, resp) {
        shdDao.staffDao([]).then((data) => {
            resp.send(data);
        })
    },
    denglu: function (req, resp) {
        shdDao.denglu([req.query.name+"",req.query.password]).then((data) => {
            resp.send(data);
            console.log(data);
        });
        console.log(req.query.name+"");
        console.log(req.query.password);
    },
    //编辑
    staff1: function (req, resp) {
        shdDao.staff1([req.query.id]).then((data) => {
            resp.send(data);
            console.log(data);
        });

    },
    //删除
    staff2: function (req, resp) {
        shdDao.staff2([req.query.id]).then((data) => {
            resp.send(data);
            console.log(data);
        });

    },
    //新增
    staff3: function (req, resp) {
        var add=JSON.parse(req.query.addtext);
        shdDao.staff3([add.password,add.name,add.tel,add.exe,]).then((data) => {
            resp.send(data);
            console.log(data);
        });



    },

};

module.exports=shdController;