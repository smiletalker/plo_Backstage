const lmjDao=require("../dao/lmjDao");
const lmjController= {
    ordertable1: function (req, resp) {
        lmjDao.ordertable1Dao([]).then((data) => {
            resp.send(data);
        })
    },
    ordertable2: function (req, resp) {
        lmjDao.ordertable2Dao([]).then((data) => {
            resp.send(data);
        })
    },
    ordertable3: function (req, resp) {
        lmjDao.ordertable3Dao([]).then((data) => {
            resp.send(data);
        })
    },
    ordertable4: function (req, resp) {
        lmjDao.ordertable4Dao([]).then((data) => {
            resp.send(data);
        })
    },

    //退货
    orderTui: function (req, resp) {
        lmjDao.orderTuiDao([])
            .then((data) => {
                resp.send(data);
            })
            .catch((err) => {
                console.log(err);
            })
    },



    //换货
    orderHuan: function (req, resp) {
        lmjDao.orderHuanDao([])
            .then((data) => {
                resp.send(data);
            })
            .catch((err) => {
                console.log(err);
            })
    },


};






module.exports=lmjController;