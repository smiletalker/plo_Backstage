<template>
  <div id="add">
    <div id="addbox">
      <div>
        <span>添加服饰信息</span>
        <el-button type="text" size="small" class="el-icon-close" v-on:click="closeadd"></el-button>
      </div>
      <div id="addtable">
        <!--<form>-->
        <div>
          <label>产品 I D</label>
          <input type="text" class="isnull"
                 :value="goodsId" readonly>
        </div>
        <div>
          <label>所属分类</label>
          <!--<input type="text" placeholder="请输入内容" v-model="getclassify">-->
          <select v-model="getclassify" v-on:blur="tips($event)" class="isnull">
            <option disabled value="">请选择</option>
            <option>滑雪</option>
            <option>攀岩</option>
            <option>登山</option>
            <option>徒步旅行</option>
            <option>高山跑步</option>
          </select>
          <label class="tips"></label>
        </div>
        <div>
          <label>产品名称</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getname" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>产品描述</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getdec" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>产品材质</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getmaterial" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>产品卖价</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getprice" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>产品库存</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getstock" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>产品尺寸</label>
          <select v-model="getsize" v-on:blur="tips($event)" class="isnull">
            <option disabled value="">请选择</option>
            <option>XS</option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
            <option>XXL</option>
          </select>
          <label class="tips"></label>
        </div>
        <div>
          <label>产品颜色</label>
          <input type="text" placeholder="请输入内容" class="isnull"
                 v-model="getcolor" v-on:blur="tips($event)">
          <label class="tips"></label>
        </div>
        <div>
          <label>男款女款</label>
          <select v-model="getsex" v-on:blur="tips($event)" class="isnull">
            <option disabled value="">请选择</option>
            <option>男女通用</option>
            <option>男款</option>
            <option>女款</option>
          </select>
          <label class="tips"></label>
        </div>
        <div>
          <label>产品状态</label>
          <select v-model="getstate" v-on:blur="tips($event)" class="isnull">
            <option disabled value="">请选择</option>
            <option value="1">上架</option>
            <option value="0">下架</option>
          </select>
          <label class="tips"></label>
        </div>

        <!--上传图片-->
        <div id="lookimg">
          <div id="imgbanner">
            <span>产品详情图</span>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
          </div>
          <div id="imgdetails">
            <span>产品细节图</span>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
            <div>
              <img src="../../static/images/snow_f1.png" alt="">
              <input type="file"/>
            </div>
          </div>
        </div>
        <!--取消、保存-->
        <div id="btn">
          <!--取消-->
          <mybtn v-on:btnClick="cancel" btn-text="取消"></mybtn>
          <!--保存-->
          <mybtn v-on:btnClick="save" btn-text="保存"></mybtn>
        </div>
        <!--</form>-->
      </div>
    </div>
  </div>
</template>

<script>
  import mybtn from './common/button'

  export default {
    name: "myproductadd",
    data () {
      return {
        goodsId:'',
        getclassify:'',//得到产品分类
        getname:'',//名称
        getdec:'',//描述
        getmaterial:'',//材质
        getprice:'',//卖价
        getstock:'',//库存
        getsize:'',//尺寸
        getcolor:'',//颜色
        getsex:'',//男女款
        getstate:''//状态
      }
    },
    methods:{
      closeadd () { //关闭弹框
        this.$emit('showadd');
      },
      getMaxId (getid) {
        // console.log(getid);
        this.goodsId=getid;
        console.log(getid);
      },
      save () {
        let that=this;
        if (that.getclassify != "" && that.getname != ""
          && that.getdec != "" && that.getmaterial != ""
          && that.getprice != "" && that.getstock != ""
          && that.getsize != "" && that.getcolor != ""
          && that.getsex != "" && that.getstate != ""){
          /*确定是否保存的提示*/
          this.$confirm('确定提交数据?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.$axios.get('/api/addProduct.do',{params:{
                goodsId:that.goodsId,
                getgoodskind:"3",
                getclassify:that.getclassify,
                getname:that.getname,
                getdec:that.getdec,
                getmaterial:that.getmaterial,
                getprice:that.getprice,
                getstock:that.getstock,
                getsize:that.getsize,
                getcolor:that.getcolor,
                getsex:that.getsex,
                getstate:that.getstate

              }}).then((data)=>{
              /*数据填写成功的提示*/
              if (resp.data.length != 0) {
                that.$message({
                  showClose: true,
                  message: '数据添加成功',
                  type: 'success'
                });
              }
              /*that.$message({
                showClose: true,
                message: '数据添加成功',
                type: 'success'
              });*/
            });
            this.$emit('showadd');
          })
        }else {
          /*信息未填完的提示*/
          that.warn();
        }
      },
      warn() {
        this.$message({
          showClose: true,
          message: '请将信息填写完整',
          type: 'warning'
        });
      },
      /*succcess() {
        this.$message({
          showClose: true,
          message: '数据添加成功',
          type: 'success'
        });
      },*/
      cancel() {
        this.$confirm('信息未填完, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$emit('showadd');
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消操作，请继续将信息填写完整'
          });
        });
      },
      tips (event) {
        /*获取当前元素-----event.target*/
        // console.log(event.target);
        var el=event.currentTarget;
        // console.log(el.nextElementSibling);
        if (el.value == ""){
          el.nextElementSibling.innerHTML="请输入内容";
          el.nextElementSibling.style.color="red";
        } else {
          el.nextElementSibling.innerHTML="";
        }
      }
    },
    components:{
      mybtn:mybtn
    }
  }
