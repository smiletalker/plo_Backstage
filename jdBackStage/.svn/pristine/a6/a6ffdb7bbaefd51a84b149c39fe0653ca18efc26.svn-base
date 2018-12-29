<template>
  <div class="bigbox">
    <header>
      <projectnav></projectnav>
    </header>
    <el-input v-model="search"  placeholder="请输入内容" :class="{sou:true}"></el-input>
    <el-table :data="tables.slice((currentPage-1)*pagesize,currentPage*pagesize)"
              ref="multipleTable" style="width:100%"  @selection-change="handleSelectionChange">

      <el-table-column type="selection" width="40"></el-table-column>

      <el-table-column prop="activityId" label="#" width="40"></el-table-column>
      <el-table-column prop="activityTitle" label="活动名称" width="260"
                       show-overflow-tooltip>
      </el-table-column>

      <el-table-column prop="activityContent" label="活动地址" width="180"></el-table-column>

      <el-table-column label="结束时间" width="120" prop="endDate"></el-table-column>


      <el-table-column prop="allNum" label="人数上限" width="80"></el-table-column>


      <el-table-column  width="233">
        <template slot-scope="scope">
          <i class="el-icon-edit-outline" :class="{seven:true}" @click="dialogVisible = true"></i>&nbsp;&nbsp;&nbsp;&nbsp;
          <!--增加-->
          <i class="el-icon-plus" :class="{btn:true}" @click="dialogVisible1=true"></i>
          <!--删除-->
          <i class="el-icon-delete" :class="{btn:true}" @click="Deleteactivit(scope.$index, scope.row)"></i>
          <!--刷新-->
          <i class="el-icon-refresh" :class="{btn:true}" @click="refrsh"></i>



          <el-dialog
            title="活动编辑"
            :visible.sync="dialogVisible"
            width="50%"
            :before-close="handleClose">

            <el-form :model="form" :class="{wai:true}">
              <el-form-item label="活动名称" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"></el-input>
              </el-form-item>
              <br>
              <!--<el-form-item label="结束时间" :label-width="formLabelWidth">-->
                <!--<el-input  autocomplete="off" :class="{da:true}"></el-input>-->
              <!--</el-form-item>-->
              <el-form-item label="人数上限" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="活动状态" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"></el-input>
              </el-form-item>
              <br>
              <div class="block shijian">
                <span class="demonstration">结束时间</span>&nbsp;&nbsp;&nbsp;
                <el-date-picker
                  v-model="value1"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </div>
            </el-form>
            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
  </span>
          </el-dialog>



          <el-dialog
            title="新增活动"
            :visible.sync="dialogVisible1"
            width="50%"
            :before-close="handleClose">

            <el-form :model="form" :class="{wai:true}">
              <el-form-item label="活动名称" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}" v-model="addtext.activityTitle"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="活动地址" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
                           v-model="addtext.activityContent"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="结束时间" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
                           v-model="addtext.endDate"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="人数上限" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
                           v-model="addtext.allNum"></el-input>
              </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible1 = false" :class="{fal:true}">取 消</el-button>
              <div @click="addactivit">
       <el-button type="primary" @click="dialogVisible1 = false">确 定</el-button>
              </div>

  </span>
          </el-dialog>



        </template>
      </el-table-column>
    </el-table>
    <div style="margin-top:20px;height:37px;">

      <!--分页-->
      <div class="block" :class="{eight:true}">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size="pagesize"
          layout="prev, pager, next, jumper"
          :total="tableData3.length">
        </el-pagination>
      </div>


      <!--<div class="btndiv" :class="{ten:true}">-->
      <!--</div>-->
    </div>
  </div>
</template>

