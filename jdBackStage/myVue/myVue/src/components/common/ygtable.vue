<template>
  <!--实现多选非常简单:
  手动添加一个el-table-column，
  设type属性为selection即可；
  默认情况下若内容过多会折行显示，
  若需要单行显示可以使用show-overflow-tooltip属性，
  它接受一个Boolean，为true时多余的内容会在 hover 时以 tooltip 的形式显示出来。-->
  <div class="bigbox">
    <!--表格，用的是element里面的Table表格-->
    <el-table ref="multipleTable"
              @row-click="clickRow"
              @selection-change="handleSelectionChange"
              :data="tableData3.slice((currentPage-1)*pagesize,currentPage*pagesize)"
              tooltip-effect="dark" style="width: 100%">

      <el-table-column type="selection" width="55"></el-table-column>

      <el-table-column prop="adm_id" label="id" width="120"></el-table-column>

      <el-table-column prop="adm_name" label="姓名" width="120"></el-table-column>

      <el-table-column prop="adm_attribute" label="工作权限" show-overflow-tooltip></el-table-column>
      <el-table-column prop="adm_tel" label="手机号码" show-overflow-tooltip></el-table-column>
      <el-table-column prop="" label="操作" show-overflow-tooltip>
        <template slot-scope="scope">
          <el-button type="text" size="small"
                     class="el-icon-edit-outline"
                     @click="aaa(scope.row.adm_id)"
          >
          </el-button>
          <el-button type="text" size="small"
                     class="el-icon-delete" @click="bbb(scope.row.adm_id)">
          </el-button>
        </template>

      </el-table-column>

    </el-table>

    <div style="margin-top: 20px;height:37px;">
      <!--分页-->
      <div class="block">
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
      </div>

      <!--增加、删除、取消、刷新四个按钮-->
      <div class="btndiv">
        <!--增加-->
        <div @click="showd=!showd"><mybtn class-name="el-icon-plus"></mybtn></div>
        <!--删除-->
        <mybtn class-name="el-icon-delete" v-on:btnClick="clearRow"></mybtn>
        <!--刷新-->
        <div @click="xin"><mybtn class-name="el-icon-refresh"></mybtn></div>

      </div>

      <!--新增-->
      <div class="xiz" v-show="showd">
        <div class="xiz1">
          <div class="xix">新增人员信息</div>
          <div class="gb el-icon-close" @click="showd=!showd"></div>
          <div class="zy">*成员姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input v-model="addtext.name" width="width:350px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*成员密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input v-model="addtext.password" width="width:350px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input v-model="addtext.tel" width="width:350px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*权限等级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input v-model="addtext.exe" width="width:350px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <!--<div class="zy">*负责工作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="52" rows="7" class="zy1"></textarea></div>-->
          <div class="zy2" @click="adduser"><mebutton btnText="保存" ></mebutton></div>
        </div>
      </div>

      <!--编辑-->
      <div class="xiz" v-show="showe">
        <div class="xiz1">
          <div class="xix">编辑人员信息</div>
          <div class="gb el-icon-close" @click="showe=!showe"></div>
          <div class="zy">*成员姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput :value="adm_name"  width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<meiput  :value="adm_tel" width="width:350px"></meiput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*权限等级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input v-model="addtext.exe" width="width:350px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
          <div class="zy">*留言板块&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="52" rows="7" class="zy1"></textarea></div>
          <div class="zy2" @click="showe=!showe"><mebutton btnText="保存"></mebutton></div>
        </div>
      </div>

    </div>
  </div>

</template>

