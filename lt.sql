/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : lt

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-07-05 08:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` bigint NOT NULL,
  `ausername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alevel` int DEFAULT NULL COMMENT '权限级别',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for attribute_key
-- ----------------------------
DROP TABLE IF EXISTS `attribute_key`;
CREATE TABLE `attribute_key` (
  `id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `attribute_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `attribute_name` (`attribute_name`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value` (
  `id` bigint NOT NULL,
  `attribute_id` bigint NOT NULL,
  `attribute_value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性value值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `attribute_id` (`attribute_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `cart_num` int DEFAULT '0' COMMENT '购买数量',
  `commodity_state` int DEFAULT '1' COMMENT '"1"表示“可以购买”，”0“表示“商品已失效”',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父类id',
  `category_level` int DEFAULT NULL COMMENT '分类层级',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `uid` bigint DEFAULT NULL,
  `comment_data` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `cid` bigint NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cprice` decimal(10,2) NOT NULL,
  `cnum` int NOT NULL DEFAULT '0',
  `attribute_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '规格列表',
  `cdetail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '商品介绍',
  `cpicture` blob COMMENT '图片',
  `category_id` bigint NOT NULL,
  `csales` int DEFAULT '0',
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE KEY `cname` (`cname`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for commodity_specs
-- ----------------------------
DROP TABLE IF EXISTS `commodity_specs`;
CREATE TABLE `commodity_specs` (
  `id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `c_specs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品规格',
  `c_stock` int DEFAULT '0',
  `cprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for lt_order
-- ----------------------------
DROP TABLE IF EXISTS `lt_order`;
CREATE TABLE `lt_order` (
  `order_id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `logistic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '物流情况',
  `order_state` int DEFAULT '0' COMMENT '“0”表示未收到，“1”表示已收到',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `logistic` text COMMENT '物流情况',
  `order_state` int DEFAULT '0' COMMENT '“0”表示未收到，“1”表示已收到',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `Order_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `cnum` int DEFAULT '0' COMMENT '单个商品购买数量',
  `cprice` decimal(10,2) DEFAULT NULL COMMENT '商品单/总价(同一件商品的总价)',
  PRIMARY KEY (`Order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `sid` bigint NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `saddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话11位',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upicture` blob COMMENT '头像',
  `umail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `uaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户地址',
  `uphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话号码',
  `ulevel` int DEFAULT NULL COMMENT 'vip等级',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
