<template>
  <div id="jurist">
  <header>
    <projectnav></projectnav>
  </header>
  <subpagetittle pagetitle="权限管理"></subpagetittle>
    <search class="mysearch"></search>
    <div class="myinput">
      <div class="myinput_1">
        <span>输入姓名：</span>
        <myinput type="text" placeholder="账号/姓名" width="150px" name="jur_change" v-on:blur="jur_change"></myinput>
      </div>
      <div class="myinput_2">
        <span>输入姓名：</span>
        <el-select v-model="value5" multiple placeholder="请选择">
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>
      </div>
    </div>

    <div class="affair affair_sale">
      <div class="affair_content affair_content_sale jur_table">
        <h2 style="display:inline-block">权限管理</h2>
        <el-button type="text" @click="dialogFormVisible = true" class="mybutton">
          <mybutton btnText="添加人员"></mybutton>
        </el-button>
        <el-dialog title="添加人员" :visible.sync="dialogFormVisible">
          <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
              <el-input  v-model="ruleForm.name" autocomplete="off" placeholder="请输入姓名" name="jur_name"></el-input>
            </el-form-item>

            <el-form-item label="电话号码" :label-width="formLabelWidth" prop="phone">
              <el-input v-model.number="ruleForm.phone"  autocomplete="off" placeholder="请输入电话号码 "  name="jur_tel"></el-input>
            </el-form-item>

            <el-form-item label="权限属性" :label-width="formLabelWidth" prop="jur" >
              <el-input v-model="ruleForm.jur"  autocomplete="off" placeholder="请输入权限属性" name="jur_shuxin"></el-input>
            </el-form-item>

            <el-form-item label="权限" :label-width="formLabelWidth" prop="region">
              <el-select v-model="ruleForm.region" placeholder="请选择权限" name="jur_select">
                <el-option label="产品上架/下架" value="产品上架/下架"></el-option>
                <el-option label="产品信息修改" value="产品信息修改"></el-option>
                <el-option label="产品信息查看" value="产品信息查看"></el-option>
                <el-option label="订单查看" value="订单查看"></el-option>
                <el-option label="订单取消" value="订单取消"></el-option>
                <el-option label="客户信息查看" value="客户信息查看"></el-option>
                <el-option label="客户删除" value="客户删除"></el-option>
                <el-option label="博客发布" value="博客发布"></el-option>
                <el-option label="博客查看" value="博客查看"></el-option>
                <el-option label="博客删除" value="博客查看"></el-option>
                <el-option label="博客修改" value="博客查看"></el-option>
                <el-option label="活动发布" value="活动发布"></el-option>
                <el-option label="活动查看" value="活动查看"></el-option>
                <el-option label="活动删除" value="活动查看"></el-option>
                <el-option label="活动修改" value="活动查看"></el-option>
              </el-select>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button >
              <div  @click="submitForm('ruleForm')" class="sure_true">确 定</div>
            </el-button>
            <el-button @click="resetForm('ruleForm')">重置</el-button>
          </div>
        </el-dialog>

        <el-table
          style="width: 90%"
          class="psHeight"
          @selection-change="handleSelectionChange"
          :data="tableData.slice((currentPage-1)*pagesize,currentPage*pagesize)"
        >
          <el-table-column
            type="selection"
            width="55">
          </el-table-column>
          <el-table-column
            prop="jur_id"
            label="id"
            align="center"
            >
          </el-table-column>
          <el-table-column
            prop="jur_name"
            label="姓名"
            align="center"
           >
          </el-table-column>
          <el-table-column
            prop="jur_tel"
            label="电话号码"
            width="180"
            align="center">
          </el-table-column>
          <el-table-column
            prop="jur_shu"
            label="权限属性"
            align="center"
          >
          </el-table-column>
          <el-table-column
            prop="jur_jur"
            label="权限"
            width="150"
            align="center">
          </el-table-column>
          <el-table-column
            prop="jur_isNo"
            label="是否禁用"
            align="center">
          </el-table-column>
          <el-table-column label="操作"
                           width="150"
                           align="center">
            <template slot-scope="scope">


              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">
                <i class="el-icon-edit-outline"></i>
              </el-button>


              <el-button
                size="mini"
                @click.native.prevent="handleDelete(scope.$index, tableData)">
                <i class="el-icon-delete"></i>
              </el-button>

            </template>
          </el-table-column>
        </el-table>
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[4, 8, 12, 16]"
          :page-size="pagesize"
          :total="total"
          layout="total, sizes, prev, pager, next, jumper"
        >
        </el-pagination>
      </div>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetittle from './common/subpagetitle.vue'
  import search from './common/search.vue'
  import myinput from './common/input.vue'
  import mybutton from './common/button.vue'

  function isvalidPhone(str) {
    const reg = /^1[3|4|5|7|8][0-9]\d{8}$/;
    return reg.test(str);
  }

  var validPhone=(rule, value,callback)=>{
    if (!value){
      callback(new Error('请输入电话号码'))
    }else  if (!isvalidPhone(value)){
      callback(new Error('请输入正确的11位手机号码'))
    }else {
      callback()
    }
  };

  export default {
        name: "jurist",
      components: {
        projectnav:projectnav,
        subpagetittle:subpagetittle,
        search:search,
        myinput:myinput,
        mybutton:mybutton,
      },
      data(){
        return{
          total: this.defines.mytotal,
          pagesize:4,//每页的数据条数
          currentPage:1,//默认开始页面
          dialogFormVisible: false,
          formLabelWidth: '120px',
          ruleForm: {
            name: '',
            region: '',
            phone:'',
            jur:'',
          },
          rules: {
            name: [
              { required: true, message: '请输入姓名', trigger: 'blur' },
              { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
            ],
            region: [
              { required: true, message: '请选择活动区域', trigger: 'change' }
            ],
            phone: [
              { required: true, trigger: 'blur', validator: validPhone }//这里需要用到全局变量
            ],
            jur: [
              { required: true, message: '请输入活动名称', trigger: 'blur' },
              { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
            ],
          },
          form: {
            name: '',
            tel:'',
            jur:'',
            region: '',
            date1: '',
            date2: '',
            delivery: false,
            type: [],
            resource: '',
            desc: ''
          },
            options: [{
              value: '选项1',
              label: '产品上架/下架'
            }, {
              value: '选项2',
              label: '产品信息修改'
            }, {
              value: '选项3',
              label: '产品信息查看'
            }, {
              value: '选项4',
              label: '订单查看'
            }, {
              value: '选项5',
              label: '订单取消'
            },
              {
              value: '选项6',
              label: '客户信息查看'
            },
              {
              value: '选项7',
              label: '客户删除'
            },
              {
              value: '选项8',
              label: '博客发布'
            },
              {
              value: '选项9',
              label: '博客查看'
            },
              {
              value: '选项10',
              label: '博客删除'
            },
              {
              value: '选项11',
              label: '博客修改'
            },
              {
              value: '选项12',
              label: '活动发布'
            },
              {
              value: '选项13',
              label: '活动查看'
            },
              {
              value: '选项14',
              label: '活动删除'
            },
              {
              value: '选项15',
              label: '活动修改'
            },
            ],
          value5: [],
          value11: [],
          tableData:[],
        }
      },
      methods: {
        submitForm(formName) {
          var count_all=this.tableData.length;
          this.$refs[formName].validate((valid) => {
            if (valid) {
              alert('submit!');
            } else {
              console.log('error submit!!');
              return false;
            }
          });

          $.ajax({//发起添加到管理员信息的ajax
            type:"post",
            url:'http://localhost:8888/jurist_save.do',
            data:{
              jur_names: $("[name='jur_name']").val(),
              jur_tels:$("[name='jur_tel']").val(),
              jur_shuxins: $("[name='jur_shuxin']").val(),
            },
            success:function (data) {
              console.log(data);
            }
          });
          $.ajax({//发起添加到权限的ajax
            type:"post",
            url:'http://localhost:8888/jurist_saveAll.do',
            data:{
              jur_id:this.tableData.length+1,
              jur_selects: $("[name='jur_select']").val()
            },
            success:function (data) {
              console.log(data);
            }
          })
          this.defines.setCount();//每次点击都让条数增加
          this.defines.setMytotal();//每次点击都让页数增加
          console.log(this.defines.mytotal);
          console.log(this.defines.count);
        },
        resetForm(formName) {
          this.$refs[formName].resetFields();
        },
        handleEdit(index, row) {
          console.log(row.jur_name);
          console.log(row.jur_id);
          console.log(row);
       /*   this.$router.push({
            name:'jur_name',
            query:{
             jur_name:'ddd',
            }
          });*/
          this.$router.push({name:'jur_name',query:{jur_name:row.jur_name,jur_id:row.jur_id}});
        },
        clear:function () {
          let button_primary=$(".el-button--primary")[0];
          button_primary.click(function () {
            console.log(button_primary);
          });
        },
        handleDelete(index, row)  {
          this.$confirm('此操作将永久删除这个人, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            row.splice(index, 1);
          }).then(() => {
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            });
          });
          console.log(row);
          let icon_delete=$(".el-icon-delete");
          let row1=parseInt(icon_delete[index].parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1].childNodes[0].innerText);
          let row2=icon_delete[index].parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[2].innerText;
          console.log(row2);
          $.ajax({//发起删除这一行的数据的请求
              type:"post",
              url:'http://localhost:8888/jurist_up.do',
              data:{
                row:row1,
              },
              success:function (data) {
                console.log(data);
              }
            });
//          icon_delete.click(function () {
//           let zhuzhong_big=this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
//           let zhuzhong_small=this.parentNode.parentNode.parentNode.parentNode.parentNode;
//          /* zhuzhong_big.removeChild(zhuzhong_small);*/
//            console.log(zhuzhong_big);
//        /*    $.ajax({
//              type:"post",
//              url:'http://localhost:8888/jurist_up.do',
//              data:{
//                row:row.jur_id,
//              },
//              success:function (data) {
//                console.log(data);
//              }
//            });*/
//          });
        },
        jur_change(){//当输入框失焦后的发起的请求
          var datas=[];
          console.log("input");
          $.ajax({
            type:"post",
            url:'http://localhost:8888/jurist_change.do',
            data:{
              jur_change: $("[name='jur_change']").val(),
            },
            success:function (data) {
              console.log(data);
          /*    for(let i=0;i<data.length;i++){
                var obj={};
                obj.jur_id=data[i].adm_id;
                obj.jur_name=data[i].adm_name;
                obj.jur_tel=data[i].adm_tel;
                obj.jur_shu=data[i].adm_attribute;
                obj.jur_jur=data[i].permissionName;
                obj.jur_isNo=data[i].adm_isNo;
                data[i]=obj;
              }
              this.tableData=datas;*/
               this.tableData=data;
            }
          });
        },
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
      },
      created:function () {

        var data=[];
        this.$axios.get('/api/jurist.do').then(resp=> {
          console.log(resp.data);
          for(let i=0;i<resp.data.length;i++){
            var obj={};
            obj.jur_id=resp.data[i].adm_id;
            obj.jur_name=resp.data[i].adm_name;
            obj.jur_tel=resp.data[i].adm_tel;
            obj.jur_shu=resp.data[i].adm_attribute;
            obj.jur_jur=resp.data[i].permissionName;
            obj.jur_isNo=resp.data[i].adm_isNo;
            data[i]=obj;
          }
          this.tableData=data;
        });

       /* let jur_jur=this.$route.params.jur_jur;
        console.log(jur_jur);*/
      /*  this.$axios.get('/api/jurist.do').then(resp=> {
          console.log(resp.data)
        })*/
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
    }
    }
</script>

<style>
@import "../assets/jurist.css";
</style>
