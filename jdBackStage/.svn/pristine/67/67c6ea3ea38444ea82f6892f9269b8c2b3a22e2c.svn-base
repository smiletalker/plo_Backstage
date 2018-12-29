<template>
  <div class="bigbox">
    <span class="sou">博客标签:</span>
    <el-input v-model="message" placeholder="请输入搜索类容" :class="{shuru:true}"></el-input>
    <el-table :data="tables.slice((currentPage-1)*pagesize,currentPage*pagesize)"
              ref="multipleTable" style="width:100%"  @selection-change="handleSelectionChange">

      <el-table-column type="selection" width="40"></el-table-column>

      <el-table-column prop="blogId" label="#" width="40"></el-table-column>

      <el-table-column prop="blogTitle" label="博客标题" width="300"
                       show-overflow-tooltip>
      </el-table-column>

      <el-table-column prop="blogLable" label="博客标签" width="250"></el-table-column>

      <el-table-column label="发布时间" width="120" prop="blogDate"></el-table-column>
      <el-table-column  width="203">
        <template slot-scope="scope">
          <!--<div @click="editboke(scope.$index,scope.row)">-->
            <i class="el-icon-edit-outline" :class="{seven:true}" @click="dialogVisible=true"></i>
          <!--</div>-->
          &nbsp;&nbsp;&nbsp;&nbsp;
          <i class="el-icon-delete" :class="{btn:true}" @click="Deleteboke(scope.$index,scope.row)"></i>&nbsp;
            <i class="el-icon-plus" :class="{btn:true}" @click="dialogVisible1=true"> </i>

          <el-dialog
            title="博客编辑"
            :visible.sync="dialogVisible"
            width="50%"
            :before-close="handleClose">
            <el-form :model="form" :class="{wai:true}">
              <el-form-item label="博客标题" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"               v-model="edittext.blogTitle"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="博客标签" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
              v-model="edittext.blogLable"></el-input>
              </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false" :class="{fal1:true}">取 消</el-button>
                <div @click="editboke(scope.$index,scope.row)">
        <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
                </div>

  </span>
          </el-dialog>



          <el-dialog
            title="新增博客"
            :visible.sync="dialogVisible1"
            width="50%"
            :before-close="handleClose">

            <el-form :model="form" :class="{wai:true}">
              <el-form-item label="博客标题" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}" v-model="addtext.blogTitle"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="发布时间" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
                           v-model="addtext.blogDate"></el-input>
              </el-form-item>
              <br>
              <el-form-item label="博客标签" :label-width="formLabelWidth">
                <el-input  autocomplete="off" :class="{da:true}"
                           v-model="addtext.blogLable"></el-input>
              </el-form-item>
            </el-form>

            <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible1 = false" :class="{fal:true}">取 消</el-button>
              <div @click="addboke">
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
    </div>
  </div>
</template>

<script>
  var tableData3;
  import mybtn from './button'
  export default {
    name: "mytable",
    components: {
      mybtn: mybtn,
    },
    data() {
      return {
        message:"",
        tableData3:[],
        total: 0,
        pagesize: 5,
        currentPage: 1,
        dialogVisible: false,
        dialogVisible1: false,
        formLabelWidth:'80px',
        addtext:{
          blogTitle:"",
          blogDate:"",
          blogLable:"",
        },
        edittext:{
          blogTitle:"",
          blogLable:"",
        },
      }
    },
    created() {
      this.$axios.get('/api/boke.do')
        .then(resp => {
          this.tableData3 = resp.data;
          this.total = tableData3.length;
        });
    },

    computed:{
      tables() {
        var that=this;
        return this.tableData3.filter(function(value){
          return String(value['blogLable']).toLowerCase().indexOf(that.message)>-1;
        })

      },
    },

    methods:{
      Deleteboke(index, row) {
        console.log(row);
        this.$alert('\n' +
          '        <p>确认删除</p>\n' +
          '    </div>', '提示', {
          dangerouslyUseHTMLString: true,
          showCancelButton: true,
          customClass: 'shanzeng'
        }).then(()=>{
          this.$axios.get('/api/delboke.do',{params:{id:row.blogId}})
            .then((resp) => {
              //console.log(res.data);
              this.$axios.get('/api/boke.do')
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

      resh(){
        window.location.reload();
      },

      addboke(){
          this.$axios.get('/api/add.do',{params:{addtext:this.addtext}})
            .then( (resp)=> {
              console.log("vue请求成功");
              console.log(resp.data);
              this.$axios.get('/api/boke.do')
                .then((resp) => {
                  this.tableData3 = resp.data;
                  this.total = tableData3.length;
                });
            });

        },

      editboke(index,row){
        console.log(row.blogId);
        this.$axios.get('/api/edit.do',{params:{addtext:this.edittext,id:row.blogId}})
          .then( (resp)=> {
            console.log(id);
            console.log(resp.data);
            this.$axios.get('/api/boke.do')
              .then((resp) => {
                this.tableData3 = resp.data;
                this.total = tableData3.length;
              });
          });

      },
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
    margin-left: -50%;
  }
  .ten{
    position: absolute;
    left: 80%;
    top: 87%;
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
  .one{
    width: 300px;
    height: 50px;
    border: 1px solid red;
    margin-top: 10px;
  }
  .da{
    width: 300px;
  }
  .wai{
    margin-left: 100px;
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

  .fal{
    position: absolute;
    left:72%;
    top:85.5%;
  }

  .fal1{
    position: absolute;
    left:72%;
    top:82.5%;
  }
  .shuru{
    position: absolute;
    left: 700px;
    top: -119px;
  }
.sou{
  margin-top: -122px;
  margin-left: -180px;
}
</style>

