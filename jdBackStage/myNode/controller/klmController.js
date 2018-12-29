const dbpool=require("../config/poolconfig");
const bokeDao=require("../dao/klmDao");
const acController={
    getAllactivit(req,resp){
        dbpool.connect("SELECT activityId,activityTitle,activityContent,endDate,allNum FROM activityinformation",[],(err,data)=>{
            resp.send(data)
        })
    },
    getAllboke(req,resp){
        dbpool.connect("SELECT blogId,blogTitle,blogDate,blogLable FROM bloginformation ",[],(err,data)=>{
            resp.send(data)
        })
    },

    delBoke(req,resp){
        let id=req.query.id;
        console.log(id);
        bokeDao.dao_boke([id])
            .then(function (data) {
                resp.send(data);
            })
            .catch(function (err) {
                resp.send(err)
            })
    },

    delactivit(req,resp){
        let id=req.query.id;
        console.log(id);
        bokeDao.dao_activit([id])
            .then(function (data) {
                resp.send(data);
            })
            .catch(function (err) {
                resp.send(err)
            })
    },


    addBoke: function (req, resp) {
        var add=JSON.parse(req.query.addtext);
        bokeDao.addboke([add.blogTitle,add.blogDate,add.blogLable]).then((data) => {
            resp.send(data);
            console.log(data);
        });

    },

    addactivit: function (req, resp) {
        var add=JSON.parse(req.query.addtext);
        bokeDao.addactivit([add.activityTitle,add.activityContent,add.endDate,add.allNum]).then((data) => {
            resp.send(data);
            console.log(data);
        });

    },

    editBoke: function (req, resp) {
        let id=req.query.id;
        console.log(id);
        var add=JSON.parse(req.query.addtext);
        bokeDao.editboke([add.blogTitle,add.blogLable,id]).then((data) => {
            resp.send(data);
            console.log(data);
        });

    },


};
module.exports=acController;