<template>
  <!--查看弹框-->
  <div id="look">
    <div>
      <span class="boxtitle"></span>
      <!--<el-button type="text" size="small" class="el-icon-edit-outline" v-on:click="editcurrent"></el-button>-->
      <el-button type="text" size="small" class="el-icon-close" v-on:click="closelook"></el-button>
    </div>
    <div id="productbox">
      <!--表格-->
      <!--<table>
        <tr>
          <th width="8%">所属分类</th>
          <th width="13%">名称</th>
          <th width="15.5%">描述</th>
          <th width="10%">材质</th>
          <th width="10%">男款/女款</th>
          <th width="10%">卖价</th>
          <th width="8%">尺寸</th>
          <th width="8%">颜色</th>
          <th width="8%">库存</th>
          <th width="8%">状态</th>
        </tr>
        <tr v-for="item in stock">&lt;!&ndash;v-for="item in filterstock"&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">{{clothmp.exerciseName}}</td>
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">花和鸟印花滑雪服</span>
            &lt;!&ndash;<myinput type="text" :value="clothmp.goodsname" width="width:75%" v-show="isshow"></myinput>&ndash;&gt;
            <textarea :value="item.goodsname"
                      cols="18" rows="3" v-show="isshow" placeholder="请输入内容...">
            </textarea>
          </td>
          &lt;!&ndash;描述&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">毛领设计，美观保暖。抽绳设计，便于收腰</span>
            &lt;!&ndash;<myinput type="text"
                     width="width:75%"></myinput>&ndash;&gt;
            <textarea :value="item.des"
                      cols="25" rows="3" v-show="isshow" placeholder="请输入内容...">
            </textarea>
          </td>
          &lt;!&ndash;材质&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">晴纶棉</span>
            <myinput type="text" :value="item.material" width="width:60%" v-show="isshow"></myinput>
          </td>
          &lt;!&ndash;男女通用&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId"  >
            <span v-show="tdshow">男女通用</span>
            &lt;!&ndash;<myelect v-bind:parentoption="sexoption"></myelect>&ndash;&gt;
            <select v-model="getsex" v-show="isshow">
              <option disabled value="">请选择</option>
              <option>男女通用</option>
              <option>男款</option>
              <option>女款</option>
            </select>
          </td>
          &lt;!&ndash;卖价&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">1999.00</span>
            <myinput type="text" :value="item.price" width="width:60%" v-show="isshow"></myinput>
          </td>

          &lt;!&ndash;尺寸颜色库存&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">{{item.size}}</td>
          <td v-if="item.goodsId === clothmp.goodsId">{{item.color}}</td>
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">320</span>
            <myinput type="text" :value="item.num" width="width:60%" v-show="isshow"></myinput>
          </td>

          &lt;!&ndash;上架&ndash;&gt;
          <td v-if="item.goodsId === clothmp.goodsId">
            <span v-show="tdshow">上架</span>
            &lt;!&ndash;<myelect v-bind:parentoption="option"></myelect>&ndash;&gt;
            <select v-model="getstate" v-show="isshow">
              <option disabled value="">请选择</option>
              <option>上架</option>
              <option>下架</option>
            </select>
          </td>
        </tr>

        &lt;!&ndash;<tr>
          <td>S</td>
          <td>黑色</td>
          <td>
            <span v-show="tdshow">345</span>
            <myinput type="text" value="345" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>M</td>
          <td>白色</td>
          <td>
            <span v-show="tdshow">241</span>
            <myinput type="text" value="241" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>M</td>
          <td>黑色</td>
          <td>
            <span v-show="tdshow">365</span>
            <myinput type="text" value="365" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>L</td>
          <td>白色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>L</td>
          <td>黑色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>XL</td>
          <td>白色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>XL</td>
          <td>黑色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>XXL</td>
          <td>白色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>
        <tr>
          <td>XXL</td>
          <td>黑色</td>
          <td>
            <span v-show="tdshow">152</span>
            <myinput type="text" value="152" width="width:60%" v-show="isshow"></myinput>
          </td>
        </tr>&ndash;&gt;
      </table>-->
      <table>
        <tr>
          <th width="3%">#</th>
          <th width="8%">所属分类</th>
          <th width="13%">名称</th>
          <th width="13%">描述</th>
          <th width="10%">材质</th>
          <th width="10%">男款/女款</th>
          <th width="10%">卖价</th>
          <th width="8%">尺寸</th>
          <th width="8%">颜色</th>
          <th width="8%">库存</th>
          <th width="8%">状态</th>
        </tr>
        <tr><!--v-for="item in filterstock"-->
          <td class="getId">{{clothmp.goodsId}}</td>
          <td class="getExeNme">{{clothmp.exerciseName}}</td>
          <td>
            <span v-show="tdshow">{{clothmp.goodsname}}</span>
            <!--<myinput type="text" :value="clothmp.goodsname" width="width:75%" v-show="isshow"></myinput>-->
            <textarea :value="clothmp.goodsname"
                      cols="18" rows="3" v-show="isshow" placeholder="请输入内容..." class="getValue">
            </textarea>
          </td>
          <!--描述-->
          <td>
            <span v-show="tdshow">{{clothmp.des}}</span>
            <textarea :value="clothmp.des"
                      cols="25" rows="3" v-show="isshow" placeholder="请输入内容..." class="getValue">
            </textarea>
          </td>
          <!--材质-->
          <td>
            <span v-show="tdshow">{{clothmp.material}}</span>
            <input type="text" :value="clothmp.material" v-show="isshow" class="getValue">
          </td>
          <!--男女通用-->
          <td>
            <span v-show="tdshow">{{clothmp.sex}}</span>
            <select v-model="getsex" v-show="isshow" class="getValue">
              <option disabled value="">请选择</option>
              <option>男女通用</option>
              <option>男款</option>
              <option>女款</option>
            </select>
          </td>
          <!--卖价-->
          <td>
            <span v-show="tdshow">{{clothmp.price}}</span>
            <input type="text" :value="clothmp.price" v-show="isshow" class="getValue">
          </td>

          <!--尺寸-->
          <td>
            <span v-for="item in stock" v-if="item.goodsId === clothmp.goodsId" class="tdspan getStockSize">
              {{item.size}}
            </span>
          </td>
          <!--颜色-->
          <td>
            <span v-for="item in stock" v-if="item.goodsId === clothmp.goodsId" class="tdspan getStockColor">
              {{item.color}}
            </span>
          </td>
          <!--库存-->
          <td>
            <span v-for="item in stock" v-if="item.goodsId === clothmp.goodsId" class="tdspan">
              <span v-show="tdshow">{{item.num}}</span>
              <input type="text" :value="item.num" v-show="isshow" class="getNum">
            </span>
          </td>

          <!--上架-->
          <td>
            <span v-show="tdshow">{{clothmp.state}}</span>
            <select v-model="getstate" v-show="isshow" class="getValue">
              <option disabled value="">请选择</option>
              <option value="1">上架</option>
              <option value="0">下架</option>
            </select>
          </td>
        </tr>

      </table>
      <!--上传图片-->
      <div id="lookimg">

        <div id="imgbanner">
          <span>产品详情图</span>
          <div>
            <img :src="'/api/'+imagesInfo.src1" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src2" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src3" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src4" alt="">
            <input type="file" v-show="isshow"/>
          </div>
        </div>

        <div id="imgdetails">
          <span>产品细节图</span>
          <div>
            <img :src="'/api/'+imagesInfo.src5" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src6" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src7" alt="">
            <input type="file" v-show="isshow"/>
          </div>
          <div>
            <img :src="'/api/'+imagesInfo.src8" alt="">
            <input type="file" v-show="isshow"/>
          </div>
        </div>
        <!--==========================上传图片组件===============================-->
        <div class="bannerUpload">
          <div class="upload">
            <div class="upload_warp">
              <div class="upload_warp_left" @click="fileClick">
                <img src="../../../static/images/upload.png">
              </div>
              <div class="upload_warp_right" @drop="drop($event)" @dragenter="dragenter($event)" @dragover="dragover($event)">
                拖拽至此处上传
              </div>
            </div>
            <div class="upload_warp_text">
              选中{{imgList.length}}张文件，共{{bytesToSize(this.size)}}

              <div class="startUp">
                从第
                <select name="select" id="select">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                </select>张开始上传
                <span id="upload_confirm" v-show="imgList.length!=0" @click="upload_confirm">上传</span>
              </div>


            </div>
            <input @change="fileChange($event)" type="file" id="upload_file1" multiple style="display: none"/>
            <div class="upload_warp_img" v-show="imgList.length!=0">
              <div class="upload_warp_img_div" v-for="(item,index) of imgList">
                <div class="upload_warp_img_div_top">
                  <div class="upload_warp_img_div_text">
                    {{item.file.name}}
                  </div>
                  <img src="../../../static/images/del.png" class="upload_warp_img_div_del" @click="fileDel(index)">
                </div>
                <img :src="item.file.src">
              </div>
            </div>
          </div>
        </div>
        <!--====================================================================-->
      </div>
      <!--取消、保存-->
      <div id="btn" v-show="isshow">
        <!--取消-->
        <mybtn v-on:btnClick="cancel" btn-text="取消"></mybtn>
        <!--保存-->
        <mybtn v-on:btnClick="save" btn-text="保存"></mybtn>
      </div>
    </div>
  </div>

