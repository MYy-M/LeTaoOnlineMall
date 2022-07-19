/*
 Navicat MySQL Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : lt

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 19/07/2022 20:05:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` bigint NOT NULL,
  `ausername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alevel` int NULL DEFAULT NULL COMMENT '权限级别',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_key
-- ----------------------------
DROP TABLE IF EXISTS `attribute_key`;
CREATE TABLE `attribute_key`  (
  `id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `attribute_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_key
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value`  (
  `id` bigint NOT NULL,
  `attribute_id` bigint NOT NULL,
  `attribute_value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性value值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attribute_id`(`attribute_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `cs_id` bigint NOT NULL,
  `cart_num` int NULL DEFAULT 0 COMMENT '购买数量',
  `commodity_state` int NULL DEFAULT 1 COMMENT '\"1\"表示“可以购买”，”0“表示“商品已失效”',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1548902149897883650, 1548882891587461122, 1, 18, 1);
INSERT INTO `cart` VALUES (1548937386522611714, 1548882891587461122, 2, 2, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父类id',
  `category_level` int NULL DEFAULT NULL COMMENT '分类层级',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1549330229259001859 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1549325503800926209, '电器', 0, 1);
INSERT INTO `category` VALUES (1549326207408005121, '手机', 1549325503800926209, 2);
INSERT INTO `category` VALUES (1549326247098703873, '电脑', 1549325503800926209, 2);
INSERT INTO `category` VALUES (1549326325611880450, '平板', 1549325503800926209, 2);
INSERT INTO `category` VALUES (1549326356528095233, '家电', 1549325503800926209, 2);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `cid` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1549323122690273282, 1548882891587461122, 1546337342148505603);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `uid` bigint NULL DEFAULT NULL,
  `comment_data` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cprice` decimal(10, 2) NOT NULL,
  `cnum` int NOT NULL DEFAULT 0,
  `attribute_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '规格列表',
  `cpicture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `cdetail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品介绍',
  `category_id` bigint NOT NULL,
  `csales` int NULL DEFAULT 0,
  `is_recommend` int NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1546337342148505810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (1546337342148505603, 'Redmi K50 8GB+128GB', 2399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/55098d0d1d85c73c6bfc07e88fb9a3a3.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505604, 'Redmi Note 11T Pro 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505605, 'Redmi 10A 4GB+64GB', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505606, 'Redmi Note 11 5G 4GB+128GB', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505607, 'Redmi 9A 砂石黑', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505608, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505609, 'Redmi Note 11 Pro 6GB+128GB', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505610, 'Redmi Note 11SE 4GB+128GB', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505611, 'Redmi Note 10 5G 4GB+128GB', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505612, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505613, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505614, 'Xiaomi MIX Alpha', 19999.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569297737.97669352.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505615, 'Redmi Note 11 4G 4GB+128GB', 939.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e690d968320c356b7a09c8f63bc6ef8d.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505616, 'Xiaomi 12X 8GB+128GB', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505617, 'Xiaomi 12S Ultra 8GB+256GB', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505618, 'Xiaomi 11 青春版 8GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505619, 'Redmi Note 9 4G 4GB+128GB', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/24595861f5d92a92441c65a69c3bd932.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505620, 'Redmi Note 10 Pro 6GB+128GB', 1499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dd0773e5d1c0f73de5b4548f1f5abc63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505621, 'Redmi K40S 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a778f1199c659c21c7b0dfe37d443a12.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505622, 'Redmi K50 Pro 8GB+128GB', 2999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1288c56b2cec9e44522f040a5785224d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505623, 'Redmi K50 8GB+128GB', 2399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/55098d0d1d85c73c6bfc07e88fb9a3a3.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505624, 'Redmi Note 11T Pro 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505625, 'Redmi 10A 4GB+64GB', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505626, 'Redmi Note 11 5G 4GB+128GB', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505627, 'Redmi 9A 砂石黑', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505628, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505629, 'Redmi Note 11 Pro 6GB+128GB', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505630, 'Redmi Note 11SE 4GB+128GB', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505631, 'Redmi Note 10 5G 4GB+128GB', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505632, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505633, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505634, 'Xiaomi MIX Alpha', 19999.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569297737.97669352.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505635, 'Redmi Note 11 4G 4GB+128GB', 939.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e690d968320c356b7a09c8f63bc6ef8d.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505636, 'Xiaomi 12X 8GB+128GB', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505637, 'Xiaomi 12S Ultra 8GB+256GB', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505638, 'Xiaomi 11 青春版 8GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505639, 'Redmi Note 9 4G 4GB+128GB', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/24595861f5d92a92441c65a69c3bd932.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505640, 'Redmi Note 10 Pro 6GB+128GB', 1499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dd0773e5d1c0f73de5b4548f1f5abc63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505641, 'Redmi K40S 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a778f1199c659c21c7b0dfe37d443a12.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505642, 'Redmi K50 Pro 8GB+128GB', 2999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1288c56b2cec9e44522f040a5785224d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505643, 'Redmi K50 8GB+128GB', 2399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/55098d0d1d85c73c6bfc07e88fb9a3a3.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505644, 'Redmi Note 11T Pro 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505645, 'Redmi 10A 4GB+64GB', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505646, 'Redmi Note 11 5G 4GB+128GB', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505647, 'Redmi 9A 砂石黑', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505648, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505649, 'Redmi Note 11 Pro 6GB+128GB', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505650, 'Redmi Note 11SE 4GB+128GB', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505651, 'Redmi Note 10 5G 4GB+128GB', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505652, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505653, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505654, 'Xiaomi MIX Alpha', 19999.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1569297737.97669352.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505655, 'Redmi Note 11 4G 4GB+128GB', 939.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e690d968320c356b7a09c8f63bc6ef8d.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505656, 'Xiaomi 12X 8GB+128GB', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505657, 'Xiaomi 12S Ultra 8GB+256GB', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505658, 'Xiaomi 11 青春版 8GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505659, 'Redmi Note 9 4G 4GB+128GB', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/24595861f5d92a92441c65a69c3bd932.jpg', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505660, 'Redmi Note 10 Pro 6GB+128GB', 1499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/dd0773e5d1c0f73de5b4548f1f5abc63.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505661, 'Redmi K40S 6GB+128GB', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a778f1199c659c21c7b0dfe37d443a12.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505662, 'Redmi K50 Pro 8GB+128GB', 2999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1288c56b2cec9e44522f040a5785224d.png', NULL, 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505663, '游戏本2019款', 7499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/470b268ceff61ad52b7837f4082fb773.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505664, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505665, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505666, 'RedmiBook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505667, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505668, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505669, '小米游戏本', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505670, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505671, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505672, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505673, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505674, 'RedmiBook Pro 14 增强版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2cdad2ced355841f856bf1e592937144.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505675, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505676, 'RedmiBook 13', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505677, 'RedmiBook Pro 15', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3bb2100e1c268ec3c3dc95d42bc47947.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505678, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505679, '小米笔记本Pro X 14 i7-11370H/16G/512G/RTX 3050/2.5K -灰', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505680, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505681, 'Redmi Book Pro 14 2022', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e3c300330221ad788569e4fb1e6f932f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505682, 'RedmiBook Air 13', 5199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee9c755f2f006fb59dd8f83d4e86176a.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505683, '游戏本2019款', 7499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/470b268ceff61ad52b7837f4082fb773.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505684, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505685, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505686, 'RedmiBook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505687, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505688, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505689, '小米游戏本', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505690, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505691, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505692, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505693, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505694, 'RedmiBook Pro 14 增强版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2cdad2ced355841f856bf1e592937144.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505695, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505696, 'RedmiBook 13', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505697, 'RedmiBook Pro 15', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3bb2100e1c268ec3c3dc95d42bc47947.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505698, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505699, '小米笔记本Pro X 14 i7-11370H/16G/512G/RTX 3050/2.5K -灰', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505700, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505701, 'Redmi Book Pro 14 2022', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e3c300330221ad788569e4fb1e6f932f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505702, 'RedmiBook Air 13', 5199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee9c755f2f006fb59dd8f83d4e86176a.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505703, '游戏本2019款', 7499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/470b268ceff61ad52b7837f4082fb773.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505704, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505705, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505706, 'RedmiBook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505707, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505708, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505709, '小米游戏本', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505710, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505711, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505712, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505713, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505714, 'RedmiBook Pro 14 增强版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2cdad2ced355841f856bf1e592937144.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505715, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505716, 'RedmiBook 13', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505717, 'RedmiBook Pro 15', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3bb2100e1c268ec3c3dc95d42bc47947.png', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505718, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505719, '小米笔记本Pro X 14 i7-11370H/16G/512G/RTX 3050/2.5K -灰', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505720, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505721, 'Redmi Book Pro 14 2022', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e3c300330221ad788569e4fb1e6f932f.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505722, 'RedmiBook Air 13', 5199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee9c755f2f006fb59dd8f83d4e86176a.jpg', NULL, 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505723, '小米平板5 6GB+128GB', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505724, '小米平板5 Pro 8GB+256GB', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505725, '小米平板5 Pro 5G 8GB+256GB', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505726, '小米平板 键盘式双面保护壳 原野绿', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505727, '小米平板 磁吸双面保护壳 黑色', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505728, '小米平板钢化保护膜 白色', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505729, '小米平板防窥钢化保护膜 透明', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505730, '小米灵感触控笔 笔尖 (4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505731, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505732, '小米平板5 6GB+128GB', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505733, '小米平板5 Pro 8GB+256GB', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505734, '小米平板5 Pro 5G 8GB+256GB', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505735, '小米平板 键盘式双面保护壳 原野绿', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505736, '小米平板 磁吸双面保护壳 黑色', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505737, '小米平板钢化保护膜 白色', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505738, '小米平板防窥钢化保护膜 透明', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505739, '小米灵感触控笔 笔尖 (4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505740, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505741, '小米平板5 6GB+128GB', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505742, '小米平板5 Pro 8GB+256GB', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505743, '小米平板5 Pro 5G 8GB+256GB', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505744, '小米平板 键盘式双面保护壳 原野绿', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505745, '小米平板 磁吸双面保护壳 黑色', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505746, '小米平板钢化保护膜 白色', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505747, '小米平板防窥钢化保护膜 透明', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505748, '小米灵感触控笔 笔尖 (4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505749, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', NULL, 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505750, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505751, '米家健康滤网（内置驱蚊模块） 灰色', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505752, '米家电磁炉青春版 白色', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505753, '米家冰箱 对开门536L 墨羽岩 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505754, '巨省电 小米空调新一级大1匹', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505755, '小米净水器H800G Pro系列滤芯 复合滤芯PPC3', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505756, '日常元素地面清洁剂 1L', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505757, '米家净水器1200G反渗透滤芯 1200G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505758, '米家声波电动牙刷T200 粉色', 69.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505759, '精致生活-个护清洁套装（牙刷T500+香氛机+洗手机+冲牙器）', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505760, '米家智能无叶净化扇滤芯 通用', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505761, '适配T200 米家声波电动牙刷头 3支装 清洁型', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505762, '小米净水器H800G Pro 白色', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505763, '米家扫拖机器人3C 配件 拖布', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505764, '米家智能小饭煲 2 白色', 189.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505765, '米家净水器1200G 白色', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505766, '米家智能空气炸锅Pro 4L 白色', 429.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505767, '米家智能独嵌两用洗碗机15套S1 15套', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505768, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505769, '米家智能嵌入式蒸烤一体机 S1 58L', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505770, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505771, '米家健康滤网（内置驱蚊模块） 灰色', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505772, '米家电磁炉青春版 白色', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505773, '米家冰箱 对开门536L 墨羽岩 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505774, '巨省电 小米空调新一级大1匹', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505775, '小米净水器H800G Pro系列滤芯 复合滤芯PPC3', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505776, '日常元素地面清洁剂 1L', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505777, '米家净水器1200G反渗透滤芯 1200G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505778, '米家声波电动牙刷T200 粉色', 69.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505779, '精致生活-个护清洁套装（牙刷T500+香氛机+洗手机+冲牙器）', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505780, '米家智能无叶净化扇滤芯 通用', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505781, '适配T200 米家声波电动牙刷头 3支装 清洁型', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505782, '小米净水器H800G Pro 白色', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505783, '米家扫拖机器人3C 配件 拖布', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505784, '米家智能小饭煲 2 白色', 189.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505785, '米家净水器1200G 白色', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505786, '米家智能空气炸锅Pro 4L 白色', 429.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505787, '米家智能独嵌两用洗碗机15套S1 15套', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505788, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505789, '米家智能嵌入式蒸烤一体机 S1 58L', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505790, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505791, '米家健康滤网（内置驱蚊模块） 灰色', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505792, '米家电磁炉青春版 白色', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505793, '米家冰箱 对开门536L 墨羽岩 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505794, '巨省电 小米空调新一级大1匹', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505795, '小米净水器H800G Pro系列滤芯 复合滤芯PPC3', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505796, '日常元素地面清洁剂 1L', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505797, '米家净水器1200G反渗透滤芯 1200G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505798, '米家声波电动牙刷T200 粉色', 69.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505799, '精致生活-个护清洁套装（牙刷T500+香氛机+洗手机+冲牙器）', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505800, '米家智能无叶净化扇滤芯 通用', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505801, '适配T200 米家声波电动牙刷头 3支装 清洁型', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505802, '小米净水器H800G Pro 白色', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505803, '米家扫拖机器人3C 配件 拖布', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505804, '米家智能小饭煲 2 白色', 189.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505805, '米家净水器1200G 白色', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505806, '米家智能空气炸锅Pro 4L 白色', 429.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505807, '米家智能独嵌两用洗碗机15套S1 15套', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505808, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', NULL, 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505809, '米家智能嵌入式蒸烤一体机 S1 58L', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', NULL, 1549326356528095233, 0, 0);

-- ----------------------------
-- Table structure for commodity_specs
-- ----------------------------
DROP TABLE IF EXISTS `commodity_specs`;
CREATE TABLE `commodity_specs`  (
  `cs_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `cpicture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `c_specs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品规格',
  `c_stock` int NULL DEFAULT 0,
  `cprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`cs_id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commodity_specs
-- ----------------------------
INSERT INTO `commodity_specs` VALUES (1, 1546337342148505637, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', '1', 1, 1.00);
INSERT INTO `commodity_specs` VALUES (2, 1546337342148505638, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', '2', 6, 2.00);

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `uid` bigint NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upicture` blob NULL COMMENT '头像',
  `umail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `uaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户地址',
  `uphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  `ulevel` int NULL DEFAULT NULL COMMENT 'vip等级',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1548882891587461122, 'myy6767', 'ffa5e77b572322d3b9f02e889a51f904', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for lt_order
-- ----------------------------
DROP TABLE IF EXISTS `lt_order`;
CREATE TABLE `lt_order`  (
  `order_id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `logistic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物流情况',
  `order_state` int NULL DEFAULT 0 COMMENT '“0”表示未收到，“1”表示已收到',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lt_order
-- ----------------------------

-- ----------------------------
-- Table structure for order_address
-- ----------------------------
DROP TABLE IF EXISTS `order_address`;
CREATE TABLE `order_address`  (
  `id` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户地址',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_address
-- ----------------------------
INSERT INTO `order_address` VALUES (1549240552787030018, 1548882891587461122, '1111111', '中国,北京市,市辖区,东城区1111', '1111');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `cnum` int NULL DEFAULT 0 COMMENT '单个商品购买数量',
  `cprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单/总价(同一件商品的总价)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `rid` bigint NOT NULL AUTO_INCREMENT,
  `cid` bigint NOT NULL,
  `cpicture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1548912019648933890 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1548912019648933889, 1546337342148505637, 'http://101.132.181.9:3000/public/imgs/cms_1.jpg');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `sid` bigint NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `saddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sphone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话11位',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of store
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