</script>

<style scoped>
  #add{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 1780px;
    z-index: 100;
    padding: 30px 0px;
    background-color: rgba(0, 0, 0, 0.73);
  }
  #addbox{
    width: 96%;
    margin: 0 2%;
    padding-bottom: 60px;
    background-color: white;
    border: 1px solid white;
    height: 1730px;
  }
  #addbox>div:first-child{
    width: 100%;
    margin-bottom: 100px;
  }
  #addbox>div:first-child>span{
    font-size: 18px;
    float: left;
    height: 60px;
    padding-left: 5%;
    line-height: 100px;
  }
  .el-icon-close{
    color: #000000;
    font-size: 18px;
    float: right;
    margin-right: 5%;
    line-height: 80px;
  }
  #addtable{
    /*background-color: rgba(255, 192, 203, 0.28);*/
    width: 80%;
    margin: 0 10%;
    height: 700px;
  }
  #addtable>div:nth-of-type(1),
  #addtable>div:nth-of-type(2),
  #addtable>div:nth-of-type(3),
  #addtable>div:nth-of-type(4),
  #addtable>div:nth-of-type(5),
  #addtable>div:nth-of-type(6),
  #addtable>div:nth-of-type(7),
  #addtable>div:nth-of-type(8),
  #addtable>div:nth-of-type(9),
  #addtable>div:nth-of-type(10) ,
  #addtable>div:nth-of-type(11) {
    display: inline-block;
    margin: 0 0 30px 20%;
    /*outline: 1px solid yellow;*/
    width: 80%;
  }
  label{
    font-size: 14px;
    letter-spacing: 2px;
    margin-right: 3%;
  }
  input{
    height: 35px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
    margin-right: 3%;
    width: 50%;
  }
  input:focus{
    outline: none;
  }
  select{
    width: 54%;
    height: 35px;
    margin-right: 5%;
    letter-spacing: 2px;
    padding: 0 15px;
  }
  #lookimg{
    width: 100%;
  }
  #imgbanner,
  #imgdetails{
    width: 100%;
    margin-top: 3%;
  }
  #lookimg>div>span{
    font-size: 18px;
    float: left;
    width: 97%;
    height: 60px;
    text-align: left;
    padding-left: 3%;
    line-height: 60px;

  }
  #imgbanner>div,
  #imgdetails>div{
    width: 17%;
    /*height: 320px;*/
    border: 1px solid gainsboro;
    /*float: left;*/
    display: inline-block;
    margin: 1% 3%;
  }
  #imgbanner>div>img,
  #imgdetails>div>img{
    width: 100%;
  }
  input[type="file"]{
    width: 77%;
    opacity: 0.5;
    margin: 10px 2%;
    border: none;
  }
  input[type="file"]:focus{
    outline: none;
  }
  /*取消、保存按钮*/
  #btn{
    display: inline-block;
    margin-left: 85%;
    margin-top: 40px;
  }
</style>
