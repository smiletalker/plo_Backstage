create database jd;
USE jd;


/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/6 星期二 下午 18:57:20               */
/* 最终版本                                                     */
/*==============================================================*/


DROP TABLE IF EXISTS activityApply;/*3*/

DROP TABLE IF EXISTS activityInformation;/*2*/

DROP TABLE IF EXISTS alpenstock;/*5*/

DROP TABLE IF EXISTS bag;/*6*/

DROP TABLE IF EXISTS belt;/*7*/

DROP TABLE IF EXISTS blogInformation;/*8*/

DROP TABLE IF EXISTS clothes;/*9*/

DROP TABLE IF EXISTS defaultAddress;/*11*/

DROP TABLE IF EXISTS exercise;/*4*/

DROP TABLE IF EXISTS glasses;/*12*/

DROP TABLE IF EXISTS glove;/*13*/

DROP TABLE IF EXISTS goodsImages;/*23*/

DROP TABLE IF EXISTS goodsMP;/*24*/

DROP TABLE IF EXISTS goodsStock;/*30*/

DROP TABLE IF EXISTS hairBelt;/*21*/

DROP TABLE IF EXISTS hat;/*19*/

DROP TABLE IF EXISTS helmet;/*14*/

DROP TABLE IF EXISTS kneepad;/*22*/

DROP TABLE IF EXISTS kneepadFlexibility;/*25*/

DROP TABLE IF EXISTS kneepadThickness;/*26*/

DROP TABLE IF EXISTS pants;/*15*/

DROP TABLE IF EXISTS safelock;/*18*/

DROP TABLE IF EXISTS shoes;/*16*/

DROP TABLE IF EXISTS shoppingCar;/*27*/

DROP TABLE IF EXISTS ski;/*20*/

DROP TABLE IF EXISTS userAddress;/*10*/

DROP TABLE IF EXISTS userCollect;/*28*/

DROP TABLE IF EXISTS userOrder;/*29*/

DROP TABLE IF EXISTS userRegist;/*1*/

DROP TABLE IF EXISTS permissions;/*31*/

DROP TABLE IF EXISTS administrator;/*32*/

DROP TABLE IF EXISTS returnOrder;/*33*/


/*==============================================================*/
/* 1.Table: userRegist                                            */
/*==============================================================*/
CREATE TABLE userRegist
(
   userID               INT NOT NULL AUTO_INCREMENT,
   userName             VARCHAR(20) NOT NULL,
   userEmail            VARCHAR(50) NOT NULL,
   userPassword         VARCHAR(20) NOT NULL,
   userPhone            CHAR(11) NOT NULL,
   PRIMARY KEY (userID)
);

ALTER TABLE userRegist COMMENT '用户注册表';

/*==============================================================*/
/* 2.Table: activityInformation                                  */
/*==============================================================*/
CREATE TABLE activityInformation
(
   activityId           INT NOT NULL AUTO_INCREMENT,
   activityTitle        VARCHAR(20) NOT NULL,
   activityContent      VARCHAR(50) NOT NULL,
   endDate              DATE NOT NULL,
   allNum               INT NOT NULL,
   imagesSrc            VARCHAR(50) NOT NULL,
   src                  VARCHAR(50) NOT NULL,
   PRIMARY KEY (activityId)
);

ALTER TABLE activityInformation COMMENT '活动信息表';