<script>
  import mybtn from './button'
  import meiput from './input.vue'
  import mebutton from './button.vue'
  import ybmulti from './ybmulti.vue'
  export default {
    name: "ygtable",
    components:{
      mybtn:mybtn,
      meiput:meiput,
      mebutton:mebutton,
      ybmulti:ybmulti
    },
    data() {
      return {
        showd:false,
        showe:false,
        tableData: [],
        tableData3: [],
        tableData4: [],
        addtext:{
            name:"",
            tel:"",
            exe:"",
            password:"",
        },
        multipleSelection: [],
        total:8,
        pagesize:6,
        currentPage:1,
        adm_name:"",
        adm_tel:""
      }
    },

    created () {
      let that=this;
      /*发起请求，请求数据，向node发起请求*/
      this.$axios.get("/api/staff.do")
        .then(function (resp) {
          console.log("vue请求成功");
          that.tableData3=resp.data;
          console.log(resp.data);
        })
    },

    methods: {
        //编辑
      aaa(s){
//          showe=!showe
        console.log(this);
        console.log(s);
        this.$axios.get("/api/staff1.do",{params:{id:s}})
          .then( (resp)=> {
            console.log("vue请求成功");
            this.tableData4=resp.data;
            console.log(resp.data);
            console.log(this.tableData4);
            console.log(this.tableData4[0].adm_name);
            console.log(this);
            this._data.adm_name=this.tableData4[0].adm_name;
            this._data.adm_tel=this.tableData4[0].adm_tel
          });
        this.showe=!this.showe;
        console.log(this._data.adm_name)


      } ,
      //删除
      bbb(s){
//          showe=!showe
        console.log(this);
        console.log(s);
        this.$axios.get("/api/staff2.do",{params:{id:s}})
          .then( (resp)=> {
            console.log("vue请求成功");

          });

      },
//      新增
      adduser(){
        if(this.addtext.name==undefined||this.addtext.password==undefined||this.addtext.name==""||this.addtext.password==""){
          alert("请输入完整的信息")
        }else {
          this.$axios.get("/api/staff3.do",{params:{addtext:this.addtext}})
            .then( (resp)=> {

              console.log("vue请求成功");
              console.log(resp.data);

            });
          this.showd=!this.showd;

        }
      },
//      刷新
      xin(){
//        router.go(0);
        let that=this;
        /*发起请求，请求数据，向node发起请求*/
        this.$axios.get("/api/staff.do")
          .then(function (resp) {
            console.log("vue请求成功");
            that.tableData3=resp.data;
            console.log(resp.data);
          })
      },
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
            this.tableData3.forEach((v, i) => {
              if (val.adm_id === v.adm_id) {
                // i 为选中的索引
                this.tableData3.splice(i, 1)
              }
            })
          })
        }
        // 删除完数据之后清除勾选框
        this.$refs.tableData.clearSelection();
      },
    }
  }
</script>

<style scoped>
  .bigbox{
    width: 70%;
    margin-left: 25%;
    /*outline: 1px solid red;*/
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    /*outline: 1px solid pink;*/
    float: right;
    position: relative;
    top: -30px;
  }
  .btndiv>div{
    float: left;
  }
  /*新增*/
  .xiz{
    height: 900px;
    width: 85%;
    margin-left: -8.5%;
    margin-top: -650px;
    background-color: rgba(0,0,0,0.73);
    position: fixed;
    z-index: 9;
  }
  .xiz1{
    height: 600px;
    width: 85%;
    margin-left: 8%;
    background-color: white;
    position: absolute;
    top: 100px;
    z-index: 10;
  }
  .xix{
    margin-top: 50px;
    margin-left: 4%;
  }
  .gb{
    margin-left: 90%;
  }
  .zy{
    margin-left: 23%;
    margin-top: 40px;
  }
  .zy1{
    vertical-align: top;
  }
  .zy1:focus{
    outline: none;
  }
  .zy2{
    margin-left: 47%;
    margin-top: 35px;
  }
  input{
    height: 35px;
    width: 350px;
    letter-spacing: 2px;
    font-size: 14px;
    padding: 0 15px;
    border: 1px solid #cecece;
  }
  input:focus{
    outline: none;
  }
</style>

