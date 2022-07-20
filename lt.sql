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

 Date: 20/07/2022 20:07:57
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
INSERT INTO `cart` VALUES (1549700420719464450, 1548882891587461122, 1, 2, 1);
INSERT INTO `cart` VALUES (1549709162898903042, 1548882891587461122, 21, 2, 1);

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
  `is_recommend` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1546337342148505810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (1546337342148505603, 'Xiaomi 12', 3699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/149a55c7db655a57bce72528466c6bbc.png', '「购机享6期免息，信用卡分期至高立减200元；+99元得智能追踪无线充」全新一代 骁龙8 移动平台｜5000万超清主摄｜单手可握黄金手感｜6.28″超视感A+屏｜CyberFocus 万物追焦｜4500mAh大电量｜67W 有线秒充+50W无线秒充｜哈曼卡顿对称式立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505604, 'Xiaomi 11 青春版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄、多彩 | 骁龙780G | 专业电影相机，前置超级夜景 | AMOLED 柔性直屏 | 超线性立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505605, 'Xiaomi 12S', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012022_19bbddb6b35c3828f8b53f450c1519a3.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 单手可握好手感 | 徕卡光学镜头 | 徕卡原生双画质 | 全场景疾速抓拍 | 4500mAh大电量 | 6.28″AMOLED屏幕', 1549326207408005121, 0, 1);
