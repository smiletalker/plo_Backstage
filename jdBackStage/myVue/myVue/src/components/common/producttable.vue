<template>
  <!--实现多选非常简单:
  手动添加一个el-table-column，
  设type属性为selection即可；
  默认情况下若内容过多会折行显示，
  若需要单行显示可以使用show-overflow-tooltip属性，
  它接受一个Boolean，为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。-->
  <div>
    <!--搜索-->
    <div id="search">
      <div>
        <mylabel label-text="分类名称"></mylabel>
        <select v-model="getSelect">
          <option value="">请选择</option>
          <option>滑雪</option>
          <option>登山</option>
          <option>攀岩</option>
          <option>徒步旅行</option>
          <option>高山跑步</option>
        </select>
      </div>
      <div>
        <mylabel label-text="商品ID"></mylabel>
        <input type="text" placeholder="请输入内容" v-model="getId">
      </div>
      <div>
        <mylabel label-text="产品名称"></mylabel>
        <input type="text" placeholder="请输入内容" v-model="getNm">
      </div>

    </div>

    <div class="bigbox">
      <span id="tablename">服饰信息</span>
      <!--表格，用的是element里面的Table表格-->
      <el-table ref="multipleTable"
                @row-click="clickRow"
                @selection-change="handleSelectionChange"
                :data="newData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                style="width: 100%" v-show="showRow">
        <!--@selection-change="handleSelectionChange"-->

        <el-table-column type="selection" width="70"></el-table-column>

        <el-table-column label="#" width="70">
          <template slot-scope="scope">{{ scope.row.goodsId}}</template>
        </el-table-column>

        <el-table-column prop="exerciseName" label="所属分类" width="120"></el-table-column>

        <el-table-column prop="goodsname" label="产品名称" show-overflow-tooltip></el-table-column>

        <el-table-column prop="price" label="卖价(元/件)" width="120"></el-table-column>

        <el-table-column prop="state" label="产品状态" width="120"></el-table-column>

        <el-table-column prop="num" label="库存状态" width="120" id="stock"></el-table-column>

        <el-table-column prop="" label="操作" width="120">
          <template slot-scope="scope">
            <el-button @click="look(scope.row)"
                       type="text" size="small"
                       class="el-icon-view">
            </el-button>
            <el-button type="text" size="small"
                       class="el-icon-edit-outline"
                       @click="edit(scope.row)">
            </el-button>
          </template>
        </el-table-column>

      </el-table>

      <div style="margin-top: 20px;height:37px;">
        <!--分页-->
        <!--<mypaging></mypaging>-->
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[6, 12, 18, 24]"
          :page-size="pagesize"
          :total="total"
          layout="total, sizes, prev, pager, next, jumper"
        >
        </el-pagination>

        <!--增加、删除、取消、刷新四个按钮-->
        <div class="btndiv">
          <!--增加-->
          <mybtn class-name="el-icon-plus" v-on:btnClick="addproduct"></mybtn>
          <!--删除-->
          <mybtn class-name="el-icon-delete" v-on:btnClick="clearRow([newData[3]])"></mybtn>
          <!--刷新-->
          <mybtn class-name="el-icon-refresh" v-on:btnClick="refresh"></mybtn>

        </div>

      </div>

      <!--弹框-->
      <mylook ref='getedit' v-show="isshow" v-on:closelook="closelook"></mylook>

      <!--添加-->
      <myadd ref='getid' v-show="addshow" v-on:showadd="showadd" v-on:maxId="maxId"></myadd>

    </div>

  </div>


</template>

