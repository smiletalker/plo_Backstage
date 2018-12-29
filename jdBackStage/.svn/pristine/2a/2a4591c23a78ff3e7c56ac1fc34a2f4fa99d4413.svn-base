<template>
  <div>
    <header>
      <projectnav></projectnav>
    </header>
    <subpagetittle pagetitle="权限管理"></subpagetittle>
    <div class="juName_all">
      <p class="juall" >当前用户：<span>{{this.$route.query.jur_name}}</span></p>
      <div class="myradio">
        <el-radio v-model="radio" label="1">启用</el-radio>
        <el-radio v-model="radio" label="2">禁用</el-radio>
      </div>
      <div class="jur_content">
        <div class="jur_content1">
          <p>  <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">产品管理</el-checkbox></p>
          <div class="jur_shu">
            <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
              <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
            </el-checkbox-group>
          </div>
        </div>

        <div class="jur_content1">
          <p><el-checkbox :indeterminate="isIndeterminate1"  v-model="checkAll1" @change="handleCheckAllChange1">订单管理</el-checkbox></p>
          <div class="jur_shu">
            <el-checkbox-group v-model="checkedCities1" @change="handleCheckedCitiesChange1">
              <el-checkbox v-for="city in cities1" :label="city" :key="city">{{city}}</el-checkbox>
            </el-checkbox-group>
          </div>
        </div>

        <div class="jur_content1">
          <p><el-checkbox :indeterminate="isIndeterminate2" v-model="checkAll2" @change="handleCheckAllChange2">客户管理</el-checkbox></p>
          <div class="jur_shu">
            <el-checkbox-group v-model="checkedCities2" @change="handleCheckedCitiesChange2">
              <el-checkbox v-for="city in cities2" :label="city" :key="city">{{city}}</el-checkbox>
            </el-checkbox-group>
          </div>
        </div>

        <div class="jur_content1">
          <p><el-checkbox :indeterminate="isIndeterminate3" v-model="checkAll3" @change="handleCheckAllChange3">博客活动管理</el-checkbox></p>
          <div class="jur_shu">
            <el-checkbox-group v-model="checkedCities3" @change="handleCheckedCitiesChange3">
              <el-checkbox v-for="city in cities3" :label="city" :key="city">{{city}}</el-checkbox>
            </el-checkbox-group>
          </div>
        </div>

        <el-button type="text" @click="dialogVisible = true">
        <mybutton btnText="保存" className="mySave"></mybutton>
        </el-button>

        <el-dialog
          title="提示"
          :visible.sync="dialogVisible"
          width="30%"
          :before-close="handleClose">
          <span>确定要保存么？</span>
          <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
     <div @click="jur_save">
        <el-button type="primary" @click="dialogVisible=false">
          确 定
        </el-button>
     </div>

  </span>
        </el-dialog>

      </div>
    </div>
  </div>
</template>

<script>
  import projectnav from './nav.vue'
  import subpagetittle from './common/subpagetitle.vue'
  import checkbox from './common/checkbox.vue'
  import mybutton from './common/button.vue'
  const cityOptions = ['产品上下架', '订单查看', '客户信息查看'];
  const cityOptions1 = ['订单查看', '产品取消'];
  const cityOptions2 = ['客户信息查看', '客户删除'];
  const cityOptions3 = ['博客CURD','活动CURD'];

    export default {
        name: "jur_name",
       components: {
        projectnav: projectnav,
        subpagetittle: subpagetittle,
        checkbox:checkbox,
        mybutton:mybutton,

      },
      data(){
          return{
            radio: '1',
            checkAll: false,
            checkAll1: false,
            checkAll2: false,
            checkAll3: false,
            checkedCities: [],
            cities: cityOptions,
            checkedCities1: [],
            cities1: cityOptions1,
            checkedCities2: [],
            cities2: cityOptions2,
            checkedCities3: [],
            cities3: cityOptions3,
            isIndeterminate: true,
            isIndeterminate1: true,
            isIndeterminate2: true,
            isIndeterminate3: true,
            dialogVisible:false,
          }
      },
      created(){
        let jur_id=this.$route.query;
        console.log(jur_id);
      },
      methods: {
       /* save_jur(){
          var isCheck=$(".is-checked").childNodes[2];
          console.log(isCheck);
        },*/
        jur_save(){
          var array=new Array();
          for(var i=0;i<$(".is-checked").length;i++){
            var isCheck=$(".is-checked")[i].childNodes[1].innerText;
            array.push(isCheck);
          }
          for(var j=0;j<array.length;j++){
            if(array[j]==''){
              array.splice(j,1);
            }
          }
          console.log(array);
          console.log();
          let jurs_id=this.$route.query.jur_id;
         /* this.$router.push({name:'jurist',params:{jur_jur:array}});*/
          $.ajax({
              type:"post",
              url:'http://localhost:8888/jurist_all.do',
              data:{
                array:array,
                jurs_id:jurs_id
              },
              success:function (data) {
                console.log(data);
              }
          })

        },
        handleClose(done) {
          this.$confirm('确认关闭？')
            .then(_ => {
              done();
            })
            .catch(_ => {});
        },
        handleCheckAllChange(val) {
          this.checkedCities = val ? cityOptions : [];
          this.isIndeterminate = false;
        },
        handleCheckedCitiesChange(value) {
          let checkedCount = value.length;
          this.checkAll = checkedCount === this.cities.length;
          this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
        },
            handleCheckAllChange1(val) {
          this.checkedCities1 = val ? cityOptions1 : [];
          this.isIndeterminate1 = false;
        },
        handleCheckedCitiesChange1(value) {
          let checkedCount = value.length;
          this.checkAll1= checkedCount === this.cities1.length;
          this.isIndeterminate1 = checkedCount > 0 && checkedCount < this.cities1.length;
        },
        handleCheckAllChange2(val) {
          this.checkedCities2 = val ? cityOptions2 : [];
          this.isIndeterminate2 = false;
        },
        handleCheckedCitiesChange2(value) {
          let checkedCount = value.length;
          this.checkAll2 = checkedCount === this.cities2.length;
          this.isIndeterminate2= checkedCount > 0 && checkedCount < this.cities2.length;
        },
      handleCheckAllChange3(val) {
        this.checkedCities3 = val ? cityOptions3 : [];
        this.isIndeterminate3 = false;
      },
      handleCheckedCitiesChange3(value) {
        let checkedCount = value.length;
        this.checkAll3 = checkedCount === this.cities3.length;
        this.isIndeterminate3 = checkedCount > 0 && checkedCount < this.cities3.length;
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
      }
    }
</script>

<style >
@import "../assets/jur_name.css";
</style>