INSERT INTO `commodity` VALUES (1546337342148505606, 'Xiaomi 12X', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', '骁龙870｜12bit 超视感屏｜黄金尺寸｜5000万疾速影像，3200万自拍｜对称立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505607, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', '「加1元得手机壳，信用卡分期享满减」骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505608, 'Xiaomi 12S Ultra', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', '「购机享6期免息；加149元得立式无线充；以旧换新至高补贴4999元」徕卡专业光学镜头｜骁龙8+ 旗舰处理器｜徕卡原生双画质｜1 英寸大底专业主摄｜小米澎湃 P1 快充芯片｜全场景疾速抓拍｜IP68级防尘防水', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505609, 'Redmi Note 11 Pro系列', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', '三星AMOLED高刷屏 | JBL 对称式立体声 | 一亿像素超清影像 | 天玑920液冷芯 | VC液冷立体散热 |', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505610, 'Redmi Note 11 5G', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', '「至高优惠100元，购机赠小米胶囊耳机」 双卡双5G | X轴线性马达 | 5000mAh 大电量 | 33W快充 | 立体声双扬声器 | 天玑810处理器 | 90Hz变速高刷屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505611, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', '旗舰长续航｜128GB大存储起步', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505612, 'Xiaomi Civi', 2099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/540458f4ee2b99df2784f3a6021866ce.jpg', '「全版本优惠200元！赠69元天生好看斜挎包（请选择此套装下单）」轻薄潮流设计 | 丝绒AG工艺 | 原生美肌人像 | 像素级肌肤焕新技术 | 3200万高清质感自拍 | 双柔光灯+自动对焦 | 3D曲面OLED柔性屏 | 120Hz+Dolby Vision | 4500mAh 大电量 | 55W有线闪充 | 立体声双扬声器 | 多功能NFC', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505613, 'Redmi 9A', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', '「4GB+128GB版本优惠30元；赠 Keep 会员7天体验卡；赠小米移动流量卡」6.53\"超大护眼屏幕｜ 5000mAh长循环大电量｜ 大音量扬声器 ｜1300万AI相机 ｜人脸解锁｜G25八核处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505614, 'Xiaomi 10S', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b3d41aa1a9cc51c3c943d5ed9fd70101.png', '骁龙870 | 对称式双扬立体声 | 1亿像素 8K电影相机 | 33W有线快充 | 30W无线快充 | 10W反向充电 | 4780mAh超大电池 | LPDDR5+UFS3.0+Wi-Fi 6 | VC液冷散热 | 双模5G', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505615, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', '骁龙870｜三星 E4直屏｜杜比全景声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505616, 'Redmi Note 10 5G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', '「8GB版本优惠100元：8GB+128GB到手价1299元；8GB+256GB到手价1499元」5G小金刚｜旗舰长续航｜双5G待机｜5000mAh充电宝级大容量｜4800万高清相机｜天玑700八核高性能处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505617, 'Xiaomi 11 Ultra', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cea1ff3517387569b7f59fc2b7d01d30.png', '「信用卡分期享满减优惠」1/1.12\'\'GN2｜128°超广角｜120X超长焦｜2K四微曲屏｜骁龙888｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505618, 'Xiaomi 12S Pro', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012000_0b9df066c110f201154013ac373df1d9.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 徕卡光学镜头 | 徕卡原生双画质 | 徕卡水印、大师镜头包 | 全场景疾速抓拍 | 5000万三主摄 | 小米自研澎湃P1芯片 | 120W小米澎湃秒冲 | 4600mAh大电量 | 2K AMOLED屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505619, 'Redmi Note 11T Pro系列', 1699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', '天玑8100｜144Hz高配LCD屏幕｜6400万像素｜VC液冷散热', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505620, 'Redmi 10A', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', '「4GB+64GB版本优惠50元；农行信用卡支付再减10元；小米分期新客享3期免息」6.53\"大尺寸屏幕｜1300万超清主摄｜Helio G25八核处理器｜5000mAh充电宝级大电量｜观看轻松也清晰｜支持大字阅读｜聊天看书更省力', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505621, 'Redmi Note 11SE', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', '「优惠100元，到手价999元起」天玑700｜18W快充｜5000mAh大电池｜6.5\"FHD+全高清屏｜双卡双5G｜90Hz 四挡变速高刷屏｜4096级 亮度调节｜全系128GB 大内存｜大功率扬声器｜4800万 高清双摄', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505622, 'Xiaomi 11 青春活力版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0593c1e9e06a125b9e22c1041aa0a85d.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄5G | 骁龙778G | 6400万主摄像头 | 柔性AMOLED 直屏 | 超线性立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505623, 'Xiaomi 12', 3699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/149a55c7db655a57bce72528466c6bbc.png', '「购机享6期免息，信用卡分期至高立减200元；+99元得智能追踪无线充」全新一代 骁龙8 移动平台｜5000万超清主摄｜单手可握黄金手感｜6.28″超视感A+屏｜CyberFocus 万物追焦｜4500mAh大电量｜67W 有线秒充+50W无线秒充｜哈曼卡顿对称式立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505624, 'Xiaomi 11 青春版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄、多彩 | 骁龙780G | 专业电影相机，前置超级夜景 | AMOLED 柔性直屏 | 超线性立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505625, 'Xiaomi 12S', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012022_19bbddb6b35c3828f8b53f450c1519a3.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 单手可握好手感 | 徕卡光学镜头 | 徕卡原生双画质 | 全场景疾速抓拍 | 4500mAh大电量 | 6.28″AMOLED屏幕', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505626, 'Xiaomi 12X', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', '骁龙870｜12bit 超视感屏｜黄金尺寸｜5000万疾速影像，3200万自拍｜对称立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505627, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', '「加1元得手机壳，信用卡分期享满减」骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505628, 'Xiaomi 12S Ultra', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', '「购机享6期免息；加149元得立式无线充；以旧换新至高补贴4999元」徕卡专业光学镜头｜骁龙8+ 旗舰处理器｜徕卡原生双画质｜1 英寸大底专业主摄｜小米澎湃 P1 快充芯片｜全场景疾速抓拍｜IP68级防尘防水', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505629, 'Redmi Note 11 Pro系列', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', '三星AMOLED高刷屏 | JBL 对称式立体声 | 一亿像素超清影像 | 天玑920液冷芯 | VC液冷立体散热 |', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505630, 'Redmi Note 11 5G', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', '「至高优惠100元，购机赠小米胶囊耳机」 双卡双5G | X轴线性马达 | 5000mAh 大电量 | 33W快充 | 立体声双扬声器 | 天玑810处理器 | 90Hz变速高刷屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505631, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', '旗舰长续航｜128GB大存储起步', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505632, 'Xiaomi Civi', 2099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/540458f4ee2b99df2784f3a6021866ce.jpg', '「全版本优惠200元！赠69元天生好看斜挎包（请选择此套装下单）」轻薄潮流设计 | 丝绒AG工艺 | 原生美肌人像 | 像素级肌肤焕新技术 | 3200万高清质感自拍 | 双柔光灯+自动对焦 | 3D曲面OLED柔性屏 | 120Hz+Dolby Vision | 4500mAh 大电量 | 55W有线闪充 | 立体声双扬声器 | 多功能NFC', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505633, 'Redmi 9A', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', '「4GB+128GB版本优惠30元；赠 Keep 会员7天体验卡；赠小米移动流量卡」6.53\"超大护眼屏幕｜ 5000mAh长循环大电量｜ 大音量扬声器 ｜1300万AI相机 ｜人脸解锁｜G25八核处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505634, 'Xiaomi 10S', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b3d41aa1a9cc51c3c943d5ed9fd70101.png', '骁龙870 | 对称式双扬立体声 | 1亿像素 8K电影相机 | 33W有线快充 | 30W无线快充 | 10W反向充电 | 4780mAh超大电池 | LPDDR5+UFS3.0+Wi-Fi 6 | VC液冷散热 | 双模5G', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505635, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', '骁龙870｜三星 E4直屏｜杜比全景声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505636, 'Redmi Note 10 5G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', '「8GB版本优惠100元：8GB+128GB到手价1299元；8GB+256GB到手价1499元」5G小金刚｜旗舰长续航｜双5G待机｜5000mAh充电宝级大容量｜4800万高清相机｜天玑700八核高性能处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505637, 'Xiaomi 11 Ultra', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cea1ff3517387569b7f59fc2b7d01d30.png', '「信用卡分期享满减优惠」1/1.12\'\'GN2｜128°超广角｜120X超长焦｜2K四微曲屏｜骁龙888｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505638, 'Xiaomi 12S Pro', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012000_0b9df066c110f201154013ac373df1d9.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 徕卡光学镜头 | 徕卡原生双画质 | 徕卡水印、大师镜头包 | 全场景疾速抓拍 | 5000万三主摄 | 小米自研澎湃P1芯片 | 120W小米澎湃秒冲 | 4600mAh大电量 | 2K AMOLED屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505639, 'Redmi Note 11T Pro系列', 1699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', '天玑8100｜144Hz高配LCD屏幕｜6400万像素｜VC液冷散热', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505640, 'Redmi 10A', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', '「4GB+64GB版本优惠50元；农行信用卡支付再减10元；小米分期新客享3期免息」6.53\"大尺寸屏幕｜1300万超清主摄｜Helio G25八核处理器｜5000mAh充电宝级大电量｜观看轻松也清晰｜支持大字阅读｜聊天看书更省力', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505641, 'Redmi Note 11SE', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', '「优惠100元，到手价999元起」天玑700｜18W快充｜5000mAh大电池｜6.5\"FHD+全高清屏｜双卡双5G｜90Hz 四挡变速高刷屏｜4096级 亮度调节｜全系128GB 大内存｜大功率扬声器｜4800万 高清双摄', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505642, 'Xiaomi 11 青春活力版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0593c1e9e06a125b9e22c1041aa0a85d.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄5G | 骁龙778G | 6400万主摄像头 | 柔性AMOLED 直屏 | 超线性立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505643, 'Xiaomi 12', 3699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/149a55c7db655a57bce72528466c6bbc.png', '「购机享6期免息，信用卡分期至高立减200元；+99元得智能追踪无线充」全新一代 骁龙8 移动平台｜5000万超清主摄｜单手可握黄金手感｜6.28″超视感A+屏｜CyberFocus 万物追焦｜4500mAh大电量｜67W 有线秒充+50W无线秒充｜哈曼卡顿对称式立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505644, 'Xiaomi 11 青春版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b36954e448a48cc3c61fb2d020d20f63.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄、多彩 | 骁龙780G | 专业电影相机，前置超级夜景 | AMOLED 柔性直屏 | 超线性立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505645, 'Xiaomi 12S', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012022_19bbddb6b35c3828f8b53f450c1519a3.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 单手可握好手感 | 徕卡光学镜头 | 徕卡原生双画质 | 全场景疾速抓拍 | 4500mAh大电量 | 6.28″AMOLED屏幕', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505646, 'Xiaomi 12X', 2669.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4257d435e77ec82bb6922e83b9bf5bcc.png', '骁龙870｜12bit 超视感屏｜黄金尺寸｜5000万疾速影像，3200万自拍｜对称立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505647, 'Xiaomi 11', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/5a260090e0e08770b0bd865845a4b4ab.jpg', '「加1元得手机壳，信用卡分期享满减」骁龙888｜2K AMOLED 四曲面柔性屏｜1亿像素三摄｜时尚轻薄机身｜55W 有线闪充｜50W 无线闪充｜10W 无线反充｜LPDDR5｜WiFi6（增强版）｜视频「超级夜景」｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505648, 'Xiaomi 12S Ultra', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207011810_86ad513472d1423a3fdec8d7d5107038.png', '「购机享6期免息；加149元得立式无线充；以旧换新至高补贴4999元」徕卡专业光学镜头｜骁龙8+ 旗舰处理器｜徕卡原生双画质｜1 英寸大底专业主摄｜小米澎湃 P1 快充芯片｜全场景疾速抓拍｜IP68级防尘防水', 1549326207408005121, 0, 1);
INSERT INTO `commodity` VALUES (1546337342148505649, 'Redmi Note 11 Pro系列', 1599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/370854e4fbae37c959ce33a5676fa13f.png', '三星AMOLED高刷屏 | JBL 对称式立体声 | 一亿像素超清影像 | 天玑920液冷芯 | VC液冷立体散热 |', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505650, 'Redmi Note 11 5G', 1199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d13f434be6b12bd9b5486247425eca6f.png', '「至高优惠100元，购机赠小米胶囊耳机」 双卡双5G | X轴线性马达 | 5000mAh 大电量 | 33W快充 | 立体声双扬声器 | 天玑810处理器 | 90Hz变速高刷屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505651, 'Redmi Note 9 系列', 899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4e75e528fb468aee107f551179aa0799.jpg', '旗舰长续航｜128GB大存储起步', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505652, 'Xiaomi Civi', 2099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/540458f4ee2b99df2784f3a6021866ce.jpg', '「全版本优惠200元！赠69元天生好看斜挎包（请选择此套装下单）」轻薄潮流设计 | 丝绒AG工艺 | 原生美肌人像 | 像素级肌肤焕新技术 | 3200万高清质感自拍 | 双柔光灯+自动对焦 | 3D曲面OLED柔性屏 | 120Hz+Dolby Vision | 4500mAh 大电量 | 55W有线闪充 | 立体声双扬声器 | 多功能NFC', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505653, 'Redmi 9A', 599.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', '「4GB+128GB版本优惠30元；赠 Keep 会员7天体验卡；赠小米移动流量卡」6.53\"超大护眼屏幕｜ 5000mAh长循环大电量｜ 大音量扬声器 ｜1300万AI相机 ｜人脸解锁｜G25八核处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505654, 'Xiaomi 10S', 2699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/b3d41aa1a9cc51c3c943d5ed9fd70101.png', '骁龙870 | 对称式双扬立体声 | 1亿像素 8K电影相机 | 33W有线快充 | 30W无线快充 | 10W反向充电 | 4780mAh超大电池 | LPDDR5+UFS3.0+Wi-Fi 6 | VC液冷散热 | 双模5G', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505655, 'Redmi K40系列', 1799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/73617424da6ff6b64f9c630387bca874.jpg', '骁龙870｜三星 E4直屏｜杜比全景声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505656, 'Redmi Note 10 5G', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cbadf8917627a3a80cc61f3d95f48cfb.png', '「8GB版本优惠100元：8GB+128GB到手价1299元；8GB+256GB到手价1499元」5G小金刚｜旗舰长续航｜双5G待机｜5000mAh充电宝级大容量｜4800万高清相机｜天玑700八核高性能处理器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505657, 'Xiaomi 11 Ultra', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cea1ff3517387569b7f59fc2b7d01d30.png', '「信用卡分期享满减优惠」1/1.12\'\'GN2｜128°超广角｜120X超长焦｜2K四微曲屏｜骁龙888｜IP68级防水｜67W 有线闪充｜67W 无线闪充｜10W 无线反充｜5000mAh超大电池｜LPDDR5｜WiFi6（增强版）｜哈曼卡顿音频认证｜立体声双扬声器', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505658, 'Xiaomi 12S Pro', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202207012000_0b9df066c110f201154013ac373df1d9.png', '「新品热卖中！享24期免息；全版本限时买赠潮流变色T恤；以旧换新至高补贴4999元；直播间下单加赠手机壳」骁龙8+ 旗舰处理器 | 徕卡光学镜头 | 徕卡原生双画质 | 徕卡水印、大师镜头包 | 全场景疾速抓拍 | 5000万三主摄 | 小米自研澎湃P1芯片 | 120W小米澎湃秒冲 | 4600mAh大电量 | 2K AMOLED屏', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505659, 'Redmi Note 11T Pro系列', 1699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205221513_4a54fc6db0b3bb27b77c5bab1d11b26d.png', '天玑8100｜144Hz高配LCD屏幕｜6400万像素｜VC液冷散热', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505660, 'Redmi 10A', 649.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/e813ca2ccc6708077b17dacbdf1d1465.jpg', '「4GB+64GB版本优惠50元；农行信用卡支付再减10元；小米分期新客享3期免息」6.53\"大尺寸屏幕｜1300万超清主摄｜Helio G25八核处理器｜5000mAh充电宝级大电量｜观看轻松也清晰｜支持大字阅读｜聊天看书更省力', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505661, 'Redmi Note 11SE', 999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211436_2e169efac5000332a3680c065d6ca2d4.png', '「优惠100元，到手价999元起」天玑700｜18W快充｜5000mAh大电池｜6.5\"FHD+全高清屏｜双卡双5G｜90Hz 四挡变速高刷屏｜4096级 亮度调节｜全系128GB 大内存｜大功率扬声器｜4800万 高清双摄', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505662, 'Xiaomi 11 青春活力版', 1769.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0593c1e9e06a125b9e22c1041aa0a85d.png', '「7.20-7.22 全版本优惠230元！至高享6期免息。」轻薄5G | 骁龙778G | 6400万主摄像头 | 柔性AMOLED 直屏 | 超线性立体声', 1549326207408005121, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505663, '小米平板5', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', '下单送充电器，购套装更优惠，招行信用卡分期至高立减66元！骁龙860芯片 | 2.5K超清屏 | 120Hz高刷新率｜8720mAh大电池', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505664, '小米平板5 Pro', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', '下单送充电器，购套装更优惠，平安信用卡分期至高立减68元！骁龙870芯片 | 2.5K超高清｜120HZ高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505665, '小米平板5 Pro 5G', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', '下单送充电器，购套装更优惠，建行信用卡分期至高立减126元！骁龙870芯片 | 2.5K超清屏 | 120Hz高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505666, '小米平板 键盘式双面保护壳', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', 'Pogo Pin触点直连 实现高效创作', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505667, '小米平板 磁吸双面保护壳', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', '磁吸支撑 解放双手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505668, '小米平板钢化保护膜', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', '高清高透 | 自动贴合 | 防刮防爆 | 适用于小米平板5全系列', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505669, '小米平板防窥钢化保护膜', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', '小米平板防窥钢化保护膜', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505670, '小米灵感触控笔 笔尖(4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', '软弹尖端 阻尼防滑 流畅抗压', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505671, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', '灵感不断电，创作好帮手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505672, '小米平板5', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', '下单送充电器，购套装更优惠，招行信用卡分期至高立减66元！骁龙860芯片 | 2.5K超清屏 | 120Hz高刷新率｜8720mAh大电池', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505673, '小米平板5 Pro', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', '下单送充电器，购套装更优惠，平安信用卡分期至高立减68元！骁龙870芯片 | 2.5K超高清｜120HZ高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505674, '小米平板5 Pro 5G', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', '下单送充电器，购套装更优惠，建行信用卡分期至高立减126元！骁龙870芯片 | 2.5K超清屏 | 120Hz高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505675, '小米平板 键盘式双面保护壳', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', 'Pogo Pin触点直连 实现高效创作', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505676, '小米平板 磁吸双面保护壳', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', '磁吸支撑 解放双手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505677, '小米平板钢化保护膜', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', '高清高透 | 自动贴合 | 防刮防爆 | 适用于小米平板5全系列', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505678, '小米平板防窥钢化保护膜', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', '小米平板防窥钢化保护膜', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505679, '小米灵感触控笔 笔尖(4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', '软弹尖端 阻尼防滑 流畅抗压', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505680, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', '灵感不断电，创作好帮手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505681, '小米平板5', 1999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', '下单送充电器，购套装更优惠，招行信用卡分期至高立减66元！骁龙860芯片 | 2.5K超清屏 | 120Hz高刷新率｜8720mAh大电池', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505682, '小米平板5 Pro', 3099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', '下单送充电器，购套装更优惠，平安信用卡分期至高立减68元！骁龙870芯片 | 2.5K超高清｜120HZ高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505683, '小米平板5 Pro 5G', 3499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', '下单送充电器，购套装更优惠，建行信用卡分期至高立减126元！骁龙870芯片 | 2.5K超清屏 | 120Hz高刷新率', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505684, '小米平板 键盘式双面保护壳', 399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', 'Pogo Pin触点直连 实现高效创作', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505685, '小米平板 磁吸双面保护壳', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', '磁吸支撑 解放双手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505686, '小米平板钢化保护膜', 69.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', '高清高透 | 自动贴合 | 防刮防爆 | 适用于小米平板5全系列', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505687, '小米平板防窥钢化保护膜', 99.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', '小米平板防窥钢化保护膜', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505688, '小米灵感触控笔 笔尖(4枚装)', 49.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', '软弹尖端 阻尼防滑 流畅抗压', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505689, '小米灵感触控笔', 349.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598434.12973830.png', '灵感不断电，创作好帮手', 1549326325611880450, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505690, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', '高效抗菌，守护全家健康|低噪运行不打扰|压缩机、电机10年质保|颜值出众，放哪都好看', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505691, '米家健康滤网（内置驱蚊模块）', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', '米家健康滤网（内置驱蚊模块）', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505692, '米家电磁炉青春版', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', '2100W 功率 / 加粗密绕线圈 / 9 挡火力调节', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', '「活动到手价2199元！晒单返20元商城红包！墨羽岩面板|9层精细打磨门体材质|风冷无霜不结冰|智能互联！」海量空间，20格精细分储|墨羽岩面板，9层精细打磨门体材质|风冷无霜不结冰|67cm纤薄随心放|36分贝低噪运行|智能互联', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505694, '小米空调巨省电大1匹新1级', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', '「小米清凉季来袭！3期免息！6年质保！30s速冷，宽温域运行，新品热卖中...」温湿双控 | 全直流变频 | 宽温域运行', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505695, '小米净水器H800G Pro系列滤芯', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', '小米净水器H800G Pro系列滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505696, '日常元素地面清洁剂', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', '米家全能扫拖机器人专用', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505697, '米家净水器1200G反渗透滤芯', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', '6级精滤，深层净化好水，侧抽设计', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505698, '米家声波电动牙刷T200', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', '声波洁牙 柔感护龈 声波振动 高效清洁 情侣双色', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505699, '个护清洁套装', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', '乐享精致生活', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505700, '适配T200 米家声波电动牙刷头 3支装', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', '抗菌护龈，高效清洁；弧面设计，更贴合牙齿', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505701, '米家智能无叶净化扇滤芯', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', '纳米级过滤|有效去除PM2.5、甲醛、病菌及划分过敏', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505702, '小米净水器H800G Pro', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', '2.12L/min出水 | 2:1纯废水比 | 5年RO滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505703, '米家扫拖机器人3C 配件', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', '专属配件 一站购齐', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505704, '米家智能小饭煲 2', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', '28分钟超快饭|体积更小|精致简约|IoT互联海量食谱', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505705, '米家净水器1200G', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', '下单送复合滤芯PPC5 3.2L/min出水 | 3:1纯废水比 | 新鲜无陈水', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505706, '米家智能空气炸锅Pro 4L', 449.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', '烹饪可视窗，健康无油炸，智能云食谱，24小时智能预约，4L黄金容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505707, '米家智能独嵌两用洗碗机15套S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', '智能开合洗烘|4重立体喷洗净洗|99.99%UV 深层除菌|双驱BLDC变频电机|15套大容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505708, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', '智能烟感，精准调节风量|智能升降，源头近吸油烟|顶侧双吸，低吸高拢|4500W大火力|烟灶联动', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505709, '米家智能嵌入式蒸烤一体机 S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', '米家智能嵌入式蒸烤一体机 S1', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505710, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', '高效抗菌，守护全家健康|低噪运行不打扰|压缩机、电机10年质保|颜值出众，放哪都好看', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505711, '米家健康滤网（内置驱蚊模块）', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', '米家健康滤网（内置驱蚊模块）', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505712, '米家电磁炉青春版', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', '2100W 功率 / 加粗密绕线圈 / 9 挡火力调节', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', '「活动到手价2199元！晒单返20元商城红包！墨羽岩面板|9层精细打磨门体材质|风冷无霜不结冰|智能互联！」海量空间，20格精细分储|墨羽岩面板，9层精细打磨门体材质|风冷无霜不结冰|67cm纤薄随心放|36分贝低噪运行|智能互联', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505714, '小米空调巨省电大1匹新1级', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', '「小米清凉季来袭！3期免息！6年质保！30s速冷，宽温域运行，新品热卖中...」温湿双控 | 全直流变频 | 宽温域运行', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505715, '小米净水器H800G Pro系列滤芯', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', '小米净水器H800G Pro系列滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505716, '日常元素地面清洁剂', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', '米家全能扫拖机器人专用', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505717, '米家净水器1200G反渗透滤芯', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', '6级精滤，深层净化好水，侧抽设计', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505718, '米家声波电动牙刷T200', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', '声波洁牙 柔感护龈 声波振动 高效清洁 情侣双色', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505719, '个护清洁套装', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', '乐享精致生活', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505720, '适配T200 米家声波电动牙刷头 3支装', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', '抗菌护龈，高效清洁；弧面设计，更贴合牙齿', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505721, '米家智能无叶净化扇滤芯', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', '纳米级过滤|有效去除PM2.5、甲醛、病菌及划分过敏', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505722, '小米净水器H800G Pro', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', '2.12L/min出水 | 2:1纯废水比 | 5年RO滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505723, '米家扫拖机器人3C 配件', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', '专属配件 一站购齐', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505724, '米家智能小饭煲 2', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', '28分钟超快饭|体积更小|精致简约|IoT互联海量食谱', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505725, '米家净水器1200G', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', '下单送复合滤芯PPC5 3.2L/min出水 | 3:1纯废水比 | 新鲜无陈水', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505726, '米家智能空气炸锅Pro 4L', 449.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', '烹饪可视窗，健康无油炸，智能云食谱，24小时智能预约，4L黄金容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505727, '米家智能独嵌两用洗碗机15套S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', '智能开合洗烘|4重立体喷洗净洗|99.99%UV 深层除菌|双驱BLDC变频电机|15套大容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505728, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', '智能烟感，精准调节风量|智能升降，源头近吸油烟|顶侧双吸，低吸高拢|4500W大火力|烟灶联动', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505729, '米家智能嵌入式蒸烤一体机 S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', '米家智能嵌入式蒸烤一体机 S1', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505730, '米家冰·洗烘套装', 4798.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', '高效抗菌，守护全家健康|低噪运行不打扰|压缩机、电机10年质保|颜值出众，放哪都好看', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505731, '米家健康滤网（内置驱蚊模块）', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206302018_0ad01c3a610d47e3ffb9dd514c4c33d3.png', '米家健康滤网（内置驱蚊模块）', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505732, '米家电磁炉青春版', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206291533_8503fdd16b3865c83d52bece4a58c1c8.png', '2100W 功率 / 加粗密绕线圈 / 9 挡火力调节', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505733, '米家冰箱 对开门536L 墨羽岩', 2199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206281432_8aba3489a4e9445fca3c1c12775f6e3e.png', '「活动到手价2199元！晒单返20元商城红包！墨羽岩面板|9层精细打磨门体材质|风冷无霜不结冰|智能互联！」海量空间，20格精细分储|墨羽岩面板，9层精细打磨门体材质|风冷无霜不结冰|67cm纤薄随心放|36分贝低噪运行|智能互联', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505734, '小米空调巨省电大1匹新1级', 2099.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', '「小米清凉季来袭！3期免息！6年质保！30s速冷，宽温域运行，新品热卖中...」温湿双控 | 全直流变频 | 宽温域运行', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505735, '小米净水器H800G Pro系列滤芯', 219.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051942_9e45b02de914b5233a61105f2c01c2d5.png', '小米净水器H800G Pro系列滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505736, '日常元素地面清洁剂', 99.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051847_32ba477dc05796d52c55dd9070716c45.png', '米家全能扫拖机器人专用', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505737, '米家净水器1200G反渗透滤芯', 1099.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202206051949_b15870c4f60d16955ef6b1a961c4400e.png', '6级精滤，深层净化好水，侧抽设计', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505738, '米家声波电动牙刷T200', 79.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205262206_c836aee65db1181881b258b1e85eff54.png', '声波洁牙 柔感护龈 声波振动 高效清洁 情侣双色', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505739, '个护清洁套装', 489.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1653732043.76931698.jpg', '乐享精致生活', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505740, '适配T200 米家声波电动牙刷头 3支装', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205282136_063a90995ac8db243c833602f7d9cdd1.png', '抗菌护龈，高效清洁；弧面设计，更贴合牙齿', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505741, '米家智能无叶净化扇滤芯', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205242018_fcf55650f6ba7e812bdee77f367fa105.png', '纳米级过滤|有效去除PM2.5、甲醛、病菌及划分过敏', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505742, '小米净水器H800G Pro', 1899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201641_f36dd6d2dc83d19d88ae150a50e66017.png', '2.12L/min出水 | 2:1纯废水比 | 5年RO滤芯', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505743, '米家扫拖机器人3C 配件', 39.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202151_b074507125dc0f56e0ee6668ead4cc64.png', '专属配件 一站购齐', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505744, '米家智能小饭煲 2', 199.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205201909_0c600f8b38a0c5de1354c613dffa28b4.png', '28分钟超快饭|体积更小|精致简约|IoT互联海量食谱', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505745, '米家净水器1200G', 2599.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205211919_7f0456d9b7b282c920292d2206cc1ee4.png', '下单送复合滤芯PPC5 3.2L/min出水 | 3:1纯废水比 | 新鲜无陈水', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505746, '米家智能空气炸锅Pro 4L', 449.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205202040_62a3156576af2ac79910581abe324e4b.png', '烹饪可视窗，健康无油炸，智能云食谱，24小时智能预约，4L黄金容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505747, '米家智能独嵌两用洗碗机15套S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191006_272b88870af884aa6ee4050cfcb80d3d.png', '智能开合洗烘|4重立体喷洗净洗|99.99%UV 深层除菌|双驱BLDC变频电机|15套大容量', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505748, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 3399.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', '智能烟感，精准调节风量|智能升降，源头近吸油烟|顶侧双吸，低吸高拢|4500W大火力|烟灶联动', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505749, '米家智能嵌入式蒸烤一体机 S1', 3299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/nr-pub/202205191109_d13eee83c8e9487256ad14befc4f7d46.png', '米家智能嵌入式蒸烤一体机 S1', 1549326356528095233, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505750, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505751, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', '4K OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505752, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', '2.8K 90Hz OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 最高可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505753, '小米游戏本15.6\"', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', '第八代酷睿处理器 ／ 72%NTSC高色域窄边框全高清屏 ／ 256G PCIe高速固态 ／ 双烤不限频不降频', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505754, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505755, 'Redmibook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', '暑促狂欢季！晒单赢50元红包！货源紧缺，即刻相拥>>2.5K超视网膜全面屏 | 一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505756, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '光追独显与硬核锐龙芯梦幻联合，迎来游戏性能释放新境界。视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 锐龙版，实力超能打。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505757, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', '3.5K E4 OLED 超视网膜大师屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505758, 'RedmiBook 13 全面屏', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', '四窄边全面屏 / 全新十代酷睿™处理器 / 全金属超轻机身 / MX250 高性能独显 / 小米互传 / 专业「飓风」散热系统 / 11小时长续航', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505759, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！可选RTX 2050显卡，即刻开启>>全新12代英特尔处理器 | Windows 11 家庭中文版 | 可选RTX 2050高性能独立显卡 | 3.2K 90Hz 原色超清屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505760, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '升级Win11系统，视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 ，实力超能打', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505761, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '超视网膜流速屏，动力升级全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505762, '小米笔记本Pro 15', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f52fb8472685148a856212fd443e463a.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505763, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', '3.2K 超视网膜屏 | 微米级一体精雕 | MX450独立显卡(可选) | Windows 11(可选)', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505764, '小米笔记本Pro X 14', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', '将一块高性能光追显卡装入轻薄本，超视网膜屏、高端工艺、智能体验，轻薄性能，小米笔记本Pro X 14，由此诞生。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505765, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！全新锐龙6000系列处理器，可选RTX 2050显卡>>可选全新R7 6800H处理器，3.2K 90Hz高清屏，RTX 2050高性能独立显卡，CNC一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505766, '小米笔记本Pro 14', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505767, '小米笔记本 Pro 15 锐龙版', 5899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee0e0409aab8a8052edc172c92942e93.jpg', '大师屏 颠覆视觉 | 动力升级 全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505768, 'Pro 15.6\" 2020款', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9695deb5efdbca6c21d89248dbf3a81.jpg', '全新第十代英特尔酷睿处理器 / MX350显卡 / 全尺寸背光键盘 / 100%sRGB高色域', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505769, 'Redmibook Pro 15 锐龙版', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/44d8d53f2f4122a0e6f3440149271f52.jpg', '3.2K 超清视网膜全面屏 | 微米级一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505770, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505771, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', '4K OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505772, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', '2.8K 90Hz OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 最高可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505773, '小米游戏本15.6\"', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', '第八代酷睿处理器 ／ 72%NTSC高色域窄边框全高清屏 ／ 256G PCIe高速固态 ／ 双烤不限频不降频', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505774, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505775, 'Redmibook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', '暑促狂欢季！晒单赢50元红包！货源紧缺，即刻相拥>>2.5K超视网膜全面屏 | 一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505776, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '光追独显与硬核锐龙芯梦幻联合，迎来游戏性能释放新境界。视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 锐龙版，实力超能打。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505777, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', '3.5K E4 OLED 超视网膜大师屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505778, 'RedmiBook 13 全面屏', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', '四窄边全面屏 / 全新十代酷睿™处理器 / 全金属超轻机身 / MX250 高性能独显 / 小米互传 / 专业「飓风」散热系统 / 11小时长续航', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505779, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！可选RTX 2050显卡，即刻开启>>全新12代英特尔处理器 | Windows 11 家庭中文版 | 可选RTX 2050高性能独立显卡 | 3.2K 90Hz 原色超清屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505780, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '升级Win11系统，视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 ，实力超能打', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505781, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '超视网膜流速屏，动力升级全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505782, '小米笔记本Pro 15', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f52fb8472685148a856212fd443e463a.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505783, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', '3.2K 超视网膜屏 | 微米级一体精雕 | MX450独立显卡(可选) | Windows 11(可选)', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505784, '小米笔记本Pro X 14', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', '将一块高性能光追显卡装入轻薄本，超视网膜屏、高端工艺、智能体验，轻薄性能，小米笔记本Pro X 14，由此诞生。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505785, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！全新锐龙6000系列处理器，可选RTX 2050显卡>>可选全新R7 6800H处理器，3.2K 90Hz高清屏，RTX 2050高性能独立显卡，CNC一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505786, '小米笔记本Pro 14', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505787, '小米笔记本 Pro 15 锐龙版', 5899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee0e0409aab8a8052edc172c92942e93.jpg', '大师屏 颠覆视觉 | 动力升级 全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505788, 'Pro 15.6\" 2020款', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9695deb5efdbca6c21d89248dbf3a81.jpg', '全新第十代英特尔酷睿处理器 / MX350显卡 / 全尺寸背光键盘 / 100%sRGB高色域', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505789, 'Redmibook Pro 15 锐龙版', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/44d8d53f2f4122a0e6f3440149271f52.jpg', '3.2K 超清视网膜全面屏 | 微米级一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505790, '小米笔记本 Pro 15 增强版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/4d8079f939bef922a9dae3a70d26b739.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505791, 'Xiaomi Book Pro 16 2022', 7399.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2646f1fdf7186b0efa4f0d0c32622874.jpg', '4K OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505792, 'Xiaomi Book Pro 14 2022', 6799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9984c10a2cdc5a8dc46bf0683cb06ea5.jpg', '2.8K 90Hz OLED 触控屏 | CNC一体精雕工艺 | 压感触控板 | 12代英特尔®酷睿™处理器 | 最高可选RTX2050光追独显', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505793, '小米游戏本15.6\"', 7999.00, 0, NULL, 'https://i8.mifile.cn/b2c-mimall-media/9b232bbf863196f3a76094b538442d13.jpg', '第八代酷睿处理器 ／ 72%NTSC高色域窄边框全高清屏 ／ 256G PCIe高速固态 ／ 双烤不限频不降频', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505794, '小米笔记本 Pro 14 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505795, 'Redmibook Pro 14 锐龙版', 3999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01d9571051a91e540e5c644fa60cc858.jpg', '暑促狂欢季！晒单赢50元红包！货源紧缺，即刻相拥>>2.5K超视网膜全面屏 | 一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505796, 'Redmi G 2021 锐龙版', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '光追独显与硬核锐龙芯梦幻联合，迎来游戏性能释放新境界。视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 锐龙版，实力超能打。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505797, '小米笔记本 Pro X 15', 7699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6a47dd972017e0f75093cafbd66ede3f.jpg', '3.5K E4 OLED 超视网膜大师屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505798, 'RedmiBook 13 全面屏', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a6e4e80b9701a5f2df6902d79fc7824d.jpg', '四窄边全面屏 / 全新十代酷睿™处理器 / 全金属超轻机身 / MX250 高性能独显 / 小米互传 / 专业「飓风」散热系统 / 11小时长续航', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505799, 'Redmi Book Pro 15 2022', 5299.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！可选RTX 2050显卡，即刻开启>>全新12代英特尔处理器 | Windows 11 家庭中文版 | 可选RTX 2050高性能独立显卡 | 3.2K 90Hz 原色超清屏', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505800, 'Redmi G 2021', 5499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', '升级Win11系统，视野再突破，天生为赢而战，全方位为热爱进阶，Redmi G 2021 ，实力超能打', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505801, '小米笔记本 Pro 14 锐龙版', 4499.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '超视网膜流速屏，动力升级全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505802, '小米笔记本Pro 15', 5799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f52fb8472685148a856212fd443e463a.jpg', 'E4 OLED发光材质 | 3.5K 超视网膜屏 | 智能互联及MIUI+', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505803, 'RedmiBook Pro 15 增强版', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/07ee91a8dd220eba4828c432dfec764c.jpg', '3.2K 超视网膜屏 | 微米级一体精雕 | MX450独立显卡(可选) | Windows 11(可选)', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505804, '小米笔记本Pro X 14', 7499.00, 0, NULL, 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', '将一块高性能光追显卡装入轻薄本，超视网膜屏、高端工艺、智能体验，轻薄性能，小米笔记本Pro X 14，由此诞生。', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505805, 'RedmiBook Pro 15 2022 锐龙版', 4999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/0f8abb2bc3947c4679e3f1b2aafc28c0.jpg', '暑促狂欢季！晒单赢50元红包！全新锐龙6000系列处理器，可选RTX 2050显卡>>可选全新R7 6800H处理器，3.2K 90Hz高清屏，RTX 2050高性能独立显卡，CNC一体精雕工艺', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505806, '小米笔记本Pro 14', 4799.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/3e05c7567ed8df19728311e64fcd701c.jpg', '2.5K超视网膜原色屏，120Hz高刷新率', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505807, '小米笔记本 Pro 15 锐龙版', 5899.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ee0e0409aab8a8052edc172c92942e93.jpg', '大师屏 颠覆视觉 | 动力升级 全「芯」超越', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505808, 'Pro 15.6\" 2020款', 5999.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d9695deb5efdbca6c21d89248dbf3a81.jpg', '全新第十代英特尔酷睿处理器 / MX350显卡 / 全尺寸背光键盘 / 100%sRGB高色域', 1549326247098703873, 0, 0);
INSERT INTO `commodity` VALUES (1546337342148505809, 'Redmibook Pro 15 锐龙版', 4699.00, 0, NULL, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/44d8d53f2f4122a0e6f3440149271f52.jpg', '3.2K 超清视网膜全面屏 | 微米级一体精雕工艺', 1549326247098703873, 0, 0);

-- ----------------------------
-- Table structure for commodity_specs
-- ----------------------------
DROP TABLE IF EXISTS `commodity_specs`;
CREATE TABLE `commodity_specs`  (
  `cs_id` bigint NOT NULL AUTO_INCREMENT,
  `cid` bigint NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cpicture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `c_specs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品规格',
  `c_stock` int NULL DEFAULT 0,
  `cprice` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`cs_id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commodity_specs
-- ----------------------------
INSERT INTO `commodity_specs` VALUES (1, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (2, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (3, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.28676313.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (4, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.29431077.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (5, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30623033.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (6, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (7, 1546337342148505603, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (8, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (9, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (10, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916380.01629945.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (11, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.9633174.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (12, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916378.86522977.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (13, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (14, 1546337342148505605, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (15, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (16, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (17, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.29799298.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (18, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.35062726.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (19, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (20, 1546337342148505606, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (21, 1546337342148505607, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (22, 1546337342148505607, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (23, 1546337342148505607, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (24, 1546337342148505607, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (25, 1546337342148505608, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (26, 1546337342148505608, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (27, 1546337342148505608, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.71929521.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (28, 1546337342148505608, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (29, 1546337342148505608, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (30, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (31, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (32, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.13125707.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (33, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.20061427.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (34, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (35, 1546337342148505611, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (36, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (37, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (38, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08014623.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (39, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07921552.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (40, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08042829.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (41, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (42, 1546337342148505613, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (43, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (44, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (45, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.95638090.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (46, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.0629960.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (47, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.06123122.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (48, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (49, 1546337342148505618, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (50, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30136319.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (51, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648381367.21811717.jpg', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (52, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30147029.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (53, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30124384.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (54, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30136319.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (55, 1546337342148505620, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648381367.21811717.jpg', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (56, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950313.75237391.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (57, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1639469340.48245139.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (58, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950306.77395317.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (59, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950309.35894424.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (60, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950311.52976915.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (61, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950313.75237391.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (62, 1546337342148505622, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1639469340.48245139.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (63, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (64, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (65, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.28676313.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (66, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.29431077.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (67, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30623033.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (68, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (69, 1546337342148505623, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (70, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (71, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (72, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916380.01629945.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (73, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.9633174.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (74, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916378.86522977.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (75, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (76, 1546337342148505623, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (77, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (78, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (79, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.29799298.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (80, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.35062726.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (81, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (82, 1546337342148505626, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (83, 1546337342148505627, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (84, 1546337342148505627, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (85, 1546337342148505627, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (86, 1546337342148505627, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (87, 1546337342148505628, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (88, 1546337342148505628, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (89, 1546337342148505628, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.71929521.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (90, 1546337342148505628, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (91, 1546337342148505628, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (92, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (93, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (94, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.13125707.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (95, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.20061427.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (96, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (97, 1546337342148505631, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (98, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (99, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (100, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08014623.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (101, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07921552.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (102, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08042829.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (103, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (104, 1546337342148505633, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (105, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (106, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (107, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.95638090.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (108, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.0629960.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (109, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.06123122.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (110, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (111, 1546337342148505638, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (112, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30136319.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (113, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648381367.21811717.jpg', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (114, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30147029.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (115, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30124384.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (116, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648434568.30136319.png', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (117, 1546337342148505640, 'Redmi 10A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1648381367.21811717.jpg', NULL, 0, 649.00);
INSERT INTO `commodity_specs` VALUES (118, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950313.75237391.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (119, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1639469340.48245139.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (120, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950306.77395317.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (121, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950309.35894424.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (122, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950311.52976915.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (123, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950313.75237391.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (124, 1546337342148505642, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1639469340.48245139.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (125, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (126, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (127, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.28676313.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (128, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.29431077.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (129, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30623033.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (130, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640682250.30287647.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (131, 1546337342148505643, 'Xiaomi 12', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640679178.10917982.png', NULL, 0, 3699.00);
INSERT INTO `commodity_specs` VALUES (132, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (133, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (134, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916380.01629945.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (135, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.9633174.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (136, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916378.86522977.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (137, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.97893231.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (138, 1546337342148505645, 'Xiaomi 12S', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916379.93048255.png', NULL, 0, 3999.00);
INSERT INTO `commodity_specs` VALUES (139, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (140, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (141, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.29799298.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (142, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.35062726.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (143, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34616761.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (144, 1546337342148505646, 'Xiaomi 12X', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640680211.34933571.png', NULL, 0, 2669.00);
INSERT INTO `commodity_specs` VALUES (145, 1546337342148505647, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (146, 1546337342148505647, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (147, 1546337342148505647, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158757.32312955.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (148, 1546337342148505647, 'Xiaomi 11', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1609158754.96998301.jpg', NULL, 0, 2699.00);
INSERT INTO `commodity_specs` VALUES (149, 1546337342148505647, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (150, 1546337342148505647, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (151, 1546337342148505647, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.71929521.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (152, 1546337342148505647, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.70948543.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (153, 1546337342148505647, 'Xiaomi 12S Ultra', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916095.89126677.png', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (154, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (155, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (156, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.13125707.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (157, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.20061427.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (158, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1634108394.14212775.png', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (159, 1546337342148505651, 'Redmi Note 9 系列', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1606288801.46329073.jpg', NULL, 0, 899.00);
INSERT INTO `commodity_specs` VALUES (160, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (161, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (162, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08014623.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (163, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07921552.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (164, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.08042829.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (165, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.07966928.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (166, 1546337342148505653, 'Redmi 9A', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1595400896.0831679.jpg', NULL, 0, 599.00);
INSERT INTO `commodity_specs` VALUES (167, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (168, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (169, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.95638090.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (170, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.0629960.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (171, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.06123122.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (172, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916237.89556976.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (173, 1546337342148505658, 'Xiaomi 12S Pro', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656916238.05977286.png', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (178, 1546337342148505604, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950313.75237391.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (179, 1546337342148505604, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1639469340.48245139.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (180, 1546337342148505604, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950306.77395317.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (181, 1546337342148505604, 'Xiaomi 11 青春活力版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1638950309.35894424.png', NULL, 0, 1769.00);
INSERT INTO `commodity_specs` VALUES (182, 1546337342148505672, '小米平板5', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d4b9d5790e07d2fe68864f76095ec56.jpg', NULL, 0, 1999.00);
INSERT INTO `commodity_specs` VALUES (183, 1546337342148505673, '小米平板5 Pro', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/01bab266a99ba72b3f23a2c3afd9e69f.jpg', NULL, 0, 3099.00);
INSERT INTO `commodity_specs` VALUES (184, 1546337342148505674, '小米平板5 Pro 5G', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640767473.19941710.jpg', NULL, 0, 3499.00);
INSERT INTO `commodity_specs` VALUES (185, 1546337342148505675, '小米平板 键盘式双面保护壳', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1640694474.97641886.jpg', NULL, 0, 399.00);
INSERT INTO `commodity_specs` VALUES (188, 1546337342148505667, '小米平板 磁吸双面保护壳', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628598862.59259381.png', NULL, 0, 99.00);
INSERT INTO `commodity_specs` VALUES (189, 1546337342148505669, '小米平板钢化保护膜', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1628667565.62194235.png', NULL, 0, 69.00);
INSERT INTO `commodity_specs` VALUES (190, 1546337342148505669, '小米平板防窥钢化保护膜', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1644895798.03681937.png', NULL, 0, 99.00);
INSERT INTO `commodity_specs` VALUES (191, 1546337342148505670, '小米灵感触控笔 笔尖(4枚装)', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636019380.55072114.jpg', NULL, 0, 49.00);
INSERT INTO `commodity_specs` VALUES (224, 1546337342148505690, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272669.11731138.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (225, 1546337342148505690, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (226, 1546337342148505690, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272653.33376534.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (227, 1546337342148505690, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272669.11731138.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (228, 1546337342148505690, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (229, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901881.50413865.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (230, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/77FEA0C99A2824B61078DC4D0212A566.png', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (231, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901868.10969138.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (232, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901875.31632496.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (233, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901881.50413865.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (234, 1546337342148505693, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/77FEA0C99A2824B61078DC4D0212A566.png', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (235, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418673.22999330.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (236, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (237, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418660.76751661.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (238, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418673.22999330.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (239, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (240, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6132905.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (241, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.57263189.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (242, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6196283.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (243, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.61789600.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (244, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.69016795.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (245, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6132905.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (246, 1546337342148505701, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.57263189.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (247, 1546337342148505708, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942453.51098444.jpg', NULL, 0, 3399.00);
INSERT INTO `commodity_specs` VALUES (248, 1546337342148505708, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', NULL, 0, 3399.00);
INSERT INTO `commodity_specs` VALUES (249, 1546337342148505692, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942453.51098444.jpg', NULL, 0, 3399.00);
INSERT INTO `commodity_specs` VALUES (250, 1546337342148505692, '米家智能变频升降吸油烟机S1烟灶套装4.5KW（天然气灶）', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1652942451.59363313.jpg', NULL, 0, 3399.00);
INSERT INTO `commodity_specs` VALUES (251, 1546337342148505691, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272669.11731138.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (252, 1546337342148505691, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (253, 1546337342148505691, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272653.33376534.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (254, 1546337342148505691, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272669.11731138.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (255, 1546337342148505691, '米家冰·洗烘套装', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1657272600.3796730.jpg', NULL, 0, 4798.00);
INSERT INTO `commodity_specs` VALUES (256, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901881.50413865.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (257, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/77FEA0C99A2824B61078DC4D0212A566.png', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (258, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901868.10969138.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (259, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901875.31632496.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (260, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656901881.50413865.jpg', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (261, 1546337342148505713, '米家冰箱 对开门536L 墨羽岩', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/77FEA0C99A2824B61078DC4D0212A566.png', NULL, 0, 2199.00);
INSERT INTO `commodity_specs` VALUES (262, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418673.22999330.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (263, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (264, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418660.76751661.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (265, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418673.22999330.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (266, 1546337342148505694, '小米空调巨省电大1匹新1级', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1656418637.39296454.jpg', NULL, 0, 2099.00);
INSERT INTO `commodity_specs` VALUES (267, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6132905.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (268, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.57263189.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (269, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6196283.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (270, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.61789600.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (271, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.69016795.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (272, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.6132905.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (273, 1546337342148505695, '米家智能无叶净化扇滤芯', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1654100887.57263189.jpg', NULL, 0, 199.00);
INSERT INTO `commodity_specs` VALUES (274, 1546337342148505753, '小米游戏本15.6\"', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557312619.91098890.jpg', NULL, 0, 7999.00);
INSERT INTO `commodity_specs` VALUES (275, 1546337342148505753, '小米游戏本15.6\"', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557312623.98719913.jpg', NULL, 0, 7999.00);
INSERT INTO `commodity_specs` VALUES (276, 1546337342148505753, '小米游戏本15.6\"', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557312622.10117640.jpg', NULL, 0, 7999.00);
INSERT INTO `commodity_specs` VALUES (277, 1546337342148505753, '小米游戏本15.6\"', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557312619.91098890.jpg', NULL, 0, 7999.00);
INSERT INTO `commodity_specs` VALUES (278, 1546337342148505753, '小米游戏本15.6\"', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1557312623.98719913.jpg', NULL, 0, 7999.00);
INSERT INTO `commodity_specs` VALUES (279, 1546337342148505751, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769674.36233114.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (280, 1546337342148505752, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769860.75812473.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (281, 1546337342148505754, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769674.3687056.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (282, 1546337342148505754, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769674.36232393.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (283, 1546337342148505754, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769674.35598160.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (284, 1546337342148505754, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769674.36233114.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (285, 1546337342148505754, '小米笔记本 Pro 14 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1635769860.75812473.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (286, 1546337342148505756, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.47068058.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (287, 1546337342148505755, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.35794278.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (288, 1546337342148505758, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.31876123.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (289, 1546337342148505758, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.21529973.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (290, 1546337342148505758, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.44098283.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (291, 1546337342148505758, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.47068058.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (292, 1546337342148505758, 'RedmiBook 13 全面屏', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575879303.35794278.jpg', NULL, 0, 5499.00);
INSERT INTO `commodity_specs` VALUES (293, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.01673308.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (294, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636426242.12437226.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (295, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.03853718.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (296, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.02119203.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (297, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.02114639.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (298, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.01695451.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (299, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636425071.01673308.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (300, 1546337342148505761, '小米笔记本 Pro 14 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1636426242.12437226.jpg', NULL, 0, 4499.00);
INSERT INTO `commodity_specs` VALUES (301, 1546337342148505757, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947356.05351304.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (302, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947348.13037525.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (303, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947356.06828819.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (304, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947356.08456408.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (305, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947356.06285472.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (306, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947356.05351304.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (307, 1546337342148505759, 'RedmiBook Pro 15 增强版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1633947348.13037525.jpg', NULL, 0, 4799.00);
INSERT INTO `commodity_specs` VALUES (308, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87083016.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (309, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (310, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.85799718.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (311, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.8612384.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (312, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.85961684.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (313, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87083016.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (314, 1546337342148505764, '小米笔记本Pro X 14', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1632736547.87531567.jpg', NULL, 0, 7499.00);
INSERT INTO `commodity_specs` VALUES (315, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.32376677.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (316, 1546337342148505750, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.20295674.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (317, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.12464631.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (318, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.26771073.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (319, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.31133374.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (320, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.32376677.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (321, 1546337342148505765, '小米笔记本 Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1621682489.20295674.jpg', NULL, 0, 5899.00);
INSERT INTO `commodity_specs` VALUES (322, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.98827917.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (323, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.9894566.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (324, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.98929452.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (325, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.98763921.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (326, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.98769949.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (327, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.98827917.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (328, 1546337342148505768, 'Pro 15.6\" 2020款', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1591872099.9894566.jpg', NULL, 0, 5999.00);
INSERT INTO `commodity_specs` VALUES (329, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.04886568.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (330, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.00691428.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (331, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.03463683.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (332, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.05363905.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (333, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.03984929.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (334, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.04886568.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (335, 1546337342148505769, 'Redmibook Pro 15 锐龙版', 'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1622013311.00691428.jpg', NULL, 0, 4699.00);
INSERT INTO `commodity_specs` VALUES (336, 1546337342148505760, 'Redmi G 2021', 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ca42602c4205a894536623ad95f6290f.png', NULL, 0, 5499.00);

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
INSERT INTO `lt_order` VALUES (1549582853853945857, 1548882891587461122, '中国,北京市,市辖区,东城区1111', '2022-07-20 10:31:57', 22.00, NULL, 1);

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
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cid` bigint NOT NULL,
  `cs_id` bigint NULL DEFAULT NULL,
  `cpicture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `cnum` int NULL DEFAULT 0 COMMENT '单个商品购买数量',
  `cprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单/总价(同一件商品的总价)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1549579151449538562, 1549579151256600578, 'Xiaomi 12S Ultra 8GB+256GB', 1546337342148505637, 1, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 18, 1.00);
INSERT INTO `orderitem` VALUES (1549579151449538563, 1549579151256600578, 'Xiaomi 11 青春版 8GB+128GB', 1546337342148505638, 2, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 2, 2.00);
INSERT INTO `orderitem` VALUES (1549582692989804546, 1549582692775895042, 'Xiaomi 12S Ultra 8GB+256GB', 1546337342148505637, 1, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 18, 1.00);
INSERT INTO `orderitem` VALUES (1549582692989804547, 1549582692775895042, 'Xiaomi 11 青春版 8GB+128GB', 1546337342148505638, 2, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 2, 2.00);
INSERT INTO `orderitem` VALUES (1549582853921054722, 1549582853853945857, 'Xiaomi 12S Ultra 8GB+256GB', 1546337342148505637, 1, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 18, 1.00);
INSERT INTO `orderitem` VALUES (1549582853921054723, 1549582853853945857, 'Xiaomi 11 青春版 8GB+128GB', 1546337342148505638, 2, 'D:\\pic\\2022-07\\eef4cc65-c2dc-478a-89bf-b3478c364d0b.jpg', 2, 2.00);

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
INSERT INTO `recommend` VALUES (1549668776079806466, 1546337342148505605, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ce029906e8b21a65cc3ec4966e61ff7d.jpg?w=2452&h=920');
INSERT INTO `recommend` VALUES (1549669409977552898, 1546337342148505648, 'https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ce029906e8b21a65cc3ec4966e61ff7d.jpg?w=2452&h=920');

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