<script>
  import mybtn from './button'
  import mylook from './productlook'
  import myadd from '../productadd'
  import mylabel from './label'
  import myinput from './input'

  export default {
    name: "myproducttable",
    components:{
      mylook:mylook,
      myadd:myadd,
      mybtn:mybtn,
      mylabel:mylabel,
      myinput:myinput,
    },
    data() {
      return {
        tableData: [],
        clothmp:[],
        // newData:[],
        stock:[],
        lookbox:'',
        maxId:'',
        multipleSelection: [],
        isshow:false,
        addshow:false,
        total:6,
        pagesize:6,//每页的数据条数
        currentPage:1,//默认开始页面
        dialogFormVisible: false,
        getSelect:'',
        getId:'',
        getNm:'',
        showRow:true
      }
    },
    methods: {
      /*分页*/
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleSizeChange(val) {
        this.pagesize = val;
//        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.currentPage = val;
      },
      /*查看按钮*/
      look (row) {
        // console.log(row);
        this.isshow=true;
        this.lookbox=row;
        this.$refs.getedit.lookmsg(row,this.stock,"查看服饰信息");
        /*---------------------------------调用子组件请求图片---------------------------------------*/
        this.$refs.getedit.getImages(row);
      },

      /*编辑按钮*/
      edit (row) {
        // console.log(row);
        this.isshow=true;
        this.$refs.getedit.editstate(row,this.stock,"编辑服饰信息");
      },

      /*关闭查看弹框*/
      closelook () {
        this.isshow=false;
        // console.log("parent")
      },

      /*新增产品按钮*/
      addproduct () {
        this.addshow=true;
        let that=this;
        this.$axios.get('/api/maxId.do')
          .then(function (resp) {
            that.maxId=resp.data[0].maxId;
            that.$refs.getid.getMaxId(that.maxId+1);
            // console.log(that.maxId);
          })
      },

      /*刷新*/
      refresh () {
        location.reload();
      },

      /*点击某一行,删除某一行*/
      clickRow(row){
        this.$refs.multipleTable.toggleRowSelection(row);
      },
      handleSelectionChange(val){
        this.multipleSelection=val;
      },
      clearRow(){
        for (let i = 0; i < this.multipleSelection.length; i++) {
          let val = this.multipleSelection;
          // 获取选中行的索引的方法
          // 遍历表格中clothmp数据和选中的val数据，比较它们的rowNum,相等则输出选中行的索引
          // rowNum的作用主要是为了让每一行有一个唯一的数据，方便比较，可以根据个人的开发需求从后台传入特定的数据
          val.forEach((val, index) => {
            this.clothmp.forEach((v, i) => {
              if (val.goodsId === v.goodsId) {
                // i 为选中的索引
                this.clothmp.splice(i, 1)
              }
            })
          })
        }
        // 删除完数据之后清除勾选框
        this.$refs.multipleSelection.clearSelection();
      },

      /*关闭新增弹框*/
      showadd () {
        this.addshow=false;
      },

      /*获取数据*/
      getData:function () {//c,i,n商品分类，商品id，商品名称
        /*console.log(c);
        console.log(i);
        console.log(n);*/
        let that=this;
        /*发起请求，请求数据，向node发起请求*/
        this.$axios.get("/api/product.do")
          .then(function (resp) {
            /*resp.data[0]clothmp
            resp.data[1]stock
            */
            that.clothmp = resp.data[0];//cloth+goodsmp
            that.stock = resp.data[1];//goodsstock
            that.total=that.clothmp.length;
          });
      },
    },
    created () {
      this.getData();
    },
    computed:{
      newData(){
        let that=this;
        return this.clothmp.filter(function (values) {
          return values.exerciseName.indexOf(that.getSelect)!=-1 && values.goodsname.indexOf(that.getNm)!=-1
            && String(values['goodsId']).toLowerCase().indexOf(that.getId)>-1;
        })
      }
    }
  }
</script>

<style scoped>
  .bigbox{
    width: 70%;
    margin-left: 24%;
    /*outline: 1px solid red;*/
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
    padding-bottom: 20px;
    margin-bottom: 60px;
  }
  #tablename{
    display: inline-block;
    font-size: 18px;
    margin-left: 40px;
    padding: 15px 0;
  }
  .btndiv{
    /*outline: 1px solid pink;*/
    float: right;
    margin-top: -30px;
  }
  .el-icon-view,
  .el-icon-edit-outline{
    color: #b7b7b7;
    font-size: 14px;
  }


  #search{
    /*outline: 1px solid red;*/
    width: 82%;
    height: 85px;
    margin-left: 18%;
    position: relative;
  }
  #search>div{
    /*outline: 1px solid red;*/
    float: left;
    margin: 25px 0 0 7%;
  }
  #searchbtn{
    position: absolute;
    top: 0;
    right: 8%;
  }
  input{
    height: 35px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
  }
  input:focus{
    outline: none;
  }
  select{
    height: 35px;
    width: 180px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
  }
  select:focus{
    outline: none;
  }

</style>

