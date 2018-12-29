const lyDao=require("../dao/lyDao");

var clothmp;
var allstock;
const lyController={
    searchTab:function (req,resp) {

        // console.log(req.query);req.query.productClassify,req.query.productId,req.query.productName

        lyDao.searchclothmp([])
            .then((data)=>{
            // resp.send(data);
            clothmp=data;
        })
            .catch((err)=>{
                console.log(err);
            });

        lyDao.searchstock([]).then((data)=>{
            allstock=data;
            resp.send([clothmp,allstock]);
        })
            .catch((err)=>{
                console.log(err);
            });

    },

    /*查询最大的goodsId*/
    maxid:function(req,resp){
        // console.log("jinru");
        lyDao.maxidDao([])
            .then((data)=>{
                // console.log(data);
                resp.send(data);
            })
            .catch((err)=>{

            })
    },

    /*新增数据*/
    addproduct:function (req,resp) {
        /*let cloth=[req.query.goodsId+1,req.query.getname,req.query.getdec,req.query.getsex,req.query.getclassify,req.query.getstate];
        let goodsmp=[req.query.goodsId+1,req.query.getclassify,
            req.query.getmaterial,req.query.getprice];
        let goodsstock=[req.query.goodsId+1,req.query.getclassify,
            req.query.getcolor,req.query.getsize,req.query.getstock];*/
        console.log(typeof Number(req.query.goodsId));
        let id=Number(req.query.goodsId);
        lyDao.addClothDao([id,req.query.getname,req.query.getdec,req.query.
            getsex,req.query.getclassify,req.query.getstate])
            .then((data)=>{
                console.log(data);
                // resp.send(data.changedRows);
            })
            .catch((err)=>{

            });
        lyDao.addMpDao([id,req.query.getclassify,req.query.getmaterial,req.query.getprice,])
            .then((data)=>{
            console.log(data);
                // resp.send(data.changedRows);
        })
            .catch((err)=>{

            });
        lyDao.addStockDao([id,req.query.getclassify,req.query.getcolor,req.query.getsize,req.query.getstock])
            .then((data)=>{
            console.log(data);
                // resp.send(data.changedRows);
        })
            .catch((err)=>{

            });
    },

    /*编辑*/
    editproduct:function (req,resp) {

        /*编辑衣服*/
        lyDao.editClothDao(req.query.cloth).then((data)=>{
            // console.log(data);
            // resp.send(data.changedRows);
        }).catch((err)=>{
            console.log(err);
        });
        /*编辑材质价格*/
        lyDao.editMpDao(req.query.goodsmp).then((data)=>{
                // console.log(data);
            // resp.send(data.changedRows);
            })
            .catch((err)=>{

            });

        /*编辑库存req.query.goodsstock*/
        // console.log(req.query.goodsstock);
        for(var i=0;i<req.query.goodsstock.length;i++){
            let newData=JSON.parse(req.query.goodsstock[i]);
            // console.log(typeof newData);
            lyDao.editStockDao(newData).then((data)=>{
                // console.log(data.changedRows);
                // resp.send(data.changedRows);
            })
                .catch((err)=>{

                });
        }
        }

};

module.exports=lyController;