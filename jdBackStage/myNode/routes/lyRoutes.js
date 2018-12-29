const express=require("express");
const router=express.Router();
const lyController=require("../controller/lyController");

router.get("/product.do",lyController.searchTab);
router.get("/maxId.do",lyController.maxid);
router.get("/addProduct.do",lyController.addproduct);
router.get("/editProduct.do",lyController.editproduct);

module.exports=router;