/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : second_hand_db

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-05-01 23:23:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `AID` int(11) NOT NULL auto_increment,
  `NAME` varchar(50) collate utf8_unicode_ci default NULL,
  `PASSWORD` varchar(20) collate utf8_unicode_ci default NULL,
  `ROLE` int(11) default NULL,
  PRIMARY KEY  (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `tb_admin` VALUES ('2', 'admin1', 'admin', '1');
INSERT INTO `tb_admin` VALUES ('3', 'admin2', 'admin', '1');
INSERT INTO `tb_admin` VALUES ('4', 'admin4', 'admin', '1');

-- ----------------------------
-- Table structure for `tb_classify`
-- ----------------------------
DROP TABLE IF EXISTS `tb_classify`;
CREATE TABLE `tb_classify` (
  `CID` int(11) NOT NULL auto_increment,
  `CNAME` varchar(255) collate utf8_unicode_ci default NULL,
  `CSORT` int(11) default NULL,
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_classify
-- ----------------------------
INSERT INTO `tb_classify` VALUES ('1', '学习工具', '1');
INSERT INTO `tb_classify` VALUES ('2', '生活用品', '2');
INSERT INTO `tb_classify` VALUES ('3', '体育器材', '3');
INSERT INTO `tb_classify` VALUES ('4', '音乐器材', '4');
INSERT INTO `tb_classify` VALUES ('5', '电子产品', '5');
INSERT INTO `tb_classify` VALUES ('6', '书籍', '6');
INSERT INTO `tb_classify` VALUES ('7', '代步工具', '7');

-- ----------------------------
-- Table structure for `tb_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL auto_increment,
  `CONTENT` varchar(50) collate utf8_unicode_ci default NULL,
  `CREATE_TIME` datetime default NULL,
  `STATUS` int(11) default NULL,
  `USER_ID` int(11) default NULL,
  `PRODUCT_ID` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK38AF558E71F31D9F` (`USER_ID`),
  KEY `FK38AF558E5EB80175` (`PRODUCT_ID`),
  CONSTRAINT `FK38AF558E5EB80175` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `tb_product` (`ID`),
  CONSTRAINT `FK38AF558E71F31D9F` FOREIGN KEY (`USER_ID`) REFERENCES `tb_user` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_mycart`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mycart`;
CREATE TABLE `tb_mycart` (
  `ID` int(11) NOT NULL auto_increment,
  `USER_ID` int(11) default NULL,
  `PRODUCT_ID` int(11) default NULL,
  `CREATE_TIME` datetime default NULL,
  `NUM` int(11) default NULL,
  `COUNT` double default NULL,
  `PRODUCT_NAME` varchar(255) collate utf8_unicode_ci default NULL,
  `TOTAL` double default NULL,
  `PRODUCT_PIC` varchar(255) collate utf8_unicode_ci default NULL,
  `PRODUCT_DESC` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_mycart
-- ----------------------------
INSERT INTO `tb_mycart` VALUES ('10', '1', '1', '2017-05-01 17:27:33', '1', '50', '书本3件套', '50', '1493544466184.jpg', '在当当网买的，已经看完，8.5成新，欢迎购买。');
INSERT INTO `tb_mycart` VALUES ('11', '1', '3', '2017-05-01 17:27:37', '1', '25', '《javaee开发指南》', '25', '1493546836921.jpg', '已经学完，内附独家笔记。7成新。');
INSERT INTO `tb_mycart` VALUES ('12', '1', '7', '2017-05-01 17:27:40', '1', '750', 'HTC触屏智能手机', '750', '1493547197946.jpg', 'HTC触屏智能手机HTC触屏智能手机HTC触屏智能手机.用了1年，8。5成新。现在想换新iphone，所以想处理掉这台手机');
INSERT INTO `tb_mycart` VALUES ('13', '1', '8', '2017-05-01 17:27:41', '1', '1200', 'ipad', '1200', '1493547279361.jpg', '用了半年。9成新。具体可私聊。');
INSERT INTO `tb_mycart` VALUES ('14', '1', '11', '2017-05-01 17:27:44', '1', '32', '体育器材1', '32', '1493547468473.jpg', '体育器材1体育器材1体育器材1体育器材1体育器材1');
INSERT INTO `tb_mycart` VALUES ('15', '1', '15', '2017-05-01 17:27:57', '1', '200', 'XX牌自行车', '200', '1493630233102.jpg', '大二购买，现在毕业，用了2年，8成新。很好骑，不会感到吃力。若有意购买可以直接购买。先买先得，仅有一辆。');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL,
  `CREATE_TIME` datetime default NULL,
  `STATUS` int(11) default NULL,
  `PERSON_NAME` varchar(50) collate utf8_unicode_ci default NULL,
  `PHONE` varchar(255) collate utf8_unicode_ci default NULL,
  `AMOUNT` double default NULL,
  `ADDRESS` varchar(255) collate utf8_unicode_ci default NULL,
  `PAYWAY` varchar(50) collate utf8_unicode_ci default NULL,
  `CREATOR` int(11) default NULL,
  `USER_ID` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKFA98EE3D71F31D9F` (`USER_ID`),
  CONSTRAINT `FKFA98EE3D71F31D9F` FOREIGN KEY (`USER_ID`) REFERENCES `tb_user` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `id` int(11) NOT NULL auto_increment,
  `COUNT` double default NULL,
  `NUM` int(11) default NULL,
  `PRO_ID` int(11) default NULL,
  `ORDER_ID` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK734FA3D5BBD45AF7` (`PRO_ID`),
  KEY `FK734FA3D5258ABBD5` (`ORDER_ID`),
  CONSTRAINT `FK734FA3D5258ABBD5` FOREIGN KEY (`ORDER_ID`) REFERENCES `tb_order` (`id`),
  CONSTRAINT `FK734FA3D5BBD45AF7` FOREIGN KEY (`PRO_ID`) REFERENCES `tb_product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `ID` int(11) NOT NULL auto_increment,
  `PRO_NAME` varchar(255) collate utf8_unicode_ci default NULL,
  `PRO_PICTURE` varchar(255) collate utf8_unicode_ci default NULL,
  `CREATE_TIME` datetime default NULL,
  `PRO_PRICE` double default NULL,
  `PRO_HASSUM` int(11) default NULL,
  `PRO_DESC` varchar(255) collate utf8_unicode_ci default NULL,
  `PRO_CLICKNUM` int(11) default NULL,
  `TYPE` int(11) default NULL,
  `CLASSIFY_ID` int(11) default NULL,
  `CREATOR_ID` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FKED97341E2E370C7F` (`CLASSIFY_ID`),
  KEY `FKED97341ECCEF219E` (`CREATOR_ID`),
  CONSTRAINT `FKED97341ECCEF219E` FOREIGN KEY (`CREATOR_ID`) REFERENCES `tb_user` (`UID`),
  CONSTRAINT `FKED97341E2E370C7F` FOREIGN KEY (`CLASSIFY_ID`) REFERENCES `tb_classify` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', '书本3件套', '1493544466184.jpg', '2017-04-30 17:27:46', '50', '1', '在当当网买的，已经看完，8.5成新，欢迎购买。', '3', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('2', '《人间失格》', '1493546216918.jpg', '2017-04-30 17:56:56', '30', '1', '当当网购买的，全新，买错了，过了时间不能退了。', '1', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('3', '《javaee开发指南》', '1493546836921.jpg', '2017-04-30 18:07:16', '25', '1', '已经学完，内附独家笔记。7成新。', '0', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('4', '心理学', '1493546908376.jpg', '2017-04-30 18:08:28', '20', '1', '心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学心理学', '0', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('5', '安卓', '1493546972674.jpg', '2017-04-30 18:09:32', '35', '1', '安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书安卓书', '0', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('6', '《幻夜》', '1493547055058.jpg', '2017-04-30 18:10:55', '45', '1', '全新。《幻夜》《幻夜》《幻夜》《幻夜》《幻夜》', '0', '0', '6', '1');
INSERT INTO `tb_product` VALUES ('7', 'HTC触屏智能手机', '1493547197946.jpg', '2017-04-30 18:13:17', '750', '1', 'HTC触屏智能手机HTC触屏智能手机HTC触屏智能手机.用了1年，8。5成新。现在想换新iphone，所以想处理掉这台手机', '1', '0', '5', '1');
INSERT INTO `tb_product` VALUES ('8', 'ipad', '1493547279361.jpg', '2017-04-30 18:14:39', '1200', '1', '用了半年。9成新。具体可私聊。', '10', '0', '5', '1');
INSERT INTO `tb_product` VALUES ('9', '学习用具1', '1493547355427.jpg', '2017-04-30 18:15:55', '10', '1', '低价出售学习用具1', '0', '0', '1', '1');
INSERT INTO `tb_product` VALUES ('10', '生活用品1', '1493547417919.jpg', '2017-04-30 18:16:57', '20', '3', '生活用品1生活用品1生活用品1生活用品1', '0', '0', '2', '1');
INSERT INTO `tb_product` VALUES ('11', '体育器材1', '1493547468473.jpg', '2017-04-30 18:17:48', '32', '5', '体育器材1体育器材1体育器材1体育器材1体育器材1', '0', '0', '3', '1');
INSERT INTO `tb_product` VALUES ('12', '音乐器材1', '1493547532829.jpg', '2017-04-30 18:18:52', '79', '2', '音乐器材1音乐器材1音乐器材1音乐器材1音乐器材1', '0', '0', '4', '1');
INSERT INTO `tb_product` VALUES ('13', '代步工具1', '1493547607038.jpg', '2017-04-30 18:20:07', '126', '1', '代步工具1代步工具1代步工具1代步工具1代步工具1', '0', '0', '7', '1');
INSERT INTO `tb_product` VALUES ('14', '学习用具2', '1493547691389.jpg', '2017-04-30 18:21:31', '15', '1', '求此类学习用具2，如图所示。', '0', '1', '1', '1');
INSERT INTO `tb_product` VALUES ('15', 'XX牌自行车', '1493630233102.jpg', '2017-05-01 17:17:13', '200', '1', '大二购买，现在毕业，用了2年，8成新。很好骑，不会感到吃力。若有意购买可以直接购买。先买先得，仅有一辆。', '0', '0', '7', '1');

-- ----------------------------
-- Table structure for `tb_reply`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply` (
  `ID` int(11) NOT NULL auto_increment,
  `CREATE_TIME` datetime default NULL,
  `REPLY` varchar(100) collate utf8_unicode_ci default NULL,
  `USER_ID` int(11) default NULL,
  `COMMENT_ID` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FKFABD79D971F31D9F` (`USER_ID`),
  KEY `FKFABD79D976EB4B75` (`COMMENT_ID`),
  CONSTRAINT `FKFABD79D976EB4B75` FOREIGN KEY (`COMMENT_ID`) REFERENCES `tb_comment` (`id`),
  CONSTRAINT `FKFABD79D971F31D9F` FOREIGN KEY (`USER_ID`) REFERENCES `tb_user` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `UID` int(11) NOT NULL auto_increment,
  `USERNAME` varchar(255) collate utf8_unicode_ci default NULL,
  `HEADPIC` varchar(255) collate utf8_unicode_ci default NULL,
  `SCHOOLCLASS` varchar(255) collate utf8_unicode_ci default NULL,
  `SEX` int(11) default NULL,
  `ADDRESS` varchar(255) collate utf8_unicode_ci default NULL,
  `PHONE` varchar(255) collate utf8_unicode_ci default NULL,
  `PASSWORD` varchar(255) collate utf8_unicode_ci default NULL,
  `QUSETION` varchar(255) collate utf8_unicode_ci default NULL,
  `ANSWER` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'zyf', 'images/logo-s.jpg', '13计科1班', null, '华商学院西区5B214', '1008611', '123456a', '我姓什么？', '张');
INSERT INTO `tb_user` VALUES ('2', '张燕芳', 'images/logo-s.jpg', '13计科1班', null, '西区5', '18814134815', '123456a', '学号是？', '413240162');

-- ----------------------------
-- Table structure for `tb_user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_admin`;
CREATE TABLE `tb_user_admin` (
  `ID` int(11) NOT NULL auto_increment,
  `USER_ID` int(11) default NULL,
  `CREATE_TIME` datetime default NULL,
  `ADMIN_ID` int(11) default NULL,
  `MESSAGE` varchar(100) collate utf8_unicode_ci default NULL,
  `STATUS` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user_admin
-- ----------------------------
