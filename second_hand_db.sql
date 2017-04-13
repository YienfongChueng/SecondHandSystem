/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : second_hand_db

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-13 22:58:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `AID` int(8) NOT NULL auto_increment,
  `NAME` varchar(50) collate utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(20) collate utf8_unicode_ci NOT NULL,
  `ROLE` int(8) NOT NULL default '0' COMMENT '0 超级管理员  1系统管理员',
  PRIMARY KEY  (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `tb_admin` VALUES ('4', 'zyf', '123', '0');
INSERT INTO `tb_admin` VALUES ('5', 'qaz', '123', '0');
INSERT INTO `tb_admin` VALUES ('6', 'wsx', '123', '1');
INSERT INTO `tb_admin` VALUES ('7', 'qaz', '123', '0');
INSERT INTO `tb_admin` VALUES ('8', 'qwe', '123', '0');
INSERT INTO `tb_admin` VALUES ('9', 'plm', '123', '0');

-- ----------------------------
-- Table structure for `tb_classify`
-- ----------------------------
DROP TABLE IF EXISTS `tb_classify`;
CREATE TABLE `tb_classify` (
  `CID` int(8) NOT NULL auto_increment,
  `CNAME` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '商品分类名称',
  `CSORT` int(8) default NULL COMMENT '排序',
  PRIMARY KEY  (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_classify
-- ----------------------------
INSERT INTO `tb_classify` VALUES ('2', '电子产品', '2');
INSERT INTO `tb_classify` VALUES ('3', '书籍资料', '3');
INSERT INTO `tb_classify` VALUES ('4', '体育器材', '4');
INSERT INTO `tb_classify` VALUES ('5', '乐器器材', '5');
INSERT INTO `tb_classify` VALUES ('6', '生活用品', '6');

-- ----------------------------
-- Table structure for `tb_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `ID` int(8) NOT NULL auto_increment COMMENT '主键id',
  `PRODUCT_ID` int(8) NOT NULL COMMENT '商品id',
  `CREATE_TIME` datetime NOT NULL COMMENT '评论时间',
  `USER_ID` int(8) NOT NULL COMMENT '评论人id',
  `CONTENT` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `STATUS` int(8) NOT NULL default '0' COMMENT '0未读，1已读',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ID` int(8) NOT NULL auto_increment COMMENT '主键id',
  `STATUS` int(8) NOT NULL COMMENT '订单状态（0：待付款 1：待发货 2：待收货）',
  `CREATE_TIME` datetime NOT NULL COMMENT '订单时间',
  `ADDRESS` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '送货地址',
  `AMOUNT` double(50,0) NOT NULL COMMENT '订单金额',
  `PHONE` int(20) NOT NULL COMMENT '订单电话',
  `PERSON_NAME` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '订单收货人',
  `USER_ID` int(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_item`;
CREATE TABLE `tb_order_item` (
  `ID` int(8) NOT NULL COMMENT '主键id',
  `PRO_ID` int(8) NOT NULL COMMENT '商品id',
  `ORDER_ID` int(8) NOT NULL COMMENT '订单id',
  `NUM` int(20) NOT NULL COMMENT '数量',
  `COUNT` double(50,0) NOT NULL COMMENT '小计',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `ID` int(8) NOT NULL auto_increment COMMENT '主键id',
  `PRO_NAME` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '商品名称',
  `PRO_PICTURE` varchar(256) collate utf8_unicode_ci default NULL COMMENT '商品图片',
  `CREATE_TIME` datetime NOT NULL COMMENT '发布时间',
  `PRO_PRICE` double(16,0) default NULL COMMENT '商品单价',
  `PRO_HASSUM` int(8) default NULL COMMENT '商品库存',
  `PRO_DESC` varchar(200) collate utf8_unicode_ci default NULL COMMENT '商品描述',
  `PRO_CLICKNUM` int(8) NOT NULL default '0' COMMENT '商品点击次数',
  `CREATOR_ID` int(8) NOT NULL COMMENT '发布者id',
  `CLASSIFY_ID` int(8) NOT NULL COMMENT '分类id',
  `TYPE` int(8) NOT NULL COMMENT '0供信息，1求信息',
  PRIMARY KEY  (`ID`),
  KEY `FKED97341ECCEF219E` USING BTREE (`CREATOR_ID`),
  KEY `FKED97341E2E370C7F` USING BTREE (`CLASSIFY_ID`),
  CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`CLASSIFY_ID`) REFERENCES `tb_classify` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_product_ibfk_2` FOREIGN KEY (`CREATOR_ID`) REFERENCES `tb_user` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='InnoDB free: 11264 kB; (`CLASSIFY_ID`) REFER `second_hand_db';

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('3', '333', 'logo-m.png', '2017-03-08 11:46:11', '34', '2', '回顾恶化噶人', '0', '1', '5', '0');
INSERT INTO `tb_product` VALUES ('6', 'java书', 'logo-m.png', '2017-03-13 14:04:52', '23', '2', '九成新', '0', '1', '2', '0');

-- ----------------------------
-- Table structure for `tb_reply`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply` (
  `ID` int(8) NOT NULL auto_increment,
  `COMMENT_ID` int(8) NOT NULL COMMENT '评论表id',
  `CREATE_TIME` datetime NOT NULL COMMENT '回复时间',
  `USER_ID` int(8) NOT NULL COMMENT '回复者id',
  `REPLY` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '回复内容',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `UID` int(8) NOT NULL auto_increment COMMENT '主键id',
  `USERNAME` varchar(50) collate utf8_unicode_ci NOT NULL COMMENT '用户姓名',
  `HEADPIC` varchar(56) collate utf8_unicode_ci default NULL COMMENT '头像',
  `SCHOOL_CLASS` varchar(50) collate utf8_unicode_ci default NULL COMMENT '班级',
  `SEX` int(6) default '0' COMMENT '性别（男：0   女：1）',
  `ADDRESS` varchar(56) collate utf8_unicode_ci default NULL COMMENT '地址',
  `PHONE` int(20) default NULL COMMENT '用户电话',
  `PASSWORD` varchar(20) collate utf8_unicode_ci default NULL COMMENT '用户密码',
  `QUESTION` varchar(50) collate utf8_unicode_ci default NULL COMMENT '密码找回的设置问题',
  `ANSWER` varchar(50) collate utf8_unicode_ci default NULL COMMENT '密码找回设置答案',
  PRIMARY KEY  (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'zyf', null, null, '0', null, null, '123', null, null);
INSERT INTO `tb_user` VALUES ('2', 'chueng321', null, '13计科1班', '1', '华商321', '1008611', '123', '姓什么？', null);

-- ----------------------------
-- Table structure for `tb_user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_admin`;
CREATE TABLE `tb_user_admin` (
  `ID` int(8) NOT NULL auto_increment,
  `USER_ID` int(8) NOT NULL,
  `ADMIN_ID` int(8) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `MESSAGE` varchar(100) collate utf8_unicode_ci NOT NULL,
  `STATUS` int(8) NOT NULL default '0' COMMENT '0未读，1已读',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user_admin
-- ----------------------------