<script>
  import mybtn from './button'
  import projectnav from '../nav.vue'
  export default {
    name: "mytable",
    components: {
      mybtn: mybtn,
      projectnav:projectnav,
    },
    data() {
      return {
        search:"",
        tableData3: [],
        total: 0,
        pagesize: 3,
        currentPage: 1,
        dialogVisible: false,
        dialogVisible1: false,
        formLabelWidth:'80px',
        addtext:{
          activityTitle:"",
          activityContent:"",
          endDate:"",
          allNum:"",
        },
        pickerOptions1: {
          disabledDate(time) {
            return time.getTime() > Date.now();
          },
          shortcuts: [{
            text: '今天',
            onClick(picker) {
              picker.$emit('pick', new Date());
            }
          }, {
            text: '昨天',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24);
              picker.$emit('pick', date);
            }
          }, {
            text: '一周前',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
        },
        value1: '',
        value2: '',
      }
    },
    created() {
      this.$axios.get('/api/activit.do')
        .then(resp => {
          this.tableData3 = resp.data;
          this.total = tableData3.length;
        });
    },

    computed:{
      tables() {
        var that=this;
        return this.tableData3.filter(function(value){
          return String(value['activityTitle']).toLowerCase().indexOf(that.search)>-1;
        })

      },
    },


    methods:{

      refrsh(){
        window.location.reload();
      },
      handleSelectionChange(val) {
        console.log("handleSelectionChange--",val);
        this.tableChecked = val
      },
     //删除
      Deleteactivit(index, row) {
        console.log(row);
        this.$alert('\n' +
          '        <p>确认删除</p>\n' +
          '    </div>', '提示', {
          dangerouslyUseHTMLString: true,
          showCancelButton: true,
          customClass: 'shanzeng'
        }).then(()=>{
          this.$axios.get('/api/delactivit.do',{params:{id:row.activityId}})
            .then((resp) => {
              this.$axios.get('/api/activit.do')
                .then((resp) => {
                  this.tableData3 = resp.data;
                  this.total = tableData3.length;
                });
            });
        }).catch(() => {

        });
      },
      handleClose(done) {
        this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
      addactivit(){
        this.$axios.get('/api/add1.do',{params:{addtext:this.addtext}})
          .then( (resp)=> {
            console.log("vue请求成功");
            console.log(resp.data);
            this.$axios.get('/api/activit.do')
              .then((resp) => {
                this.tableData3 = resp.data;
                this.total = tableData3.length;
              });
          });

      }

    },
    mounted(){
      var arr = sessionStorage.getItem('data');
      var array = JSON.parse(arr);
      console.log(array.permissionName);
      var adm_name=document.getElementsByClassName("adm_name")[0];
      var adm_attribute=document.getElementsByClassName("adm_attribute")[0];
      /*console.log(adm_name);*/
      adm_name.innerHTML=array.adm_name;
      adm_attribute.innerHTML=array.adm_attribute;
      if(array.adm_attribute=="普通管理员"){
        var pro_all=document.getElementsByClassName("pro_all")[0];
        var staff_all=document.getElementsByClassName("staff_all")[0];
        console.log(pro_all);
        /*  pro_all.classList.add("is-disabled");*/
        staff_all.classList.add("is-disabled");
        /*staff_all.attr("is-disabled",true);*/
        $(".staff1")[0].style.display="none";
        $(".staff2")[0].style.display="none";
        /*pro_all.style.display="none";*/
        staff_all.style.display="none";
      }
      if(array.indexOf("博客CURD")=="-1"){
        var blog_all=document.getElementsByClassName("blog_all")[0];
        blog_all.style.display="none";
      }
    }

  }
</script>

<style scoped>
  .bigbox{
    width: 70%;
    margin-left: 25%;
    box-shadow: 0 2px 5px 0 #afafaf;
    background-color: white;
  }
  .btndiv{
    float: right;
  }
  .seven{
    margin-left: 30px;
    color:black;
    font-weight: 800;
    font-size: 15px;
  }
  .eight{
    margin-left: -60%;
  }
  .ten{
    position: absolute;
    left: 80%;
    top: 85%;
  }


  .btn{
    letter-spacing: 1px;
    color: black;
    padding: 10px 15px;
    background-color: white;
    border: none;
    border-radius: 3px;
    margin-left: -3px;
  }
  .btn:hover{
    color: white;
    background-color: #2aabd2;
    box-shadow: 0 2px 5px 0 #afafaf;
  }
  .btn:focus{
    outline: none;
  }
  .da{
    width: 300px;
  }
  .wai{
    margin-left: 100px;
  }
  .shijian{
    margin-left: 10px;
  }
  .fal{
    position: absolute;
    left:72%;
    top:88%;
  }
  .sou{
    position: absolute;
    width: 200px;
    top: -60px;
    left: 80px;
  }
</style>

