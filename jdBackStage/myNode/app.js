const express=require("express");

const logger=require("morgan");

const favicon=require("serve-favicon");

const bodyParser=require("body-parser");

const cookie_parser=require("cookie-parser");

const express_session=require("express-session");

const router=require("./routes/router");

const lyRoutes=require("./routes/lyRoutes");

const fjfRouter=require("./routes/fjfRouter");

const shdRouter=require("./routes/shdRouter");

const lmjRouter=require("./routes/lmjRouter");

const hjqRouter=require("./routes/hjqRouter");

const zxRouter=require("./routes/zxRouter");

const klmRouter=require("./routes/klmRouter");

const app=express();

/*=================session和cookie的配置===============================*/
app.use(cookie_parser());
app.use(express_session({
    name:"jd",
    secret:"123456",
    cookie:{
        maxAge:1000*60*60*24*30//以毫秒为单位
    },
    resave:true,//更新session-cookie失效时间
    rolling:true,
    saveUninitialized:false//对每个请求进行session和cookie设置
}));

router.use(bodyParser.urlencoded({extend:false}));
//post数据读取
app.use(bodyParser.json());

/*设置cors*/
app.use("*",(req, resp,next)=>{
    resp.header("Access-Control-Allow-Origin","*");//允许左右来源访问
    resp.header("Access-Control-Allow-Headers","X-Requested-With");//响应头设置
    resp.header("Access-Control-Allow-Method","POST,GET,PUT,DELETE,OPTIONS");//允许访问的形式
    resp.header("Content-Type","application/json;charset=utf-8");//针对post请求
    next();
});

const path=require("path");

app.use(router);
app.use(lyRoutes);
app.use(fjfRouter);
app.use(lmjRouter);
app.use(shdRouter);
app.use(hjqRouter);
app.use(zxRouter);
app.use(klmRouter);

//npm install morgan --save
app.use(logger("dev"));

app.use(express.static(__dirname+"/public"));
app.use(express.static(__dirname+"/public/page"));

//npm install serve-favicon --save
// app.use(favicon(__dirname+"/public/icon/"));

//配置ejs
app.set("views",path.join(__dirname,"views"));
app.set("view engine","ejs");

app.set("port",8888);

app.listen(8888,()=>{
    console.log("服务已启动========Node端口号"+app.get("port"));
});