</template>

<script>
  import mybtn from './button'
  import  myinput from './input'
  import  myelect from './singleSelection'

  export default {
    name: "productlook",
    data() {
      return {
        multipleSelection: [],
        sexoption:[
          {
            value: '选项1',
            label: '男女通用'
          },{
            value: '选项2',
            label: '男款'
          },{
            value: '选项3',
            label: '女款'
          },
        ],
        option:[
          {
            value:"选项1",
            label:"男女通用"
          },{
            value:"选项2",
            label:"男款"
          },{
            value:"选项3",
            label:"女款"
          },
        ],
        isshow:false,/*编辑模式*/
        tdshow:true,/*表格文本内容*/
        clothmp:'',
        stock:'',
        getsex:'',
        getstate:'',
        imagesInfo:[],//图片信息
        imgList: [],//图片上传
        size: 0,//图片上传
        goodsId:'',
        goodsKindL:''
      }
    },
    components:{
      mybtn:mybtn,
      myinput:myinput,
      myelect:myelect
    },
    methods:{
      closelook () { //关闭弹框
        this.$emit('closelook');
        // console.log("zizujian");
        this.isshow=false;
        this.tdshow=true;
        var boxtitle=document.getElementsByClassName("boxtitle")[0];
        boxtitle.innerHTML="查看服饰信息";
      },
      lookmsg (r,s,v) {
        this.clothmp=r;
        this.stock=s;
        var boxtitle=document.getElementsByClassName("boxtitle")[0];
        boxtitle.innerHTML="查看服饰信息";
      },
      editstate (r,s,v) {//显示编辑状态
        this.isshow=true;
        this.tdshow=false;
        this.clothmp=r;
        this.stock=s;
        var boxtitle=document.getElementsByClassName("boxtitle")[0];
        boxtitle.innerHTML=v;
      },
      cancel () {
        this.$confirm('信息未保存, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$emit('closelook');
          this.isshow=false;
          this.tdshow=true;
          var boxtitle=document.getElementsByClassName("boxtitle")[0];
          boxtitle.innerHTML="查看服饰信息";
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消操作，请继续将信息填写完整'
          });
        });
      },
      save () {
        var getId=document.getElementsByClassName("getId")[0];
        var getExeNme=document.getElementsByClassName("getExeNme")[0];
        var getValues=document.getElementsByClassName("getValue");
        var getStockSize=document.getElementsByClassName("getStockSize");
        var getStockColor=document.getElementsByClassName("getStockColor");
        var getNum=document.getElementsByClassName("getNum");

        /*getId.innerText*/
        var setCloth=[];
        var setGoodsMp=[];
        var setGoodsStock=[];

        for(var i=0;i<getValues.length;i++){

          /*0 1 3 5-----cloth
          * 2 4----- 材质价格*/
          if (i == 0 || i == 1 || i == 3 || i ==5){
            setCloth.push(getValues[i].value);
          }else {
            setGoodsMp.push(getValues[i].value);
          }
        }
        for (var j=0;j<(getStockSize.length);j++){

          setGoodsStock[j]=[getNum[j].value,getStockSize[j].innerText,getStockColor[j].innerText,getId.innerText,getExeNme.innerText];
        }
        setCloth.push(getId.innerText);
        setGoodsMp.push(getId.innerText);
        /*console.log(setCloth);
        console.log(setGoodsMp);
        console.log(setGoodsStock);*/
        let that=this;
        /*确定是否保存的提示*/
        this.$confirm('确定修改数据?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$axios.get('/api/editProduct.do',{params:{
              cloth:setCloth,
              goodsmp:setGoodsMp,
              goodsstock:setGoodsStock
            }}).then((data)=>{
            /*数据填写成功的提示*/
            if (resp.data.length != 0) {
              that.$message({
                showClose: true,
                message: '数据修改成功',
                type: 'success'
              });
            }
          });
          /*确认保存后的操作*/
          this.$emit('closelook');
          this.isshow=false;
          this.tdshow=true;
          var boxtitle=document.getElementsByClassName("boxtitle")[0];
          boxtitle.innerHTML="查看服饰信息";
        })
      },

      /*-------------------------请求图片路径------------------------------------------*/
      getImages:function(info){
        let that=this;
        /*发送请求获取指定id用户的订单列表数据*/
        that.goodsId=info.goodsId;
        that.goodsKind=info.goodsKind;
        this.$axios.get("/api/getImages.do",{params:{goodsId:info.goodsId,goodsKind:info.goodsKind}})
          .then(function (resp){
            console.log( typeof resp.data[0].src1);
            resp.data[0].src1=resp.data[0].src1.substring(3);
            resp.data[0].src2=resp.data[0].src2.substring(3);
            resp.data[0].src3=resp.data[0].src3.substring(3);
            resp.data[0].src4=resp.data[0].src4.substring(3);
            resp.data[0].src5=resp.data[0].src5.substring(3);
            resp.data[0].src6=resp.data[0].src6.substring(3);
            resp.data[0].src7=resp.data[0].src7.substring(3);
            resp.data[0].src8=resp.data[0].src8.substring(3);
           console.log( resp.data[0]);
           that.imagesInfo=resp.data[0];
        })
      },

      /*-------------------------------------banner上传组件逻辑-----------------------------------------*/
          fileClick(){
            document.getElementById('upload_file1').click()
          },
          fileChange(el){
            if (!el.target.files[0].size) return;
            this.fileList(el.target.files);
            el.target.value = ''
          },
          fileList(files){
            for (let i = 0; i < files.length; i++) {
              this.fileAdd(files[i]);
            }
          },
          fileAdd(file){
            this.size = this.size + file.size;//总大小
            let reader = new FileReader();
            reader.vue = this;
            reader.readAsDataURL(file);
            reader.onload = function () {
              file.src = this.result;
              this.vue.imgList.push({
                file
              });
            }
//            console.log(this.imgList);
//            console.log(this.imgList[0].file.name);
//            console.log(this.imgList[0].file.src);
          },
          fileDel(index){
            this.size = this.size - this.imgList[index].file.size;//总大小
            this.imgList.splice(index, 1);
          },
          bytesToSize(bytes){
            if (bytes === 0) return '0 B';
            let k = 1000, // or 1024
              sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
              i = Math.floor(Math.log(bytes) / Math.log(k));
            return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
          },
          dragenter(el){
            el.stopPropagation();
            el.preventDefault();
          },
          dragover(el){
            el.stopPropagation();
            el.preventDefault();
          },
          drop(el){
            el.stopPropagation();
            el.preventDefault();
            this.fileList(el.dataTransfer.files);
          },
          upload_confirm(){
              //确定上传  向后台发送图片base54数据

            let that=this;
            /*向node发起请求*/
//            this.$axios.get("/api/getOrder.do",{params:{userID:info.userID}})
//          .then(function (resp){
//              console.log(resp.data);
//              that.orderInfo=resp.data;
//            })
//          }
              console.log(this.imgList);
              for(var i=0;i<this.size;i++){
//                let imgname=this.imgList[i].file.name;
//                let imgsrc=this.imgList[i].file.src;
//                console.log(imgname);
//                console.log(imgsrc);

////                this.$axios({
//                method:"post",
//                  url:"/api/haveUser",
//                  data:{
//                  name:this.name,
//                    password:this.password
//                }
//              })  '/api/saveImg.do',{params:{imgName:imgname,imgSrc:imgsrc}}

//                this.$axios({
//                  method:'post',
//                  url:'/api/saveImg.do',
//                  data:{
//                    imgName:this.imgname,
//                    imgSrc:this.imgsrc
//                  }
//                })
//                  .then(function(resp){
//                      console.log(resp.data);
//                  })
//              }
//
           this.$axios.get("/api/changeImg.do",{params:{goodsId:this.goodsId,goodsKind:this.goodsKind}})
          .then(function (resp){
              console.log(resp.data);
//              that.orderInfo=resp.data;
            })
          }
          }
        },
    props:[]
  }