/*==============================================================*/
/* 3.Table: activityApply                                        */
/*==============================================================*/
CREATE TABLE activityApply
(
   activityId           INT NOT NULL,
   userId               INT NOT NULL,
   applyTime            DATE NOT NULL,
   CONSTRAINT FK_Reference_44 FOREIGN KEY (userID)
      REFERENCES userRegist (userID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_45 FOREIGN KEY (activityId)
      REFERENCES activityInformation (activityId) ON DELETE RESTRICT ON 

UPDATE RESTRICT
);

ALTER TABLE activityApply COMMENT '活动报名表';

/*==============================================================*/
/* 4.Table: exercise                                              */
/*==============================================================*/
CREATE TABLE exercise
(
   goodsKind            INT NOT NULL AUTO_INCREMENT,
   goodsKindName        VARCHAR(20) NOT NULL,
   PRIMARY KEY (goodsKind)
);

ALTER TABLE exercise COMMENT '商品总表';

/*==============================================================*/
/* 5.Table: alpenstock                                            */
/*==============================================================*/
CREATE TABLE alpenstock
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(5) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_55 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE alpenstock COMMENT '登山杖';



/*==============================================================*/
/* 6.Table: bag                                                   */
/*==============================================================*/
CREATE TABLE bag
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(10) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_56 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE bag COMMENT '包表';

/*==============================================================*/
/* 7.Table: belt                                                  */
/*==============================================================*/
CREATE TABLE belt
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_49 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE belt COMMENT '安全带';

/*==============================================================*/
/* 8.Table: blogInformation                                       */
/*==============================================================*/
CREATE TABLE blogInformation
(
   blogId               INT NOT NULL AUTO_INCREMENT,
   blogImageSrc         VARCHAR(50) NOT NULL,
   blogTitle            VARCHAR(20) NOT NULL,
   blogContent          VARCHAR(100) NOT NULL,
   blogDate             DATE NOT NULL,
   blogLable            VARCHAR(50) NOT NULL,
   PRIMARY KEY (blogId)
);

ALTER TABLE blogInformation COMMENT '博客信息表';

/*==============================================================*/
/* 9.Table: clothes                                               */
/*==============================================================*/
CREATE TABLE clothes
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(4) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_53 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE clothes COMMENT '衣服表';

/*==============================================================*/
/* 10.Table: userAddress                                           */
/*==============================================================*/
CREATE TABLE userAddress
(
   userId               INT NOT NULL,
   userAddress1         VARCHAR(50) NOT NULL,
   userName             VARCHAR(10) NOT NULL,
   phoneName            VARCHAR(11) NOT NULL,
   CONSTRAINT FK_Reference_41 FOREIGN KEY (userID)
      REFERENCES userRegist (userID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE userAddress COMMENT '用户收货地址表';

/*==============================================================*/
/* 11.Table: defaultAddress                                        */
/*==============================================================*/
CREATE TABLE defaultAddress
(
   userId               INT UNIQUE NOT NULL,
   defaultAddress       VARCHAR(50) NOT NULL,
   userName             VARCHAR(10) NOT NULL,
   phoneName            VARCHAR(11) NOT NULL,
   PRIMARY KEY (userId)
);

ALTER TABLE defaultAddress COMMENT '用户默认地址表';

/*==============================================================*/
/* 12.Table: glasses                                               */
/*==============================================================*/
CREATE TABLE glasses
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_36 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE glasses COMMENT '眼镜表';

/*==============================================================*/
/* 13.Table: glove                                                 */
/*==============================================================*/
CREATE TABLE glove
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_35 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE glove COMMENT '手套';

/*==============================================================*/
/* 14.Table: helmet                                                */
/*==============================================================*/
CREATE TABLE helmet
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_38 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE helmet COMMENT '头盔表';

/*==============================================================*/
/* 15.Table: pants                                                 */
/*==============================================================*/
CREATE TABLE pants
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_52 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE pants COMMENT '裤子表';

/*==============================================================*/
/* 16.Table: shoes                                                 */
/*==============================================================*/
CREATE TABLE shoes
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   symmetry             VARCHAR(10) NOT NULL,
   shoesTread           VARCHAR(10),
   shoesInsole          VARCHAR(10),
   shoesOuter           VARCHAR(10),
   exerciseName         VARCHAR(10) NOT NULL,
   weight               DECIMAL(4,2) NOT NULL,/*重量*/
   breathability        VARCHAR(3) NOT NULL,/*透气性*/
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_54 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE shoes COMMENT '鞋子表';


/*==============================================================*/
/* 18.Table: safelock                                              */
/*==============================================================*/
CREATE TABLE safelock
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_57 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE safelock COMMENT '安全锁表';

/*==============================================================*/
/* 19.Table: hat                                                   */
/*==============================================================*/
CREATE TABLE hat
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_47 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE hat COMMENT '帽子';

/*==============================================================*/
/* 20.Table: ski                                                   */
/*==============================================================*/
CREATE TABLE ski
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_50 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE ski COMMENT '滑雪板';

/*==============================================================*/
/* 21.Table: hairBelt                                              */
/*==============================================================*/
CREATE TABLE hairBelt
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_34 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE hairBelt COMMENT '发带表';

/*==============================================================*/
/* 22.Table: kneepad                                               */
/*==============================================================*/
CREATE TABLE kneepad
(
   goodsId              INT NOT NULL AUTO_INCREMENT,
   goodsKind            INT NOT NULL,
   goodsname            VARCHAR(20) NOT NULL,
   des                  VARCHAR(50) NOT NULL,
   sex                  VARCHAR(2) NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   state                VARCHAR(2) NOT NULL,
   PRIMARY KEY (goodsId),
   CONSTRAINT FK_Reference_37 FOREIGN KEY (goodsKind)
      REFERENCES exercise (goodsKind) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE kneepad COMMENT '护膝表';

/*==============================================================*/
/* 25.Table: kneepadFlexibility                                    */
/*==============================================================*/
CREATE TABLE kneepadFlexibility
(
   goodsId              INT NOT NULL,
   flexibility          VARCHAR(10) NOT NULL,
   CONSTRAINT FK_Reference_33 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE kneepadFlexibility COMMENT '护膝柔韧度';

/*==============================================================*/
/* 26.Table: kneepadThickness                                      */
/*==============================================================*/
CREATE TABLE kneepadThickness
(
   goodsId              INT NOT NULL,
   thickness            VARCHAR(10) NOT NULL,
   CONSTRAINT FK_Reference_32 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE kneepadThickness COMMENT '护膝厚度表';

/*==============================================================*/
/* 23.Table: goodsImages                                           */
/*==============================================================*/
CREATE TABLE goodsImages
(
   goodsKindId          INT NOT NULL,
   goodsId              INT NOT NULL,
   exerciseName         VARCHAR(10) NOT NULL,
   src1                 VARCHAR(50) NOT NULL,
   src2                 VARCHAR(50) NOT NULL,
   src3                 VARCHAR(50) NOT NULL,
   src4                 VARCHAR(50) NOT NULL,
   src5                 VARCHAR(50) NOT NULL,
   src6                 VARCHAR(50) NOT NULL,
   src7                 VARCHAR(50) NOT NULL,
   src8                 VARCHAR(50) NOT NULL,
   CONSTRAINT FK_Reference_146 FOREIGN KEY (goodsId)
      REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_147 FOREIGN KEY (goodsId)
      REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_148 FOREIGN KEY (goodsId)
      REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_149 FOREIGN KEY (goodsId)
      REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_150 FOREIGN KEY (goodsId)
      REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_151 FOREIGN KEY (goodsId)
      REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_152 FOREIGN KEY (goodsId)
      REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_153 FOREIGN KEY (goodsId)
      REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_154 FOREIGN KEY (goodsId)
      REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_155 FOREIGN KEY (goodsId)
      REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_156 FOREIGN KEY (goodsId)
      REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_157 FOREIGN KEY (goodsId)
      REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_158 FOREIGN KEY (goodsId)
      REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_159 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE goodsImages COMMENT '商品图片表';

/*==============================================================*/
/* 24.Table: goodsMP                                               */
/*==============================================================*/
CREATE TABLE goodsMP
(
   goodsKindId          INT NOT NULL,
   goodsId              INT NOT NULL,
   exerciseName         VARCHAR(20) NOT NULL,
   material             VARCHAR(10) NOT NULL,
   price                DECIMAL(6,2) NOT NULL,
   inprice              DECIMAL(6,2) NOT NULL,
   CONSTRAINT FK_Reference_132 FOREIGN KEY (goodsId)
      REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_133 FOREIGN KEY (goodsId)
      REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_134 FOREIGN KEY (goodsId)
      REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_135 FOREIGN KEY (goodsId)
      REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_136 FOREIGN KEY (goodsId)
      REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_137 FOREIGN KEY (goodsId)
      REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_138 FOREIGN KEY (goodsId)
      REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_139 FOREIGN KEY (goodsId)
      REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_140 FOREIGN KEY (goodsId)
      REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_141 FOREIGN KEY (goodsId)
      REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_142 FOREIGN KEY (goodsId)
      REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_143 FOREIGN KEY (goodsId)
      REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_144 FOREIGN KEY (goodsId)
      REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_145 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);
ALTER TABLE goodsMP COMMENT '商品材质价格表';





/*==============================================================*/
/* 27.Table: shoppingCar                                           */
/*==============================================================*/
CREATE TABLE shoppingCar
(
   userId               INT NOT NULL,
   goodsKind            INT NOT NULL,
   goodsId              INT NOT NULL,
   goodsImageSrc        VARCHAR(50) NOT NULL,
   goodsName            VARCHAR(50) NOT NULL,
   goodsSize            VARCHAR(10) NOT NULL,
   goodsColor           VARCHAR(10) NOT NULL,
   goodsPrice           DECIMAL(6,2) NOT NULL,
   goodsNum             VARCHAR(4) NOT NULL,
   CONSTRAINT FK_Reference_190 FOREIGN KEY (userID)
      REFERENCES userRegist (userID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_76 FOREIGN KEY (goodsId)
      REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_77 FOREIGN KEY (goodsId)
      REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_78 FOREIGN KEY (goodsId)
      REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_79 FOREIGN KEY (goodsId)
      REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_80 FOREIGN KEY (goodsId)
      REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_81 FOREIGN KEY (goodsId)
      REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_82 FOREIGN KEY (goodsId)
      REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_83 FOREIGN KEY (goodsId)
      REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_84 FOREIGN KEY (goodsId)
      REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_85 FOREIGN KEY (goodsId)
      REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_86 FOREIGN KEY (goodsId)
      REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_87 FOREIGN KEY (goodsId)
      REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_88 FOREIGN KEY (goodsId)
      REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_89 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE shoppingCar COMMENT '购物车表';

/*==============================================================*/
/* 28.Table: userCollect                                           */
/*==============================================================*/
CREATE TABLE userCollect
(
   userId               INT NOT NULL,
   goodsKind            INT NOT NULL,
   goodsId              INT NOT NULL,
   CONSTRAINT FK_Reference_39 FOREIGN KEY (userID)
      REFERENCES userRegist (userID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_62 FOREIGN KEY (goodsId)
      REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_63 FOREIGN KEY (goodsId)
      REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_64 FOREIGN KEY (goodsId)
      REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_65 FOREIGN KEY (goodsId)
      REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_66 FOREIGN KEY (goodsId)
      REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_67 FOREIGN KEY (goodsId)
      REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_68 FOREIGN KEY (goodsId)
      REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_69 FOREIGN KEY (goodsId)
      REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_70 FOREIGN KEY (goodsId)
      REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_71 FOREIGN KEY (goodsId)
      REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_72 FOREIGN KEY (goodsId)
      REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_73 FOREIGN KEY (goodsId)
      REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_74 FOREIGN KEY (goodsId)
      REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_75 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE userCollect COMMENT '用户收藏表';

/*==============================================================*/
/* 29.Table: userOrder                                             */
/*==============================================================*/
CREATE TABLE userOrder
(
   orderNo              INT PRIMARY KEY AUTO_INCREMENT,
   orderId              VARCHAR(20) NOT NULL,/*订单编号 时间为编号*/
   userId               INT NOT NULL,
   goodsId              INT NOT NULL,
   goodsKind            INT NOT NULL,
   goodsImageSrc        VARCHAR(50) NOT NULL,
   goodsName            VARCHAR(50) NOT NULL,
   goodsSize            VARCHAR(10) NOT NULL,
   goodsColor           VARCHAR(10) NOT NULL,
   goodsPrice           DECIMAL(6,2) NOT NULL,
   goodsNum             VARCHAR(4) NOT NULL,
   payTime              DATE NOT NULL,
   getTime              DATE NOT NULL,
   userOderAddress      VARCHAR(50) NOT NULL,
   isPay                INT NOT NULL,/*是否付款   1-付款  2-未付款*/
   isDelivery           INT NOT NULL,/*是否发货   1-发货  2-未发货*/
   isArriva             INT NOT NULL,/*是否收获   1-收货  2-未收货*/
   CONSTRAINT FK_Reference_170 FOREIGN KEY (userID)
      REFERENCES userRegist (userID) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_90 FOREIGN KEY (goodsId)
      REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_91 FOREIGN KEY (goodsId)
      REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_92 FOREIGN KEY (goodsId)
      REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_93 FOREIGN KEY (goodsId)
      REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_94 FOREIGN KEY (goodsId)
      REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_95 FOREIGN KEY (goodsId)
      REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_96 FOREIGN KEY (goodsId)
      REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_97 FOREIGN KEY (goodsId)
      REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_98 FOREIGN KEY (goodsId)
      REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_99 FOREIGN KEY (goodsId)
      REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_100 FOREIGN KEY (goodsId)
      REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_101 FOREIGN KEY (goodsId)
      REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_102 FOREIGN KEY (goodsId)
      REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
   CONSTRAINT FK_Reference_103 FOREIGN KEY (goodsId)
      REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

ALTER TABLE userOrder COMMENT '用户历史订单';


/*==============================================================*/
/* 30.Table: goodsStock                                             */
/*==============================================================*/

CREATE TABLE goodsStock
(
goodsKindId          INT NOT NULL,
goodsId              INT NOT NULL,
exerciseName         VARCHAR(10) NOT NULL,
color                VARCHAR(10) NOT NULL,
size                 VARCHAR(10) NOT NULL, 
num                  INT NOT NULL,
CONSTRAINT FK_Reference_104 FOREIGN KEY (goodsId)
	REFERENCES helmet (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_105 FOREIGN KEY (goodsId)
	REFERENCES pants (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_106 FOREIGN KEY (goodsId)
	REFERENCES clothes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_107 FOREIGN KEY (goodsId)
	REFERENCES shoes (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_108 FOREIGN KEY (goodsId)
	REFERENCES alpenstock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_109 FOREIGN KEY (goodsId)
        REFERENCES bag (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_110 FOREIGN KEY (goodsId)
        REFERENCES safelock (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_111 FOREIGN KEY (goodsId)
        REFERENCES hat (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_112 FOREIGN KEY (goodsId)
        REFERENCES belt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_113 FOREIGN KEY (goodsId)
        REFERENCES ski (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_114 FOREIGN KEY (goodsId)
        REFERENCES hairBelt (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_115 FOREIGN KEY (goodsId)
        REFERENCES glove (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_116 FOREIGN KEY (goodsId)
        REFERENCES glasses (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT FK_Reference_117 FOREIGN KEY (goodsId)
        REFERENCES kneepad (goodsId) ON DELETE RESTRICT ON UPDATE RESTRICT
);
ALTER TABLE goodsStock COMMENT '库存表';


/*==============================================================*/
/* 32.Table: administrator                              */
/*==============================================================*/
CREATE TABLE administrator(
adm_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
adm_password VARCHAR(100) NOT NULL,
adm_name VARCHAR(300) NOT NULL,
adm_tel VARCHAR(30) NOT NULL,
adm_attribute VARCHAR(20) NOT NULL,/*管理员属性   1---超级管理员 ，2----管理员*/
adm_isNo CHAR(10) NOT NULL /*是否禁用该账号   1---不禁用   2---禁用*/
);
ALTER TABLE administrator COMMENT '管理员表';


/*==============================================================*/
/* 31.Table: permissions                              */
/*==============================================================*/
CREATE TABLE permissions(
adm_id  INT NOT NULL,
permission_name VARCHAR(20) NOT NULL,
CONSTRAINT FK_Reference_161 FOREIGN KEY (adm_id)
        REFERENCES administrator (adm_id) ON DELETE RESTRICT ON UPDATE RESTRICT  
);

ALTER TABLE permissions COMMENT '管理员权限表';


/*==============================================================*/
/* 33.Table: returnOrder                              */
/*==============================================================*/
CREATE TABLE returnOrder
(
/*均从订单获取过来*/
orderNo              INT NOT NULL,
orderId              VARCHAR(20) NOT NULL,/*订单编号 时间为编号*/
userId               INT NOT NULL,
goodsId              INT NOT NULL,
goodsKind            INT NOT NULL,
state                INT NOT NULL,/*退货状态   1，2，3，4*/
CONSTRAINT FK_Reference_180 FOREIGN KEY (orderNo)
        REFERENCES userorder (orderNo) ON DELETE RESTRICT ON UPDATE RESTRICT
);
/*==============================================================*/
/* 34.Table: changeOrder                              */
/*==============================================================*/
CREATE TABLE changeOrder
(
/*均从订单获取过来*/
orderNo              INT NOT NULL,
orderId              VARCHAR(20) NOT NULL,/*订单编号 时间为编号*/
userId               INT NOT NULL,
goodsId              INT NOT NULL,
goodsKind            INT NOT NULL,
state                INT NOT NULL,/*退货状态   1，2，3，4*/
CONSTRAINT FK_Reference_181 FOREIGN KEY (orderNo)
        REFERENCES userorder (orderNo) ON DELETE RESTRICT ON UPDATE RESTRICT
);																																		
																																	
