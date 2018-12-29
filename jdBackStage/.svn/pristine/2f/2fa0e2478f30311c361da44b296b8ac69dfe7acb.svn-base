const express=require("express");
const router=express.Router();

const activitController=require("../controller/klmController");

//查询
router.get("/activit.do",activitController.getAllactivit);
router.get("/boke.do",activitController.getAllboke);

//删除
router.get("/delboke.do",activitController.delBoke);
router.get("/delactivit.do",activitController.delactivit);

//新增
router.get("/add.do",activitController.addBoke);
router.get("/add1.do",activitController.addactivit);

//编辑
router.get("/edit.do",activitController.editBoke);
module.exports=router;