</script>

<style scoped>
  *{
    margin: 0;
    padding: 0;
  }
  #look{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 100;
    padding: 30px 0px;
    background-color: rgba(0, 0, 0, 0.73);
  }
  #look>div:first-child{
    width: 100%;
    /*outline: 1px solid green;*/
  }
  #look>div>span{
    font-size: 18px;
    float: left;
    height: 60px;
    padding-left: 5%;
    line-height: 60px;
  }
  /*.el-icon-edit-outline{
    color: #b7b7b7;
    font-size: 14px;
    float: left;
    margin-left: 1.5%;
    line-height: 60px;
  }*/
  .el-icon-close{
    color: #000000;
    font-size: 18px;
    float: right;
    margin-right: 5%;
    line-height: 60px;
  }
  #productbox{
    width: 96%;
    margin: 0 2%;
    padding-bottom: 60px;
    background-color: white;
  }
  table{
    width: 96%;
    margin: 0 2%;
    text-align: left;
    /*outline: 1px solid blue;*/
  }
  table th{
    padding: 5px 0 15px 1%;
    font-size: 15px;
    border-bottom: 1px solid gainsboro;
  }
  table td{
    padding: 0.5% 0 0.5% 0.5%;
    font-size: 14px;
    border-bottom: 1px solid gainsboro;
  }
  table td>span{
    font-size: 14px;
  }
  #lookimg{
    width: 100%;
  }
  #imgbanner,
  #imgdetails{
    width: 100%;
    /*height: 450px;*/
    margin-top: 3%;
    /*outline: 1px solid green;*/
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
    width: 80%;
    opacity: 0.5;
    background-color: #efefef;
    margin: 10px 2%;
  }
  input[type="file"]:focus{
    outline: none;
  }

  /*取消、保存按钮*/
  #btn{
    /*background-color: yellow;*/
    display: inline-block;
    margin-left: 85%;
    margin-top: 40px;
  }
  select{
    width: 80%;
    height: 35px;
    margin-right: 5%;
  }
  textarea{
    font-size: 14px;
    padding: 10px;
    letter-spacing: 2px;
    border: none;
    line-height: 25px;
  }
  .tdspan{
    display: inline-block;
    width: 100%;
    line-height: 70px;
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



  /*=======================上传图图片===========================*/
  .upload_warp_img_div_del {
    position: absolute;
    top: 6px;
    width: 16px;
    right: 4px;
  }

  .upload_warp_img_div_top {
    position: absolute;
    top: 0;
    width: 100%;
    height: 30px;
    background-color: rgba(0, 0, 0, 0.4);
    line-height: 30px;
    text-align: left;
    color: #fff;
    font-size: 12px;
    text-indent: 4px;
  }

  .upload_warp_img_div_text {
    white-space: nowrap;
    width: 80%;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .upload_warp_img_div img {
    max-width: 100%;
    max-height: 100%;
    vertical-align: middle;
  }

  .upload_warp_img_div {
    position: relative;
    height: 100px;
    width: 120px;
    border: 1px solid #ccc;
    margin: 0px 30px 10px 0px;
    float: left;
    line-height: 100px;
    display: table-cell;
    text-align: center;
    background-color: #eee;
    cursor: pointer;
  }

  .upload_warp_img {
    border-top: 1px solid #D2D2D2;
    padding: 14px 0 0 14px;
    overflow: hidden
  }

  .upload_warp_text {
    text-align: left;
    margin-bottom: 10px;
    padding-top: 10px;
    text-indent: 14px;
    border-top: 1px solid #ccc;
    font-size: 14px;
  }

  .upload_warp_right {
    float: left;
    width: 57%;
    margin-left: 2%;
    height: 100%;
    border: 1px dashed #999;
    border-radius: 4px;
    line-height: 130px;
    color: #999;
  }

  .upload_warp_left img {
    margin-top: 32px;
  }

  .upload_warp_left {
    float: left;
    width: 40%;
    height: 100%;
    border: 1px dashed #999;
    border-radius: 4px;
    cursor: pointer;
  }

  .upload_warp {
    margin: 14px;
    height: 130px;
  }

  .upload {
    border: 1px solid #ccc;
    background-color: #fff;
    width: 650px;
    box-shadow: 0px 1px 0px #ccc;
    border-radius: 4px;
  }

  .bannerUpload {
    width: 650px;
    margin-left: 25%;
    text-align: center;
    display: block;
    margin-top:3%;
  }

  .detailUpload {
    width: 650px;
    margin-left: 25%;
    text-align: center;
    display: block;
    margin-top:3%;
  }

  .startUp{
    margin-top:20px;
  }

  #select{
    margin-left:20px;
    width:50px;
    height:30px;
  }

  #upload_confirm{
    padding:5px 10px;
    color:#333333;
    border:1px solid #333333;
    -webkit-border-radius:2px;
    -moz-border-radius:2px;
    border-radius:2px;
    margin-left:50%;
    cursor: pointer;
  }



</style>
