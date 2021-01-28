/*
 Navicat Premium Data Transfer

 Source Server         : 120.24.20.238
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 120.24.20.238:3306
 Source Schema         : allinone

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 24/01/2021 21:00:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', '2204549043b51611238175765', 1611493212507, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES (1, '算法');
INSERT INTO `article_category` VALUES (2, '面试');
INSERT INTO `article_category` VALUES (3, '框架');
INSERT INTO `article_category` VALUES (4, '基础');
INSERT INTO `article_category` VALUES (5, '测试');
INSERT INTO `article_category` VALUES (6, '本站相关');

-- ----------------------------
-- Table structure for article_info
-- ----------------------------
DROP TABLE IF EXISTS `article_info`;
CREATE TABLE `article_info`  (
  `article_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作者',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '摘要',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0：发布 1：草稿）',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否置顶（0否1是）',
  `is_recommend` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否推荐阅读（0否1是）',
  `like_count` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` int NOT NULL DEFAULT 0 COMMENT '评论数',
  `view_count` int NOT NULL DEFAULT 0 COMMENT '浏览数',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_info
-- ----------------------------
INSERT INTO `article_info` VALUES ('1', 6, '关于本站和博主', 'admin', '关于本站和博主', '>关于本站和博主\n\n### 关于我\n\n一个Java后端程序猿~\n联系我：[QQ](http://sighttp.qq.com/authd?IDKEY=dba7856e44f55986c95b1dfd7bb8d69fc899f608ac8cbd3a)\n### 关于本站\n#### 后台\n\n于若依ruoyi-vue版本修改：\n- 使用mybatis plus替换mybatais\n- ...\n\n#### 前台\n使用vue+iview搭建，响应式布局，适配移动端\n\n#### 部署\n阿里云服务器CentOS7系统\n- Nginx代理\n- Docker容器\n\n### 开发日志\n#### 已完成\n- [x] 后台基本功能\n- [x] 前台基本页面\n#### 待完成\n- [ ] 个人中心页面\n- [ ] 用户注册\n- [ ] 友链\n- [ ] 评论功能、点赞功能\n- [ ] 文章详情页 目录生成、代码复制\n- [ ] 第三方登录-oauth2\n- [ ] 手机号登录\n- [ ] 全局搜索-es\n- [ ] 文件上传模块-oss\n- [ ] 爬虫模块-spider\n- [ ] CI工具搭建-自动化部署-jekins+docker\n- [ ] ...\n\n\n#### 待修复\n- 组件复用引发的路由跳转 内容不刷新\n- 分页按钮无效\n- 按条件排序无效\n- 分类选择样式修改\n- ivie菜单menu 路由跳转样式不变（选中）\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\n\n', '0', '0', '1', '1', 0, 0, 160, 'admin', '2021-01-19 10:04:58', 'admin', '2021-01-19 10:04:58', NULL);
INSERT INTO `article_info` VALUES ('1349958187343691778', 5, 'hello world', 'admin', 'hello world', '# hello world', '0', '0', '0', '0', 0, 0, 10, 'admin', '2020-12-01 05:54:49', 'admin', NULL, NULL);
INSERT INTO `article_info` VALUES ('1349984161871491074', 5, '代码块测试', 'admin', '代码块测试', '[TOC]\n### 标题测试\n##### 哈哈哈\n\n\n```js\nimport request from \'@/utils/request\'\n\n// 查询文章标签关联列表\nexport function listTag(query) {\n  return request({\n    url: \'/system/tag/list\',\n    method: \'get\',\n    params: query\n  })\n}\n\n// 查询文章标签关联详细\nexport function getTag(articleId) {\n  return request({\n    url: \'/system/tag/\' + articleId,\n    method: \'get\'\n  })\n}\n\n// 新增文章标签关联\nexport function addTag(data) {\n  return request({\n    url: \'/system/tag\',\n    method: \'post\',\n    data: data\n  })\n}\n\n// 修改文章标签关联\nexport function updateTag(data) {\n  return request({\n    url: \'/system/tag\',\n    method: \'put\',\n    data: data\n  })\n}\n\n// 删除文章标签关联\nexport function delTag(articleId) {\n  return request({\n    url: \'/system/tag/\' + articleId,\n    method: \'delete\'\n  })\n}\n\n// 导出文章标签关联\nexport function exportTag(query) {\n  return request({\n    url: \'/system/tag/export\',\n    method: \'get\',\n    params: query\n  })\n}\n\n```\n', '0', '0', '0', '0', 0, 0, 25, 'admin', '2021-01-15 07:38:02', 'guest', NULL, NULL);
INSERT INTO `article_info` VALUES ('1350056277287374849', 4, 'BeanUtils.copyProperties如何拷贝list、map？', 'admin', 'BeanUtils.copyProperties如何拷贝list、map？', '# 记录下\n参考：\nhttps://cloud.tencent.com/developer/article/1579645\nhttps://bugpool.blog.csdn.net/article/details/105620681', '0', '0', '0', '1', 0, 0, 39, 'admin', '2021-01-15 12:24:35', 'admin', NULL, NULL);
INSERT INTO `article_info` VALUES ('1350305329899991042', 4, '响应式布局', 'admin', '响应式布局', '名称	尺寸\nxs	<768px\nsm	≥768px\nmd	≥992px\nlg	≥1200px\nxl	≥1920px', '0', '0', '0', '0', 0, 0, 11, 'admin', '2021-01-16 04:54:15', NULL, '2021-01-16 04:54:15', NULL);
INSERT INTO `article_info` VALUES ('1351470701999075329', 1, 'VO、DTO、DO、PO的概念，区别及用法', 'admin', 'VO、DTO、DO、PO的概念，区别及用法', '### 概念\n- VO（View Object）\n视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\n- DTO（Data Transfer Object）\n数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\n- DO（Domain Object）\n领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\n- PO（Persistent Object）\n持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\n\n\n\n1️⃣PO persistent object\n\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\n\n2️⃣VO view object/value object\n\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\n\n3️⃣DTO data trasfer object\n\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\n\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\n\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\n\n4️⃣POJO plain ordinary java object/pure old java object\n\n简单无规则 java 对象，纯的传统意义的 java 对象。\n\n二、复杂Java对象\n1️⃣BO/DO bussiness object/Domain Object\n\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\n\n2️⃣DAO data access object\n\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。', '0', '0', '0', '1', 0, 0, 113, 'admin', '2021-01-17 18:36:23', 'admin', NULL, NULL);
INSERT INTO `article_info` VALUES ('1351541680003657730', 3, '路由切换，页面不更新', 'guest', '路由切换，页面不更新', '路由切换，页面不更新', '0', '0', '0', '1', 0, 0, 11, 'guest', '2021-01-19 14:47:02', NULL, '2021-01-19 14:47:02', NULL);
INSERT INTO `article_info` VALUES ('1352131588049117186', 5, 'test111', 'admin', 'test111', '## test111', '0', '0', '0', '0', 0, 0, 0, 'admin', '2021-01-21 05:51:07', NULL, '2021-01-21 05:51:07', NULL);
INSERT INTO `article_info` VALUES ('1352131684530692097', 5, 'test111ZC', 'admin', 'test111在这次', '**撒打发时光VS的v**', '0', '0', '0', '0', 0, 0, 4, 'admin', '2021-01-21 05:51:30', NULL, '2021-01-21 05:51:30', NULL);
INSERT INTO `article_info` VALUES ('1352131772288114690', 2, '萨达萨达是', 'admin', 'as大大实打实的', '阿三大苏打', '0', '0', '0', '0', 0, 0, 1, 'admin', '2021-01-21 05:51:51', NULL, '2021-01-21 05:51:51', NULL);
INSERT INTO `article_info` VALUES ('1352131902970044418', 6, '啊实打实大苏打', 'admin', 'as大苏打', '阿三大苏打', '0', '0', '0', '0', 0, 0, 14, 'admin', '2021-01-21 05:52:22', NULL, '2021-01-21 05:52:22', NULL);
INSERT INTO `article_info` VALUES ('1353226791648505858', 2, 'z', 'admin', 'zzz', 'zz', '0', '0', '0', '0', 0, 0, 2, 'admin', '2021-01-24 06:23:04', 'admin', '2021-01-24 06:23:04', NULL);
INSERT INTO `article_info` VALUES ('1353324113766187009', 2, 'asdsa', 'guest', 'aaa', 'asdasd', '0', '0', '0', '0', 0, 0, 2, 'guest', '2021-01-24 12:49:48', NULL, '2021-01-24 12:49:48', NULL);

-- ----------------------------
-- Table structure for article_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_info_tag`;
CREATE TABLE `article_info_tag`  (
  `article_id` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
  `tag_id` bigint NOT NULL COMMENT '标签id',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_info_tag
-- ----------------------------
INSERT INTO `article_info_tag` VALUES ('1', 7);
INSERT INTO `article_info_tag` VALUES ('1349958187343691778', 1);
INSERT INTO `article_info_tag` VALUES ('1349984161871491074', 1);
INSERT INTO `article_info_tag` VALUES ('1349984161871491074', 4);
INSERT INTO `article_info_tag` VALUES ('1350056277287374849', 1);
INSERT INTO `article_info_tag` VALUES ('1350056277287374849', 3);
INSERT INTO `article_info_tag` VALUES ('1350305329899991042', 5);
INSERT INTO `article_info_tag` VALUES ('1351470701999075329', 7);
INSERT INTO `article_info_tag` VALUES ('1351541680003657730', 5);
INSERT INTO `article_info_tag` VALUES ('1352131588049117186', 7);
INSERT INTO `article_info_tag` VALUES ('1352131684530692097', 7);
INSERT INTO `article_info_tag` VALUES ('1352131772288114690', 1);
INSERT INTO `article_info_tag` VALUES ('1352131902970044418', 4);
INSERT INTO `article_info_tag` VALUES ('1353226791648505858', 1);
INSERT INTO `article_info_tag` VALUES ('1353226791648505858', 7);
INSERT INTO `article_info_tag` VALUES ('1353324113766187009', 1);
INSERT INTO `article_info_tag` VALUES ('1353324113766187009', 3);
INSERT INTO `article_info_tag` VALUES ('1353324113766187009', 4);

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `tag_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES (1, 'java');
INSERT INTO `article_tag` VALUES (3, 'spring');
INSERT INTO `article_tag` VALUES (4, 'springmvc');
INSERT INTO `article_tag` VALUES (5, 'vue');
INSERT INTO `article_tag` VALUES (6, 'mybatis');
INSERT INTO `article_tag` VALUES (7, '关于');
INSERT INTO `article_tag` VALUES (8, 'JavaScript');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'article_category', '分类表', NULL, NULL, 'ArticleCategory', 'crud', 'top.cloudos.system', 'system', 'category', '分类', 'ruoyi', '0', '/', NULL, 'admin', '2021-01-14 03:54:01', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'article_info', '文章表', NULL, NULL, 'ArticleInfo', 'crud', 'top.cloudos.system', 'system', 'info', '文章', 'ruoyi', '0', '/', NULL, 'admin', '2021-01-14 03:54:02', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'article_info_tag', '文章标签关联表', NULL, NULL, 'ArticleInfoTag', 'crud', 'top.cloudos.system', 'system', 'tag', '文章标签关联', 'ruoyi', '0', '/', NULL, 'admin', '2021-01-14 03:54:03', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'article_tag', '标签表', NULL, NULL, 'ArticleTag', 'crud', 'top.cloudos.system', 'system', 'tag', '标签', 'ruoyi', '0', '/', NULL, 'admin', '2021-01-14 03:54:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (10, '1', 'category_id', '主键', 'bigint', 'Long', 'categoryId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'name', '分类名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'article_id', '主键', 'varchar(31)', 'String', 'articleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'category_id', '分类id', 'bigint', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'title', '文章标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'author', '作者', 'varchar(63)', 'String', 'author', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'summary', '摘要', 'varchar(255)', 'String', 'summary', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-14 03:54:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'like_count', '点赞数', 'int', 'Long', 'likeCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'comment_count', '评论数', 'int', 'Long', 'commentCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'view_count', '浏览数', 'int', 'Long', 'viewCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'update_by', '修改者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '2', 'remark', '说明', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-01-14 03:54:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'article_id', '文章id', 'varchar(31)', 'String', 'articleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-14 03:54:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'tag_id', '标签id', 'bigint', 'Long', 'tagId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-01-14 03:54:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '4', 'tag_id', '主键', 'bigint', 'Long', 'tagId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-14 03:54:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '4', 'name', '标签名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-14 03:54:04', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-01-13 14:51:13', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', 'user123456', 'Y', 'admin', '2021-01-13 14:51:48', 'admin', '2021-01-14 07:29:33', '初始化密码 user123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-01-13 14:52:34', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '', 'XX科技', 0, 'GX', NULL, NULL, '0', '0', '', '2021-01-13 17:25:57', 'admin', '2021-01-13 11:12:59');
INSERT INTO `sys_dept` VALUES (200, 1, ',1', '研发部门', 1, 'dev', '18888888888', 'dev@gmail.com', '0', '0', 'admin', '2021-01-13 10:59:00', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 1, ',1', '运维部门', 2, 'linux', '18989898989', 'linux@gmail.com', '0', '0', 'admin', '2021-01-13 11:00:37', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 1, ',1', '测试部门', 3, 'test', '15656568989', 'test@gmail.com', '0', '0', 'admin', '2021-01-13 11:01:07', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 1, ',1', '市场部门', 4, 'md', '16868868688', 'md@gmail.com', '0', '0', 'admin', '2021-01-13 11:02:55', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 1, ',1', '财务部门', 5, 'fd', '17889788978', 'fd@gmail.com', '0', '0', 'admin', '2021-01-13 11:03:42', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '发布', '0', 'article_status', NULL, NULL, 'N', '0', 'admin', '2021-01-14 13:28:30', '', NULL, '发布状态');
INSERT INTO `sys_dict_data` VALUES (101, 2, '草稿', '1', 'article_status', NULL, NULL, 'N', '0', 'admin', '2021-01-14 13:29:08', '', NULL, '存为草稿');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-24 15:41:20', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '文章状态', 'article_status', '0', 'admin', '2021-01-14 13:10:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-13 08:18:48');
INSERT INTO `sys_login_log` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-13 08:18:59');
INSERT INTO `sys_login_log` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-13 08:19:36');
INSERT INTO `sys_login_log` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 08:22:51');
INSERT INTO `sys_login_log` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 10:23:27');
INSERT INTO `sys_login_log` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 10:48:41');
INSERT INTO `sys_login_log` VALUES (117, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-13 11:27:12');
INSERT INTO `sys_login_log` VALUES (118, 'test', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 11:27:24');
INSERT INTO `sys_login_log` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 15:25:04');
INSERT INTO `sys_login_log` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-13 16:28:08');
INSERT INTO `sys_login_log` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 03:52:53');
INSERT INTO `sys_login_log` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-14 04:48:43');
INSERT INTO `sys_login_log` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 06:10:51');
INSERT INTO `sys_login_log` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 09:43:11');
INSERT INTO `sys_login_log` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 13:06:31');
INSERT INTO `sys_login_log` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-14 14:38:51');
INSERT INTO `sys_login_log` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 05:30:42');
INSERT INTO `sys_login_log` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-15 06:03:21');
INSERT INTO `sys_login_log` VALUES (129, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-15 06:03:38');
INSERT INTO `sys_login_log` VALUES (130, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-15 06:04:25');
INSERT INTO `sys_login_log` VALUES (131, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-15 06:04:49');
INSERT INTO `sys_login_log` VALUES (132, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-15 06:04:58');
INSERT INTO `sys_login_log` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 06:05:12');
INSERT INTO `sys_login_log` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-15 06:08:18');
INSERT INTO `sys_login_log` VALUES (135, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-15 06:08:30');
INSERT INTO `sys_login_log` VALUES (136, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 06:09:14');
INSERT INTO `sys_login_log` VALUES (137, 'aguoxing', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-15 06:14:28');
INSERT INTO `sys_login_log` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 06:14:40');
INSERT INTO `sys_login_log` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 06:53:44');
INSERT INTO `sys_login_log` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 11:35:03');
INSERT INTO `sys_login_log` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 12:18:08');
INSERT INTO `sys_login_log` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 12:56:23');
INSERT INTO `sys_login_log` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-15 17:08:43');
INSERT INTO `sys_login_log` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-01-16 03:42:23');
INSERT INTO `sys_login_log` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-16 03:42:27');
INSERT INTO `sys_login_log` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-16 04:24:26');
INSERT INTO `sys_login_log` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-16 06:31:37');
INSERT INTO `sys_login_log` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-16 08:22:12');
INSERT INTO `sys_login_log` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-17 06:07:01');
INSERT INTO `sys_login_log` VALUES (150, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-17 06:56:33');
INSERT INTO `sys_login_log` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-17 07:37:53');
INSERT INTO `sys_login_log` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-17 09:21:43');
INSERT INTO `sys_login_log` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-17 10:52:09');
INSERT INTO `sys_login_log` VALUES (154, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-17 12:09:52');
INSERT INTO `sys_login_log` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 04:13:51');
INSERT INTO `sys_login_log` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 07:44:10');
INSERT INTO `sys_login_log` VALUES (157, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-18 08:20:31');
INSERT INTO `sys_login_log` VALUES (158, 'admin', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-18 09:29:02');
INSERT INTO `sys_login_log` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:02:38');
INSERT INTO `sys_login_log` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:06:42');
INSERT INTO `sys_login_log` VALUES (161, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:06:55');
INSERT INTO `sys_login_log` VALUES (162, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:07:30');
INSERT INTO `sys_login_log` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:07:40');
INSERT INTO `sys_login_log` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:08:40');
INSERT INTO `sys_login_log` VALUES (165, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:08:50');
INSERT INTO `sys_login_log` VALUES (166, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:09:53');
INSERT INTO `sys_login_log` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:10:03');
INSERT INTO `sys_login_log` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:21:13');
INSERT INTO `sys_login_log` VALUES (169, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:21:26');
INSERT INTO `sys_login_log` VALUES (170, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:23:56');
INSERT INTO `sys_login_log` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:24:06');
INSERT INTO `sys_login_log` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:25:52');
INSERT INTO `sys_login_log` VALUES (173, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:26:05');
INSERT INTO `sys_login_log` VALUES (174, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:26:58');
INSERT INTO `sys_login_log` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:27:08');
INSERT INTO `sys_login_log` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-18 13:43:35');
INSERT INTO `sys_login_log` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-01-18 13:58:05');
INSERT INTO `sys_login_log` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-18 13:58:08');
INSERT INTO `sys_login_log` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 04:43:40');
INSERT INTO `sys_login_log` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 05:22:46');
INSERT INTO `sys_login_log` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 06:50:18');
INSERT INTO `sys_login_log` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 08:14:19');
INSERT INTO `sys_login_log` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 08:49:42');
INSERT INTO `sys_login_log` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 08:57:19');
INSERT INTO `sys_login_log` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 08:57:23');
INSERT INTO `sys_login_log` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 08:58:38');
INSERT INTO `sys_login_log` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 09:06:48');
INSERT INTO `sys_login_log` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 09:08:13');
INSERT INTO `sys_login_log` VALUES (189, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 09:14:50');
INSERT INTO `sys_login_log` VALUES (190, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 09:52:21');
INSERT INTO `sys_login_log` VALUES (191, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 10:03:39');
INSERT INTO `sys_login_log` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 10:03:45');
INSERT INTO `sys_login_log` VALUES (193, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 11:03:19');
INSERT INTO `sys_login_log` VALUES (194, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 11:29:12');
INSERT INTO `sys_login_log` VALUES (195, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 11:37:00');
INSERT INTO `sys_login_log` VALUES (196, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 11:52:01');
INSERT INTO `sys_login_log` VALUES (197, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:03:38');
INSERT INTO `sys_login_log` VALUES (198, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:23:45');
INSERT INTO `sys_login_log` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:26:49');
INSERT INTO `sys_login_log` VALUES (200, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:31:12');
INSERT INTO `sys_login_log` VALUES (201, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:34:54');
INSERT INTO `sys_login_log` VALUES (202, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:43:05');
INSERT INTO `sys_login_log` VALUES (203, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 12:52:22');
INSERT INTO `sys_login_log` VALUES (204, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:00:55');
INSERT INTO `sys_login_log` VALUES (205, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:04:08');
INSERT INTO `sys_login_log` VALUES (206, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:09:43');
INSERT INTO `sys_login_log` VALUES (207, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:20:36');
INSERT INTO `sys_login_log` VALUES (208, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:26:49');
INSERT INTO `sys_login_log` VALUES (209, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:29:41');
INSERT INTO `sys_login_log` VALUES (210, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:33:17');
INSERT INTO `sys_login_log` VALUES (211, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-01-19 13:55:40');
INSERT INTO `sys_login_log` VALUES (212, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 13:55:46');
INSERT INTO `sys_login_log` VALUES (213, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:00:25');
INSERT INTO `sys_login_log` VALUES (214, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:08:39');
INSERT INTO `sys_login_log` VALUES (215, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:11:01');
INSERT INTO `sys_login_log` VALUES (216, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:15:52');
INSERT INTO `sys_login_log` VALUES (217, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 14:17:53');
INSERT INTO `sys_login_log` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:18:08');
INSERT INTO `sys_login_log` VALUES (219, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:26:29');
INSERT INTO `sys_login_log` VALUES (220, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:31:58');
INSERT INTO `sys_login_log` VALUES (221, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:32:22');
INSERT INTO `sys_login_log` VALUES (222, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 14:32:35');
INSERT INTO `sys_login_log` VALUES (223, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:32:44');
INSERT INTO `sys_login_log` VALUES (224, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:41:06');
INSERT INTO `sys_login_log` VALUES (225, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:45:15');
INSERT INTO `sys_login_log` VALUES (226, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 14:45:40');
INSERT INTO `sys_login_log` VALUES (227, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:00:06');
INSERT INTO `sys_login_log` VALUES (228, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-19 15:00:29');
INSERT INTO `sys_login_log` VALUES (229, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:04:20');
INSERT INTO `sys_login_log` VALUES (230, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:13:35');
INSERT INTO `sys_login_log` VALUES (231, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-19 15:20:13');
INSERT INTO `sys_login_log` VALUES (232, 'guest', '192.168.43.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-19 15:25:27');
INSERT INTO `sys_login_log` VALUES (233, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 04:37:16');
INSERT INTO `sys_login_log` VALUES (234, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 04:39:08');
INSERT INTO `sys_login_log` VALUES (235, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 04:41:38');
INSERT INTO `sys_login_log` VALUES (236, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 04:46:31');
INSERT INTO `sys_login_log` VALUES (237, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 04:46:38');
INSERT INTO `sys_login_log` VALUES (238, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 04:46:57');
INSERT INTO `sys_login_log` VALUES (239, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 05:02:01');
INSERT INTO `sys_login_log` VALUES (240, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 08:34:02');
INSERT INTO `sys_login_log` VALUES (241, 'guest', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '退出成功', '2021-01-20 08:51:05');
INSERT INTO `sys_login_log` VALUES (242, 'guest', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2021-01-20 08:52:53');
INSERT INTO `sys_login_log` VALUES (243, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 09:31:00');
INSERT INTO `sys_login_log` VALUES (244, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 09:34:32');
INSERT INTO `sys_login_log` VALUES (245, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 09:41:39');
INSERT INTO `sys_login_log` VALUES (246, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 09:44:49');
INSERT INTO `sys_login_log` VALUES (247, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 12:10:38');
INSERT INTO `sys_login_log` VALUES (248, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-20 12:52:13');
INSERT INTO `sys_login_log` VALUES (249, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-20 15:07:23');
INSERT INTO `sys_login_log` VALUES (250, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-20 15:08:50');
INSERT INTO `sys_login_log` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 05:49:26');
INSERT INTO `sys_login_log` VALUES (252, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 06:41:23');
INSERT INTO `sys_login_log` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 09:40:53');
INSERT INTO `sys_login_log` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-21 09:43:57');
INSERT INTO `sys_login_log` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 09:44:10');
INSERT INTO `sys_login_log` VALUES (256, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 11:57:14');
INSERT INTO `sys_login_log` VALUES (257, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-21 12:15:35');
INSERT INTO `sys_login_log` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 12:15:40');
INSERT INTO `sys_login_log` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-21 12:21:19');
INSERT INTO `sys_login_log` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 12:21:22');
INSERT INTO `sys_login_log` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-21 12:24:22');
INSERT INTO `sys_login_log` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 12:24:31');
INSERT INTO `sys_login_log` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-21 14:07:06');
INSERT INTO `sys_login_log` VALUES (264, 'guest', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 04:38:15');
INSERT INTO `sys_login_log` VALUES (265, 'guest', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 04:41:19');
INSERT INTO `sys_login_log` VALUES (266, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 04:45:04');
INSERT INTO `sys_login_log` VALUES (267, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 05:14:22');
INSERT INTO `sys_login_log` VALUES (268, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-22 05:18:27');
INSERT INTO `sys_login_log` VALUES (269, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 05:18:35');
INSERT INTO `sys_login_log` VALUES (270, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-22 05:21:20');
INSERT INTO `sys_login_log` VALUES (271, 'guest', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 06:09:10');
INSERT INTO `sys_login_log` VALUES (272, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 06:09:46');
INSERT INTO `sys_login_log` VALUES (273, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2021-01-22 06:12:12');
INSERT INTO `sys_login_log` VALUES (274, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2021-01-22 06:12:23');
INSERT INTO `sys_login_log` VALUES (275, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2021-01-22 06:12:36');
INSERT INTO `sys_login_log` VALUES (276, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 06:12:53');
INSERT INTO `sys_login_log` VALUES (277, 'admin', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2021-01-22 06:13:09');
INSERT INTO `sys_login_log` VALUES (278, 'guest', '183.40.238.119, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2021-01-22 06:13:28');
INSERT INTO `sys_login_log` VALUES (279, 'guest', '183.40.29.54, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 09:43:18');
INSERT INTO `sys_login_log` VALUES (280, 'admin', '183.40.29.54, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-22 09:49:49');
INSERT INTO `sys_login_log` VALUES (281, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 15:52:39');
INSERT INTO `sys_login_log` VALUES (282, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 16:23:58');
INSERT INTO `sys_login_log` VALUES (283, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 17:01:04');
INSERT INTO `sys_login_log` VALUES (284, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 17:45:09');
INSERT INTO `sys_login_log` VALUES (285, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-22 18:00:07');
INSERT INTO `sys_login_log` VALUES (286, 'admin', '14.24.193.206, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-23 01:45:23');
INSERT INTO `sys_login_log` VALUES (287, 'admin', '14.24.193.206, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-23 01:55:24');
INSERT INTO `sys_login_log` VALUES (288, 'admin', '14.24.193.206, 172.28.207.127', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2021-01-23 01:56:17');
INSERT INTO `sys_login_log` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-01-24 06:44:24');
INSERT INTO `sys_login_log` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-01-24 07:47:33');
INSERT INTO `sys_login_log` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 07:47:44');
INSERT INTO `sys_login_log` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 09:52:16');
INSERT INTO `sys_login_log` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 11:35:58');
INSERT INTO `sys_login_log` VALUES (294, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 12:08:07');
INSERT INTO `sys_login_log` VALUES (295, 'guest', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-01-24 12:48:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2020-11-24 15:41:20', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-11-24 15:41:20', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2020-11-24 15:41:20', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 10, 'http://ruoyi.vip', NULL, 0, 0, 'M', '0', '1', '', 'guide', 'admin', '2020-11-24 15:41:20', 'admin', '2021-01-14 07:39:32', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-11-24 15:41:20', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2020-11-24 15:41:20', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2020-11-24 15:41:20', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2020-11-24 15:41:20', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2020-11-24 15:41:20', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2020-11-24 15:41:20', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2020-11-24 15:41:20', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2020-11-24 15:41:20', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-11-24 15:41:20', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-11-24 15:41:20', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2020-11-24 15:41:20', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2020-11-24 15:41:20', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2020-11-24 15:41:20', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2020-11-24 15:41:20', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2020-11-24 15:41:20', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2020-11-24 15:41:20', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-11-24 15:41:20', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-11-24 15:41:20', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-11-24 15:41:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '内容管理', 0, 4, '/article', NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2021-01-13 10:29:28', 'admin', '2021-01-21 12:16:09', '');
INSERT INTO `sys_menu` VALUES (2001, '文章管理', 2000, 1, 'content', 'article/content/index', 1, 0, 'C', '0', '0', 'article:content:list', 'documentation', 'admin', '2021-01-13 10:53:14', 'admin', '2021-01-21 12:16:23', '');
INSERT INTO `sys_menu` VALUES (2002, '分类管理', 2000, 2, 'category', 'article/category/index', 1, 0, 'C', '0', '0', 'article:category:list', 'list', 'admin', '2021-01-13 10:54:24', 'admin', '2021-01-14 06:20:19', '');
INSERT INTO `sys_menu` VALUES (2003, '标签管理', 2000, 3, 'tag', 'article/tag/index', 1, 0, 'C', '0', '0', 'article:tag:list', 'rate', 'admin', '2021-01-14 06:30:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '爬虫管理', 0, 5, 'spider', NULL, 1, 0, 'M', '0', '0', NULL, 'bug', 'admin', '2021-01-14 07:36:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '爬虫任务', 2004, 1, 'task', 'spider/task/index', 1, 0, 'C', '0', '0', 'spider:task:list', 'druid', 'admin', '2021-01-14 07:39:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '爬虫配置', 2004, 2, 'config', 'spider/config/index', 1, 0, 'C', '0', '0', 'spider:config:list', 'edit', 'admin', '2021-01-14 07:45:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '新增', 2001, 1, '', NULL, 1, 0, 'F', '0', '0', 'article:content:add', '#', 'admin', '2021-01-18 13:12:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '修改', 2001, 2, '', NULL, 1, 0, 'F', '0', '0', 'article:content:edit', '#', 'admin', '2021-01-18 13:12:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '删除', 2001, 3, '', NULL, 1, 0, 'F', '0', '0', 'article:content:delete', '#', 'admin', '2021-01-18 13:12:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '导出', 2001, 4, '', NULL, 1, 0, 'F', '0', '0', 'article:content:export', '#', 'admin', '2021-01-18 13:13:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '新增', 2002, 1, '', NULL, 1, 0, 'F', '0', '0', 'article:category:add', '#', 'admin', '2021-01-18 13:13:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '修改', 2002, 2, '', NULL, 1, 0, 'F', '0', '0', 'article:category:edit', '#', 'admin', '2021-01-18 13:14:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '删除', 2002, 3, '', NULL, 1, 0, 'F', '0', '0', 'article:category:delete', '#', 'admin', '2021-01-18 13:14:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '新增', 2003, 1, '', NULL, 1, 0, 'F', '0', '0', 'article:tag:add', '#', 'admin', '2021-01-18 13:15:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '修改', 2003, 2, '', NULL, 1, 0, 'F', '0', '0', 'article:tag:edit', '#', 'admin', '2021-01-18 13:15:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '删除', 2003, 3, '', NULL, 1, 0, 'F', '0', '0', 'article:tag:delete', '#', 'admin', '2021-01-18 13:15:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '查询', 2001, 5, '', NULL, 1, 0, 'F', '0', '0', 'article:content:query', '#', 'admin', '2021-01-18 13:18:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, 'Hello World', '2', 0x3C703E48656C6C6F20576F726C643C2F703E, '0', 'admin', '2021-01-13 11:07:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (104, '用户头像', 2, 'top.cloudos.portal.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', 'null', 1, 'C:\\data\\ALLINONE\\uploadPath\\avatar\\2021\\01\\13\\2d50042d-f3d2-4a20-9ef7-08c90089f798.jpeg', '2021-01-13 08:23:35');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":4,\"menuName\":\"文章管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/article\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:29:28');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":5,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1606203680000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:29:56');
INSERT INTO `sys_oper_log` VALUES (107, '参数管理', 9, 'top.cloudos.portal.controller.system.SysConfigController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/config/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:47:32');
INSERT INTO `sys_oper_log` VALUES (108, '在线用户', 7, 'top.cloudos.portal.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, NULL, NULL, '/monitor/online/d927f743-1430-4cef-844e-bf36ad04eecd', '127.0.0.1', '内网IP', '{tokenId=d927f743-1430-4cef-844e-bf36ad04eecd}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:48:23');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":4,\"menuName\":\"文章管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/article\",\"children\":[],\"createTime\":1610504968000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:52:43');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:53:14');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":2,\"menuName\":\"分类管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"/category\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:54:24');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 1, 'top.cloudos.portal.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"研发部门\",\"leader\":\"dev\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"createBy\":\"admin\",\"children\":[],\"phone\":\"18888888888\",\"ancestors\":\",1\",\"email\":\"dev@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 10:59:00');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 1, 'top.cloudos.portal.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"运维部门\",\"leader\":\"linux\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"createBy\":\"admin\",\"children\":[],\"phone\":\"18989898989\",\"ancestors\":\",1\",\"email\":\"linux@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:00:38');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 1, 'top.cloudos.portal.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"测试部门\",\"leader\":\"test\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"createBy\":\"admin\",\"children\":[],\"phone\":\"15656568989\",\"ancestors\":\",1\",\"email\":\"test@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:01:07');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 1, 'top.cloudos.portal.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"市场部门\",\"leader\":\"md\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"createBy\":\"admin\",\"children\":[],\"phone\":\"16868868688\",\"ancestors\":\",1\",\"email\":\"md@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:02:55');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 1, 'top.cloudos.portal.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"财务部门\",\"leader\":\"fd\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"createBy\":\"admin\",\"children\":[],\"phone\":\"17889788978\",\"ancestors\":\",1\",\"email\":\"fd@gmail.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:03:42');
INSERT INTO `sys_oper_log` VALUES (117, '岗位管理', 1, 'top.cloudos.portal.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":0,\"createBy\":\"admin\",\"postName\":\"产品经理\",\"postCode\":\"1\",\"params\":{},\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value\r\n### The error may exist in file [E:\\ideaProject\\allinone\\v2\\allinone\\allinone-system\\target\\classes\\mapper\\SysPostMapper.xml]\r\n### The error may involve top.cloudos.system.mapper.SysPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_post(                    post_code,           post_name,                     status,                     create_by,          create_time         )values(                    ?,           ?,                     ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value\n; Field \'post_sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value', '2021-01-13 11:04:52');
INSERT INTO `sys_oper_log` VALUES (118, '岗位管理', 1, 'top.cloudos.portal.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":0,\"createBy\":\"admin\",\"postName\":\"产品经理\",\"postCode\":\"1\",\"remark\":\"pm\",\"params\":{},\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value\r\n### The error may exist in file [E:\\ideaProject\\allinone\\v2\\allinone\\allinone-system\\target\\classes\\mapper\\SysPostMapper.xml]\r\n### The error may involve top.cloudos.system.mapper.SysPostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_post(                    post_code,           post_name,                     status,           remark,           create_by,          create_time         )values(                    ?,           ?,                     ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value\n; Field \'post_sort\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'post_sort\' doesn\'t have a default value', '2021-01-13 11:05:05');
INSERT INTO `sys_oper_log` VALUES (119, '岗位管理', 1, 'top.cloudos.portal.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":1,\"createBy\":\"admin\",\"postName\":\"产品经理\",\"postCode\":\"1\",\"remark\":\"pm\",\"postId\":4,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:05:26');
INSERT INTO `sys_oper_log` VALUES (120, '通知公告', 1, 'top.cloudos.portal.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>Hello World</p>\",\"createBy\":\"admin\",\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"Hello World\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:07:06');
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 1, 'top.cloudos.portal.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"19989898898\",\"admin\":false,\"remark\":\"dev\",\"password\":\"$2a$10$sMe4joHdkphOXHFTws/Ahev3luDQt/i/9u5aMlY.IYLf0rD6hIRum\",\"postIds\":[],\"email\":\"java@gmail.com\",\"nickName\":\"java开发工程师\",\"sex\":\"0\",\"deptId\":200,\"params\":{},\"userName\":\"java_dev\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:09:04');
INSERT INTO `sys_oper_log` VALUES (122, '岗位管理', 1, 'top.cloudos.portal.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":2,\"createBy\":\"admin\",\"postName\":\"开发工程师\",\"postCode\":\"10\",\"remark\":\"开发工程师\",\"postId\":5,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:09:35');
INSERT INTO `sys_oper_log` VALUES (123, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"19989898898\",\"admin\":false,\"remark\":\"dev\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"java@gmail.com\",\"nickName\":\"java开发工程师\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"java_dev\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1610507344000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:10:15');
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"19989898898\",\"admin\":false,\"remark\":\"dev\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[5],\"loginIp\":\"\",\"email\":\"java@gmail.com\",\"nickName\":\"java开发工程师\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"java_dev\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1610507344000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:10:26');
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":0,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002,4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:11:41');
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002,4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:11:44');
INSERT INTO `sys_oper_log` VALUES (127, '部门管理', 2, 'top.cloudos.portal.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"XX科技\",\"leader\":\"GX\",\"deptId\":1,\"orderNum\":0,\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"\",\"children\":[],\"updateBy\":\"admin\",\"ancestors\":\"\",\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update sys_dept\n         SET status = ?,\n            update_by = ?,\n            update_time = sysdate() \n        where dept_id in ()\r\n### The error may exist in file [E:\\ideaProject\\allinone\\v2\\allinone\\allinone-system\\target\\classes\\mapper\\SysDeptMapper.xml]\r\n### The error may involve top.cloudos.system.mapper.SysDeptMapper.updateDeptStatus\r\n### The error occurred while executing an update\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Failed to process, Error SQL: update sys_dept\n         SET status = ?,\n            update_by = ?,\n            update_time = sysdate() \n        where dept_id in ()', '2021-01-13 11:12:59');
INSERT INTO `sys_oper_log` VALUES (128, '岗位管理', 1, 'top.cloudos.portal.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":3,\"createBy\":\"admin\",\"postName\":\"测试工程师\",\"postCode\":\"3\",\"remark\":\"测试工程师\",\"postId\":6,\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:14:03');
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 1, 'top.cloudos.portal.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15959989878\",\"admin\":false,\"remark\":\"test\",\"password\":\"$2a$10$cQkSoW1hrHmPNlST/l6gme/.lXrumz8oxb3OOKqv2avZaFRLBmTlK\",\"postIds\":[6],\"email\":\"javatest@gmail.com\",\"nickName\":\"junit\",\"sex\":\"0\",\"deptId\":202,\"params\":{},\"userName\":\"test\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:15:05');
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15959989878\",\"admin\":false,\"remark\":\"test\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[6],\"loginIp\":\"\",\"email\":\"javatest@gmail.com\",\"nickName\":\"测试工程师\",\"sex\":\"0\",\"deptId\":202,\"avatar\":\"\",\"params\":{},\"userName\":\"test\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1610507705000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:15:41');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"admin\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002,4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:21:04');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"admin\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:22:26');
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"admin\",\"deptIds\":[],\"menuIds\":[4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:22:33');
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"*:*\",\"roleName\":\"admin\",\"deptIds\":[],\"menuIds\":[4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:22:49');
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":1,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":false,\"roleKey\":\"*:*\",\"roleName\":\"admin\",\"deptIds\":[],\"menuIds\":[4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 11:22:54');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'top.cloudos.portal.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"params\":{},\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员角色', '2021-01-13 11:24:12');
INSERT INTO `sys_oper_log` VALUES (137, '在线用户', 7, 'top.cloudos.portal.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/monitor/online/5a320c27-13de-430b-a462-14d80f905a1b', '127.0.0.1', '内网IP', '{tokenId=5a320c27-13de-430b-a462-14d80f905a1b}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 11:28:01');
INSERT INTO `sys_oper_log` VALUES (138, '用户管理', 5, 'top.cloudos.portal.controller.system.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"427811cc-6bb2-4255-9393-7e9939eb23c5_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-01-13 11:29:07');
INSERT INTO `sys_oper_log` VALUES (139, '用户头像', 2, 'top.cloudos.portal.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', 'null', 1, 'C:\\data\\ALLINONE\\uploadPath\\avatar\\2021\\01\\13\\3901e871-6731-405b-81c3-afc49e144ab4.jpeg', '2021-01-13 15:26:56');
INSERT INTO `sys_oper_log` VALUES (140, '个人信息', 2, 'top.cloudos.portal.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18888888888\",\"admin\":true,\"delFlag\":\"0\",\"password\":\"$2a$10$4oKPbhty6RXBDJvwivTqA.dXME7kEmk13Zrx83hDI5Nm6af1vfXiu\",\"loginIp\":\"\",\"email\":\"3334412097@qq.com\",\"nickName\":\"系统管理员\",\"sex\":\"1\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 15:40:47');
INSERT INTO `sys_oper_log` VALUES (141, '个人信息', 2, 'top.cloudos.portal.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18888888888\",\"admin\":true,\"delFlag\":\"0\",\"password\":\"$2a$10$4oKPbhty6RXBDJvwivTqA.dXME7kEmk13Zrx83hDI5Nm6af1vfXiu\",\"loginIp\":\"\",\"email\":\"3334412097@qq.com\",\"nickName\":\"系统管理员\",\"sex\":\"0\",\"deptId\":1,\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 15:41:13');
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":2,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"tset\",\"roleName\":\"test\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002,4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'menuCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 17:04:06');
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":2,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"test\",\"roleName\":\"test\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1058,1056,1057,1059,1060,115,2000,2001,2002,4],\"status\":\"0\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: Illegal overloaded getter method with ambiguous type for property \'deptCheckStrictly\' in class \'top.cloudos.common.core.model.entity.SysRole\'. This breaks the JavaBeans specification and can cause unpredictable results.', '2021-01-13 17:08:52');
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":2,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"sdf\",\"roleName\":\"sf\",\"deptIds\":[],\"menuIds\":[4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 17:10:34');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 3, 'top.cloudos.portal.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/100', '127.0.0.1', '内网IP', '{roleIds=100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-13 17:10:57');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'top.cloudos.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 03:53:42');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 6, 'top.cloudos.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'article_category,article_info,article_info_tag,article_tag', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 03:54:04');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-14 04:16:39');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-14 04:19:23');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-14 04:36:33');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"/article/category\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:13:29');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"/article/category\",\"component\":\"/article/category\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:14:36');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"article\",\"component\":\"article/category/index\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:15:16');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":2,\"menuName\":\"分类管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"article\",\"component\":\"article/category/index\",\"children\":[],\"createTime\":1610506464000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:15:51');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"article\",\"component\":\"article/content/index\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:16:01');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"content\",\"component\":\"article/content/index\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"article:content:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:20:02');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":2,\"menuName\":\"分类管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"category\",\"component\":\"article/category/index\",\"children\":[],\"createTime\":1610506464000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"article:category:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:20:19');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-14 06:21:07');
INSERT INTO `sys_oper_log` VALUES (159, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"Java\",\"params\":{},\"categoryId\":1349604099754131458}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:27:47');
INSERT INTO `sys_oper_log` VALUES (160, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"spring\",\"params\":{},\"categoryId\":1349604222487855106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:28:16');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"rate\",\"orderNum\":3,\"menuName\":\"标签管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"tag\",\"component\":\"article/tag/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"article:tag:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:30:32');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-14 06:35:27');
INSERT INTO `sys_oper_log` VALUES (163, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":1349606598686900226,\"name\":\"java\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:37:42');
INSERT INTO `sys_oper_log` VALUES (164, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":1349606644866187265,\"name\":\"mysql\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:37:53');
INSERT INTO `sys_oper_log` VALUES (165, '标签', 3, 'top.cloudos.article.controller.ArticleTagController.remove()', 'DELETE', 1, 'admin', NULL, '/article/tag/1349606598686900200', '127.0.0.1', '内网IP', '{tagIds=1349606598686900200}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-01-14 06:39:43');
INSERT INTO `sys_oper_log` VALUES (166, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"框架\",\"params\":{},\"categoryId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 06:43:48');
INSERT INTO `sys_oper_log` VALUES (167, '参数管理', 2, 'top.cloudos.portal.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"用户管理-账号初始密码\",\"configKey\":\"sys.user.initPassword\",\"createBy\":\"admin\",\"createTime\":1610520708000,\"updateBy\":\"admin\",\"configId\":2,\"remark\":\"初始化密码 user123456\",\"configType\":\"Y\",\"configValue\":\"user123456\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:29:34');
INSERT INTO `sys_oper_log` VALUES (168, '分类', 2, 'top.cloudos.article.controller.ArticleCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"算法\",\"params\":{},\"categoryId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:34:22');
INSERT INTO `sys_oper_log` VALUES (169, '分类', 2, 'top.cloudos.article.controller.ArticleCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"面试\",\"params\":{},\"categoryId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:34:38');
INSERT INTO `sys_oper_log` VALUES (170, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"基础\",\"params\":{},\"categoryId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:34:49');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":5,\"menuName\":\"爬虫管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"spider\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:36:34');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"druid\",\"orderNum\":1,\"menuName\":\"爬虫任务\",\"params\":{},\"parentId\":2004,\"isCache\":\"0\",\"path\":\"task\",\"component\":\"spider/task/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"spider:task:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:39:14');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":10,\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1606203680000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:39:32');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":2,\"menuName\":\"爬虫配置\",\"params\":{},\"parentId\":2004,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"spider/config/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"spider:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 07:45:40');
INSERT INTO `sys_oper_log` VALUES (175, '字典类型', 1, 'top.cloudos.portal.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章状态\",\"params\":{},\"dictType\":\"article_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 13:10:46');
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'top.cloudos.portal.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":1,\"remark\":\"发布状态\",\"params\":{},\"dictType\":\"article_status\",\"dictLabel\":\"发布\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 13:28:31');
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 1, 'top.cloudos.portal.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":2,\"remark\":\"存为草稿\",\"params\":{},\"dictType\":\"article_status\",\"dictLabel\":\"草稿\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 13:29:08');
INSERT INTO `sys_oper_log` VALUES (178, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"驱蚊器\",\"articleId\":\"1349720511009038337\",\"params\":{},\"title\":\"请问\",\"content\":\"asdasd\",\"categoryId\":1,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'author\' doesn\'t have a default value\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info  ( article_id, category_id, title,  summary, content,  status )  VALUES  ( ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLException: Field \'author\' doesn\'t have a default value\n; Field \'author\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'author\' doesn\'t have a default value', '2021-01-14 14:10:22');
INSERT INTO `sys_oper_log` VALUES (179, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"1\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"1\",\"articleId\":\"1\",\"likeCount\":0,\"params\":{},\"title\":\"VO、DTO、DO、PO的概念，区别及用法\",\"content\":\"概念：\\nVO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\\nDO（Domain Object）：领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\\nPO（Persistent Object）：持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\\n\\n1️⃣PO persistent object\\n\\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\\n\\n2️⃣VO view object/value object\\n\\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\\n\\n3️⃣DTO data trasfer object\\n\\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\\n\\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\\n\\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\\n\\n4️⃣POJO plain ordinary java object/pure old java object\\n\\n简单无规则 java 对象，纯的传统意义的 java 对象。\\n\\n二、复杂Java对象\\n1️⃣BO/DO bussiness object/Domain Object\\n\\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\\n\\n2️⃣DAO data access object\\n\\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610634983000,\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 14:41:25');
INSERT INTO `sys_oper_log` VALUES (180, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"1\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"1\",\"articleId\":\"1\",\"likeCount\":0,\"params\":{},\"title\":\"VO、DTO、DO、PO的概念，区别及用法\",\"content\":\"概念：\\nVO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\\nDO（Domain Object）：领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\\nPO（Persistent Object）：持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\\n\\n1️⃣PO persistent object\\n\\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\\n\\n2️⃣VO view object/value object\\n\\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\\n\\n3️⃣DTO data trasfer object\\n\\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\\n\\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\\n\\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\\n\\n4️⃣POJO plain ordinary java object/pure old java object\\n\\n简单无规则 java 对象，纯的传统意义的 java 对象。\\n\\n二、复杂Java对象\\n1️⃣BO/DO bussiness object/Domain Object\\n\\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\\n\\n2️⃣DAO data access object\\n\\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610634983000,\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 14:41:54');
INSERT INTO `sys_oper_log` VALUES (181, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"VO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"1\",\"articleId\":\"1\",\"likeCount\":0,\"params\":{},\"title\":\"VO、DTO、DO、PO的概念，区别及用法\",\"content\":\"概念：\\nVO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\\nDO（Domain Object）：领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\\nPO（Persistent Object）：持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\\n\\n1️⃣PO persistent object\\n\\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\\n\\n2️⃣VO view object/value object\\n\\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\\n\\n3️⃣DTO data trasfer object\\n\\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\\n\\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\\n\\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\\n\\n4️⃣POJO plain ordinary java object/pure old java object\\n\\n简单无规则 java 对象，纯的传统意义的 java 对象。\\n\\n二、复杂Java对象\\n1️⃣BO/DO bussiness object/Domain Object\\n\\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\\n\\n2️⃣DAO data access object\\n\\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610634983000,\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-14 14:43:56');
INSERT INTO `sys_oper_log` VALUES (182, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"阿瑟东\",\"params\":{},\"title\":\"啊啊阿瑟东\",\"content\":\"# Hello World\",\"categoryId\":2,\"status\":\"0\"}', 'null', 1, '', '2021-01-15 05:31:24');
INSERT INTO `sys_oper_log` VALUES (183, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"阿瑟东\",\"params\":{},\"title\":\"啊啊阿瑟东\",\"content\":\"# Hello World\",\"categoryId\":2,\"status\":\"0\"}', 'null', 1, '', '2021-01-15 05:34:02');
INSERT INTO `sys_oper_log` VALUES (184, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"a\",\"params\":{},\"title\":\"aa\",\"content\":\"aaa\",\"categoryId\":2}', 'null', 1, '', '2021-01-15 05:34:34');
INSERT INTO `sys_oper_log` VALUES (185, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaa\",\"tagIds\":[1,2],\"params\":{},\"title\":\"a\",\"content\":\"aaa\",\"categoryId\":2,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'article_id\' cannot be null\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoTagMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoTagMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info_tag  ( article_id, tag_id )  VALUES  ( ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'article_id\' cannot be null\n; Column \'article_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'article_id\' cannot be null', '2021-01-15 05:43:18');
INSERT INTO `sys_oper_log` VALUES (186, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"tset\",\"tagIds\":[2,1],\"articleId\":\"1349956299319726081\",\"params\":{},\"title\":\"test\",\"content\":\"test\",\"categoryId\":4,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'author\' doesn\'t have a default value\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info  ( article_id, category_id, title,  summary, content,  status )  VALUES  ( ?, ?, ?,  ?, ?,  ? )\r\n### Cause: java.sql.SQLException: Field \'author\' doesn\'t have a default value\n; Field \'author\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'author\' doesn\'t have a default value', '2021-01-15 05:47:19');
INSERT INTO `sys_oper_log` VALUES (187, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaaa\",\"author\":\"admin\",\"tagIds\":[2,1],\"articleId\":\"1349956781337583618\",\"params\":{},\"title\":\"aaa\",\"content\":\"a\",\"categoryId\":4,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info  ( article_id, category_id, title, author, summary, content,  status )  VALUES  ( ?, ?, ?, ?, ?, ?,  ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-01-15 05:49:14');
INSERT INTO `sys_oper_log` VALUES (188, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaa\",\"author\":\"admin\",\"tagIds\":[2,1],\"articleId\":\"1349957780361986049\",\"params\":{},\"title\":\"a\",\"content\":\"aaaaa\",\"createBy\":\"admin\",\"categoryId\":2,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info  ( article_id, category_id, title, author, summary, content,  status,      create_by )  VALUES  ( ?, ?, ?, ?, ?, ?,  ?,      ? )\r\n### Cause: java.sql.SQLException: Field \'create_time\' doesn\'t have a default value\n; Field \'create_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_time\' doesn\'t have a default value', '2021-01-15 05:53:12');
INSERT INTO `sys_oper_log` VALUES (189, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaa\",\"author\":\"admin\",\"tagIds\":[2,1],\"articleId\":\"1349958187343691778\",\"params\":{},\"title\":\"a\",\"content\":\"aaaaa\",\"createBy\":\"admin\",\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 05:54:49');
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 1, 'top.cloudos.portal.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18988999988\",\"admin\":false,\"remark\":\"admin\",\"password\":\"$2a$10$14fda2rFMwEnsyK5dAKQ/..6a0dtDH6G55kwrMr2VXFLG/gLFIXqa\",\"postIds\":[5],\"email\":\"aguoxing101@gmail.com\",\"nickName\":\"aguoxing\",\"sex\":\"0\",\"deptId\":200,\"params\":{},\"userName\":\"星\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:00:23');
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":101,\"admin\":false,\"remark\":\"系统管理员\",\"params\":{},\"roleSort\":2,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"system\",\"roleName\":\"系统管理员\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,2000,2001,2002,2003,2004,2005,2006,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:01:15');
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18988999988\",\"admin\":false,\"remark\":\"admin\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[5],\"loginIp\":\"\",\"email\":\"aguoxing101@gmail.com\",\"nickName\":\"aguoxing\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"星\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[101],\"createTime\":1610661623000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:03:02');
INSERT INTO `sys_oper_log` VALUES (193, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":102,\"admin\":false,\"remark\":\"普通用户\",\"params\":{},\"roleSort\":3,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:06:09');
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 1, 'top.cloudos.portal.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"remark\":\"游客\",\"params\":{},\"roleSort\":4,\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"guest\",\"roleName\":\"游客\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:06:40');
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"19989898898\",\"admin\":false,\"remark\":\"dev\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[5],\"loginIp\":\"\",\"email\":\"java@gmail.com\",\"nickName\":\"java开发工程师\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"java_dev\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1610507344000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:07:09');
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"19989898898\",\"admin\":false,\"remark\":\"dev\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[5],\"loginIp\":\"\",\"email\":\"java@gmail.com\",\"nickName\":\"java开发工程师\",\"sex\":\"0\",\"deptId\":200,\"avatar\":\"\",\"params\":{},\"userName\":\"java_dev\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1610507344000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:07:10');
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15959989878\",\"admin\":false,\"remark\":\"test\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[6],\"loginIp\":\"\",\"email\":\"javatest@gmail.com\",\"nickName\":\"测试工程师\",\"sex\":\"0\",\"deptId\":202,\"avatar\":\"\",\"params\":{},\"userName\":\"test\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1610507705000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:07:23');
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 2, 'top.cloudos.portal.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"15959989878\",\"admin\":false,\"remark\":\"test\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[6],\"loginIp\":\"\",\"email\":\"javatest@gmail.com\",\"nickName\":\"测试工程师\",\"sex\":\"0\",\"deptId\":202,\"avatar\":\"\",\"params\":{},\"userName\":\"test\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1610507705000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 06:07:24');
INSERT INTO `sys_oper_log` VALUES (199, '文章', 5, 'top.cloudos.article.controller.ArticleInfoController.export()', 'GET', 1, 'admin', NULL, '/article/info/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"75c8ec84-bfe7-4ad1-819f-93f6f20cf48b_info.xlsx\",\"code\":200}', 0, NULL, '2021-01-15 06:17:27');
INSERT INTO `sys_oper_log` VALUES (200, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"hello world\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1349958187343691778\",\"likeCount\":0,\"params\":{},\"title\":\"hello world\",\"content\":\"# hello world\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610661289000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 07:06:00');
INSERT INTO `sys_oper_log` VALUES (201, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"代码块测试\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1349984161871491074\",\"params\":{},\"title\":\"代码块测试\",\"content\":\"```js\\nimport request from \'@/utils/request\'\\n\\n// 查询文章标签关联列表\\nexport function listTag(query) {\\n  return request({\\n    url: \'/system/tag/list\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n// 查询文章标签关联详细\\nexport function getTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'get\'\\n  })\\n}\\n\\n// 新增文章标签关联\\nexport function addTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'post\',\\n    data: data\\n  })\\n}\\n\\n// 修改文章标签关联\\nexport function updateTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'put\',\\n    data: data\\n  })\\n}\\n\\n// 删除文章标签关联\\nexport function delTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'delete\'\\n  })\\n}\\n\\n// 导出文章标签关联\\nexport function exportTag(query) {\\n  return request({\\n    url: \'/system/tag/export\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n```\\n\",\"createBy\":\"admin\",\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 07:38:02');
INSERT INTO `sys_oper_log` VALUES (202, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"代码块测试\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1349984161871491074\",\"likeCount\":0,\"params\":{},\"title\":\"代码块测试\",\"content\":\"@[TOC]\\n### 标题测试\\n##### 哈哈哈\\n\\n\\n```js\\nimport request from \'@/utils/request\'\\n\\n// 查询文章标签关联列表\\nexport function listTag(query) {\\n  return request({\\n    url: \'/system/tag/list\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n// 查询文章标签关联详细\\nexport function getTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'get\'\\n  })\\n}\\n\\n// 新增文章标签关联\\nexport function addTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'post\',\\n    data: data\\n  })\\n}\\n\\n// 修改文章标签关联\\nexport function updateTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'put\',\\n    data: data\\n  })\\n}\\n\\n// 删除文章标签关联\\nexport function delTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'delete\'\\n  })\\n}\\n\\n// 导出文章标签关联\\nexport function exportTag(query) {\\n  return request({\\n    url: \'/system/tag/export\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n```\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610667482000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 07:39:33');
INSERT INTO `sys_oper_log` VALUES (203, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"测试\",\"params\":{},\"categoryId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:35:24');
INSERT INTO `sys_oper_log` VALUES (204, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaa\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1350044009212461058\",\"params\":{},\"title\":\"啊啊啊\",\"content\":\"asdasd\",\"createBy\":\"admin\",\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:35:51');
INSERT INTO `sys_oper_log` VALUES (205, '分类', 3, 'top.cloudos.article.controller.ArticleCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/article/category/5', '127.0.0.1', '内网IP', '{categoryIds=5}', 'null', 1, '当前分类下有文章，不能删除！', '2021-01-15 11:36:15');
INSERT INTO `sys_oper_log` VALUES (206, '分类', 3, 'top.cloudos.article.controller.ArticleCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/article/category/5', '127.0.0.1', '内网IP', '{categoryIds=5}', 'null', 1, '当前分类下有文章，不能删除！', '2021-01-15 11:36:30');
INSERT INTO `sys_oper_log` VALUES (207, '文章', 3, 'top.cloudos.article.controller.ArticleInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/article/info/1350044009212461058', '127.0.0.1', '内网IP', '{articleIds=1350044009212461058}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:36:40');
INSERT INTO `sys_oper_log` VALUES (208, '标签', 3, 'top.cloudos.article.controller.ArticleTagController.remove()', 'DELETE', 1, 'admin', NULL, '/article/tag/2', '127.0.0.1', '内网IP', '{tagIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:46:40');
INSERT INTO `sys_oper_log` VALUES (209, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":3,\"name\":\"java\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:47:00');
INSERT INTO `sys_oper_log` VALUES (210, '标签', 2, 'top.cloudos.article.controller.ArticleTagController.edit()', 'PUT', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":3,\"name\":\"spring\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:47:11');
INSERT INTO `sys_oper_log` VALUES (211, '标签', 3, 'top.cloudos.article.controller.ArticleTagController.remove()', 'DELETE', 1, 'admin', NULL, '/article/tag/1', '127.0.0.1', '内网IP', '{tagIds=1}', 'null', 1, '当前标签下有文章，不能删除！', '2021-01-15 11:47:17');
INSERT INTO `sys_oper_log` VALUES (212, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":4,\"name\":\"springmvc\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:47:37');
INSERT INTO `sys_oper_log` VALUES (213, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":5,\"name\":\"vue\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:47:45');
INSERT INTO `sys_oper_log` VALUES (214, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":6,\"name\":\"mybatis\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 11:47:54');
INSERT INTO `sys_oper_log` VALUES (215, '标签', 3, 'top.cloudos.article.controller.ArticleTagController.remove()', 'DELETE', 1, 'admin', NULL, '/article/tag/1', '127.0.0.1', '内网IP', '{tagIds=1}', 'null', 1, '当前标签下有文章，不能删除！', '2021-01-15 11:55:43');
INSERT INTO `sys_oper_log` VALUES (216, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"BeanUtils.copyProperties如何拷贝list、map？\",\"author\":\"admin\",\"tagIds\":[3],\"articleId\":\"1350056277287374849\",\"params\":{},\"title\":\"BeanUtils.copyProperties如何拷贝list、map？\",\"content\":\"# 记录下\\n```java\\npublic class ListUtils<T> {\\n    public void copyList(Object obj, List<T> list2, Class<T> classObj) {\\n        if ((!Objects.isNull(obj)) && (!Objects.isNull(list2))) {\\n            List list1 = (List) obj;\\n            list1.forEach(item -> {\\n                try {\\n                    T data = classObj.newInstance();\\n                    BeanUtils.copyProperties(item, data);\\n                    list2.add(data);\\n                } catch (InstantiationException e) {\\n                } catch (IllegalAccessException e) {\\n                }\\n\\n\\n            });\\n        }\\n    }\\n}\\n\\nService方法:\\n  @Override\\n    public Result<List<UserVO>> getUserInfoToList(List<UserParam> params) throws Exception {\\n        ListUtils<UserVO> utils = BeanUtils.instantiate(ListUtils.class);\\n        List<UserEntity> userList = userDAO.getUseByListID(params);\\n        List<UserVO> userInfoList = Lists.newLinkedList();\\n        utils.copyList(userList, userInfoList, UserVO.class);\\n        return Result.successResult(userInfoList);\\n    }\\n\\n```\",\"createBy\":\"admin\",\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 12:24:36');
INSERT INTO `sys_oper_log` VALUES (217, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"BeanUtils.copyProperties如何拷贝list、map？\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1,3],\"articleId\":\"1350056277287374849\",\"likeCount\":0,\"params\":{},\"title\":\"BeanUtils.copyProperties如何拷贝list、map？\",\"content\":\"# 记录下\\n参考：\\nhttps://cloud.tencent.com/developer/article/1579645\\nhttps://bugpool.blog.csdn.net/article/details/105620681\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610684675000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 13:06:36');
INSERT INTO `sys_oper_log` VALUES (218, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"VO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"1\",\"tagIds\":[1,3],\"articleId\":\"1\",\"likeCount\":0,\"params\":{},\"title\":\"VO、DTO、DO、PO的概念，区别及用法\",\"content\":\"概念：\\nVO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\nDTO（Data Transfer Object）：数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\\nDO（Domain Object）：领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\\nPO（Persistent Object）：持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\\n\\n1️⃣PO persistent object\\n\\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\\n\\n2️⃣VO view object/value object\\n\\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\\n\\n3️⃣DTO data trasfer object\\n\\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\\n\\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\\n\\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\\n\\n4️⃣POJO plain ordinary java object/pure old java object\\n\\n简单无规则 java 对象，纯的传统意义的 java 对象。\\n\\n二、复杂Java对象\\n1️⃣BO/DO bussiness object/Domain Object\\n\\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\\n\\n2️⃣DAO data access object\\n\\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610634983000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":0,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 13:48:02');
INSERT INTO `sys_oper_log` VALUES (219, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"a\",\"author\":\"admin\",\"tagIds\":[],\"articleId\":\"1350085764075089921\",\"params\":{},\"title\":\"a\",\"content\":\"\",\"createBy\":\"admin\",\"categoryId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 14:21:46');
INSERT INTO `sys_oper_log` VALUES (220, '文章', 3, 'top.cloudos.article.controller.ArticleInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/article/info/1350085764075089921', '127.0.0.1', '内网IP', '{articleIds=1350085764075089921}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-15 14:22:01');
INSERT INTO `sys_oper_log` VALUES (221, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"响应式布局\",\"author\":\"admin\",\"tagIds\":[5],\"articleId\":\"1350305329899991042\",\"params\":{},\"title\":\"响应式布局\",\"content\":\"名称\\t尺寸\\nxs\\t<768px\\nsm\\t≥768px\\nmd\\t≥992px\\nlg\\t≥1200px\\nxl\\t≥1920px\",\"createBy\":\"admin\",\"categoryId\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-16 04:54:15');
INSERT INTO `sys_oper_log` VALUES (222, '用户管理', 3, 'top.cloudos.portal.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100,101', '127.0.0.1', '内网IP', '{userIds=100,101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:03:46');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 1, 'top.cloudos.portal.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18933338888\",\"admin\":false,\"remark\":\"游客\",\"password\":\"$2a$10$Neia1ZGOpPpRibcX8S0suuRZIdVbKz3SiXx/2SPJUnly5Y0A6VVu2\",\"postIds\":[6],\"email\":\"guest@163.com\",\"nickName\":\"guest\",\"sex\":\"0\",\"deptId\":202,\"params\":{},\"userName\":\"guest\",\"userId\":103,\"createBy\":\"admin\",\"roleIds\":[103],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:05:45');
INSERT INTO `sys_oper_log` VALUES (224, '个人信息', 2, 'top.cloudos.portal.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'guest', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', 'user123456 guest123', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:07:24');
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 2, 'top.cloudos.portal.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"remark\":\"游客\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":4,\"deptCheckStrictly\":true,\"createTime\":1610662000000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"guest\",\"roleName\":\"游客\",\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,2000,2001,2002,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:08:35');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'top.cloudos.generator.controller.GenController.batchGenCode()', 'GET', 1, 'guest', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 1, '', '2021-01-18 13:09:26');
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"新增\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:content:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:12:00');
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"修改\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:content:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:12:28');
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"删除\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:content:delete\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:12:51');
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"导出\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:content:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:13:16');
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"新增\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:category:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:13:48');
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"修改\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:category:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:14:16');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"删除\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:category:delete\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:14:44');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"新增\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:tag:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:15:19');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"修改\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:tag:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:15:38');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"删除\",\"params\":{},\"parentId\":2003,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:tag:delete\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:15:54');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 1, 'top.cloudos.portal.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":5,\"menuName\":\"查询\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"article:content:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:18:37');
INSERT INTO `sys_oper_log` VALUES (238, '角色管理', 2, 'top.cloudos.portal.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"remark\":\"游客\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":4,\"deptCheckStrictly\":true,\"createTime\":1610662000000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"guest\",\"roleName\":\"游客\",\"menuIds\":[1,100,101,102,103,104,105,106,107,2,109,110,1001,1005,1006,1008,1012,1013,1017,1021,1026,1030,1031,1035,1036,108,500,1040,1041,1042,501,1043,1044,1045,1046,1049,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,2000,2001,2007,2008,2009,2010,2017,2002,2011,2012,2013,2003,2014,2015,2016],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:21:06');
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'top.cloudos.portal.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"remark\":\"游客\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":4,\"deptCheckStrictly\":true,\"createTime\":1610662000000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"guest\",\"roleName\":\"游客\",\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,3,113,114,1055,1056,1058,1057,1059,1060,115,2000,2001,2007,2008,2009,2010,2017,2002,2011,2012,2013,2003,2014,2015,2016,2004,2005,2006],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-18 13:25:45');
INSERT INTO `sys_oper_log` VALUES (240, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1351470701999075329\",\"params\":{},\"title\":\"关于本站和博主\",\"content\":\"关于本站和博主\",\"createBy\":\"admin\",\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-19 10:04:59');
INSERT INTO `sys_oper_log` VALUES (241, '分类', 1, 'top.cloudos.article.controller.ArticleCategoryController.add()', 'POST', 1, 'admin', NULL, '/article/category', '127.0.0.1', '内网IP', '{\"name\":\"本站相关\",\"params\":{},\"categoryId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-19 10:06:20');
INSERT INTO `sys_oper_log` VALUES (242, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":7,\"name\":\"关于\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-19 10:06:48');
INSERT INTO `sys_oper_log` VALUES (243, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1351470701999075329\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\"关于本站和博主\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":2,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-19 10:07:22');
INSERT INTO `sys_oper_log` VALUES (244, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'guest', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"路由切换，页面不更新\",\"author\":\"guest\",\"tagIds\":[5],\"articleId\":\"1351541680003657730\",\"params\":{},\"title\":\"路由切换，页面不更新\",\"content\":\"路由切换，页面不更新\",\"createBy\":\"guest\",\"categoryId\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-19 14:47:02');
INSERT INTO `sys_oper_log` VALUES (245, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"test111\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1352131588049117186\",\"params\":{},\"title\":\"test111\",\"content\":\"## test111\",\"createBy\":\"admin\",\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 05:51:08');
INSERT INTO `sys_oper_log` VALUES (246, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"test111在这次\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1352131684530692097\",\"params\":{},\"title\":\"test111ZC\",\"content\":\"**撒打发时光VS的v**\",\"createBy\":\"admin\",\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 05:51:31');
INSERT INTO `sys_oper_log` VALUES (247, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"as大大实打实的\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1352131772288114690\",\"params\":{},\"title\":\"萨达萨达是\",\"content\":\"阿三大苏打\",\"createBy\":\"admin\",\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 05:51:51');
INSERT INTO `sys_oper_log` VALUES (248, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"as大苏打\",\"author\":\"admin\",\"tagIds\":[4],\"articleId\":\"1352131902970044418\",\"params\":{},\"title\":\"啊实打实大苏打\",\"content\":\"阿三大苏打\",\"createBy\":\"admin\",\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 05:52:23');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":4,\"menuName\":\"内容管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/article\",\"children\":[],\"createTime\":1610504968000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:16:09');
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 2, 'top.cloudos.portal.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":1,\"menuName\":\"文章管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"content\",\"component\":\"article/content/index\",\"children\":[],\"createTime\":1610506394000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"article:content:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:16:23');
INSERT INTO `sys_oper_log` VALUES (251, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n\\n后台基于若依ruoyi-vue版本修改，使用mybatis plus替换mybatais\\n前台界面使用vue+iview搭建\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 评论功能\\n- [ ] 全局搜索\\n- [ ] 爬虫\\n- [ ] ...\\n#### 待修复\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":76,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:37:46');
INSERT INTO `sys_oper_log` VALUES (252, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n\\n后台基于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n\\n前台界面使用vue+iview搭建，响应式布局，适配移动端\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫\\n- [ ] ...\\n#### 待修复\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":79,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:43:48');
INSERT INTO `sys_oper_log` VALUES (253, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n\\n后台基于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n\\n前台界面使用vue+iview搭建，响应式布局，适配移动端\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":81,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:45:28');
INSERT INTO `sys_oper_log` VALUES (254, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n\\n后台基于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n\\n前台界面使用vue+iview搭建，响应式布局，适配移动端\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":83,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:48:06');
INSERT INTO `sys_oper_log` VALUES (255, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n\\n后台基于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n\\n前台界面使用vue+iview搭建，响应式布局，适配移动端\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能、点赞功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":85,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:48:38');
INSERT INTO `sys_oper_log` VALUES (256, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n\\n### 关于本站\\n#### 后台\\n\\n于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n#### 前台\\n使用vue+iview搭建，响应式布局，适配移动端\\n\\n#### 部署\\n阿里云服务器CentOS7系统\\n- Nginx代理\\n- Docker容器\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能、点赞功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫模块\\n- [ ] CI工具搭建-自动化部署\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- ivie菜单menu 路由跳转样式不变（选中）\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":86,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:55:01');
INSERT INTO `sys_oper_log` VALUES (257, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"VO、DTO、DO、PO的概念，区别及用法\",\"isRecommend\":\"0\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1351470701999075329\",\"likeCount\":0,\"params\":{},\"title\":\"VO、DTO、DO、PO的概念，区别及用法\",\"content\":\"### 概念\\n- VO（View Object）\\n视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。\\n- DTO（Data Transfer Object）\\n数据传输对象，这个概念来源于J2EE的设计模式，原来的目的是为了EJB的分布式应用提供粗粒度的数据实体，以减少分布式调用的次数，从而提高分布式调用的性能和降低网络负载，但在这里，我泛指用于展示层与服务层之间的数据传输对象。\\n- DO（Domain Object）\\n领域对象，就是从现实世界中抽象出来的有形或无形的业务实体。\\n- PO（Persistent Object）\\n持久化对象，它跟持久层（通常是关系型数据库）的数据结构形成一一对应的映射关系，如果持久层是关系型数据库，那么，数据表中的每个字段（或若干个）就对应PO的一个（或若干个）属性。\\n\\n\\n\\n1️⃣PO persistent object\\n\\n持久对象。与数据库里表字段一一对应。PO是一些属性，以及set和get方法组成。一般情况下，一个表对应一个PO，直接与操作数据库的crud相关。\\n\\n2️⃣VO view object/value object\\n\\n表现层对象。通常用于业务层之间的数据传递，和PO一样也是仅仅包含数据而已。但应是抽象出的业务对象，可以和表对应，也可以不。这根据业务的需要而定。对于页面上要展示的对象，可以封装一个VO对象，将所需数据封装进去。\\n\\n3️⃣DTO data trasfer object\\n\\n数据传输对象。主要用于远程调用等需要大量传输对象的地方。\\n\\n比如一张表有 100 个字段，那么对应的 PO 就有 100 个属性。 但是界面上只要显示 10 个字段， 客户端用 WEB service 来获取数据，没有必要把整个 PO 对象传递到客户端，\\n\\n这时就可以用只有这 10 个属性的 DTO 来传递结果到客户端，这样也不会暴露服务端表结构 . 到达客户端以后，如果用这个对象来对应界面显示，那此时它的身份就转为 VO。\\n\\n4️⃣POJO plain ordinary java object/pure old java object\\n\\n简单无规则 java 对象，纯的传统意义的 java 对象。\\n\\n二、复杂Java对象\\n1️⃣BO/DO bussiness object/Domain Object\\n\\n业务对象、域对象。封装业务逻辑的 Java 对象，通过调用 DAO 方法，结合 PO，VO 进行业务操作。一个BO对象可以包括多个PO对象。如常见的工作简历例子为例，简历可以理解为一个BO，简历又包括工作经历，学习经历等，这些可以理解为一个个的PO，由多个PO组成BO。\\n\\n2️⃣DAO data access object\\n\\n数据访问对象。此对象用于访问数据库。通常和 PO 结合使用，DAO 中包含了各种数据库的操作方法。通过它的方法，结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610879783000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":104,\"categoryId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 12:58:21');
INSERT INTO `sys_oper_log` VALUES (258, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n联系我：[QQ](http://sighttp.qq.com/authd?IDKEY=dba7856e44f55986c95b1dfd7bb8d69fc899f608ac8cbd3a)\\n### 关于本站\\n#### 后台\\n\\n于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n#### 前台\\n使用vue+iview搭建，响应式布局，适配移动端\\n\\n#### 部署\\n阿里云服务器CentOS7系统\\n- Nginx代理\\n- Docker容器\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能、点赞功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 爬虫模块\\n- [ ] CI工具搭建-自动化部署\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- ivie菜单menu 路由跳转样式不变（选中）\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":89,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 13:02:02');
INSERT INTO `sys_oper_log` VALUES (259, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"hello world\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1349958187343691778\",\"likeCount\":0,\"params\":{},\"title\":\"hello world\",\"content\":\"# hello world\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1606773289000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":8,\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 13:02:49');
INSERT INTO `sys_oper_log` VALUES (260, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"代码块测试\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1],\"articleId\":\"1349984161871491074\",\"likeCount\":0,\"params\":{},\"title\":\"代码块测试\",\"content\":\"[TOC]\\n### 标题测试\\n##### 哈哈哈\\n\\n\\n```js\\nimport request from \'@/utils/request\'\\n\\n// 查询文章标签关联列表\\nexport function listTag(query) {\\n  return request({\\n    url: \'/system/tag/list\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n// 查询文章标签关联详细\\nexport function getTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'get\'\\n  })\\n}\\n\\n// 新增文章标签关联\\nexport function addTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'post\',\\n    data: data\\n  })\\n}\\n\\n// 修改文章标签关联\\nexport function updateTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'put\',\\n    data: data\\n  })\\n}\\n\\n// 删除文章标签关联\\nexport function delTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'delete\'\\n  })\\n}\\n\\n// 导出文章标签关联\\nexport function exportTag(query) {\\n  return request({\\n    url: \'/system/tag/export\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n```\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610667482000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":22,\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 13:03:13');
INSERT INTO `sys_oper_log` VALUES (261, '标签', 1, 'top.cloudos.article.controller.ArticleTagController.add()', 'POST', 1, 'admin', NULL, '/article/tag', '127.0.0.1', '内网IP', '{\"tagId\":8,\"name\":\"JavaScript\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 13:03:31');
INSERT INTO `sys_oper_log` VALUES (262, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n联系我：[QQ](http://sighttp.qq.com/authd?IDKEY=dba7856e44f55986c95b1dfd7bb8d69fc899f608ac8cbd3a)\\n### 关于本站\\n#### 后台\\n\\n于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n#### 前台\\n使用vue+iview搭建，响应式布局，适配移动端\\n\\n#### 部署\\n阿里云服务器CentOS7系统\\n- Nginx代理\\n- Docker容器\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 评论功能、点赞功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 文件上传模块-oss\\n- [ ] 爬虫模块-spider\\n- [ ] CI工具搭建-自动化部署-jekins+docker\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- ivie菜单menu 路由跳转样式不变（选中）\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":91,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-21 13:07:54');
INSERT INTO `sys_oper_log` VALUES (263, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '183.40.238.119, 172.28.207.127', '内网IP', '{\"summary\":\"关于本站和博主\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1\",\"likeCount\":0,\"updateTime\":1611021898000,\"params\":{},\"title\":\"关于本站和博主\",\"content\":\">关于本站和博主\\n\\n### 关于我\\n\\n一个Java后端程序猿~\\n联系我：[QQ](http://sighttp.qq.com/authd?IDKEY=dba7856e44f55986c95b1dfd7bb8d69fc899f608ac8cbd3a)\\n### 关于本站\\n#### 后台\\n\\n于若依ruoyi-vue版本修改：\\n- 使用mybatis plus替换mybatais\\n- ...\\n\\n#### 前台\\n使用vue+iview搭建，响应式布局，适配移动端\\n\\n#### 部署\\n阿里云服务器CentOS7系统\\n- Nginx代理\\n- Docker容器\\n\\n### 开发日志\\n#### 已完成\\n- [x] 后台基本功能\\n- [x] 前台基本页面\\n#### 待完成\\n- [ ] 个人中心页面\\n- [ ] 用户注册\\n- [ ] 友链\\n- [ ] 评论功能、点赞功能\\n- [ ] 文章详情页 目录生成、代码复制\\n- [ ] 第三方登录-oauth2\\n- [ ] 手机号登录\\n- [ ] 全局搜索-es\\n- [ ] 文件上传模块-oss\\n- [ ] 爬虫模块-spider\\n- [ ] CI工具搭建-自动化部署-jekins+docker\\n- [ ] ...\\n\\n\\n#### 待修复\\n- 组件复用引发的路由跳转 内容不刷新\\n- 分页按钮无效\\n- 按条件排序无效\\n- 分类选择样式修改\\n- ivie菜单menu 路由跳转样式不变（选中）\\n- 需要登录才能查看文章内容-路由守卫白名单-动态路由\\n\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611021898000,\"updateBy\":\"admin\",\"isTop\":\"1\",\"viewCount\":98,\"categoryId\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-22 06:10:51');
INSERT INTO `sys_oper_log` VALUES (264, '个人信息', 2, 'top.cloudos.portal.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '183.40.238.119, 172.28.207.127', '内网IP', 'admin123 123admin', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-22 06:12:01');
INSERT INTO `sys_oper_log` VALUES (265, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"zzz\",\"author\":\"admin\",\"tagIds\":[3],\"articleId\":\"1353226446503448577\",\"params\":{},\"title\":\"z\",\"content\":\"zz\",\"createBy\":\"admin\",\"categoryId\":2,\"status\":\"0\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\r\n### The error may exist in top/cloudos/article/mapper/ArticleInfoMapper.java (best guess)\r\n### The error may involve top.cloudos.article.mapper.ArticleInfoMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO article_info  ( article_id, category_id, title, author, summary, content,  status,      create_by, create_time )  VALUES  ( ?, ?, ?, ?, ?, ?,  ?,      ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null\n; Column \'create_time\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' cannot be null', '2021-01-24 06:21:42');
INSERT INTO `sys_oper_log` VALUES (266, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"zzz\",\"author\":\"admin\",\"tagIds\":[3],\"articleId\":\"1353226791648505858\",\"params\":{},\"title\":\"z\",\"content\":\"zz\",\"createBy\":\"admin\",\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-24 06:23:05');
INSERT INTO `sys_oper_log` VALUES (267, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"zzz\",\"author\":\"admin\",\"tagIds\":[7],\"articleId\":\"1353226791648505858\",\"likeCount\":0,\"updateTime\":1611440584000,\"params\":{},\"title\":\"z\",\"content\":\"zz\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611440584000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":0,\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-24 06:23:56');
INSERT INTO `sys_oper_log` VALUES (268, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'admin', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"zzz\",\"author\":\"admin\",\"tagIds\":[7,1],\"articleId\":\"1353226791648505858\",\"likeCount\":0,\"updateTime\":1611440584000,\"params\":{},\"title\":\"z\",\"content\":\"zz\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1611440584000,\"updateBy\":\"admin\",\"isTop\":\"0\",\"viewCount\":0,\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-24 06:40:18');
INSERT INTO `sys_oper_log` VALUES (269, '文章', 2, 'top.cloudos.article.controller.ArticleInfoController.edit()', 'PUT', 1, 'guest', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"代码块测试\",\"isRecommend\":\"1\",\"visible\":\"0\",\"author\":\"admin\",\"tagIds\":[1,4],\"articleId\":\"1349984161871491074\",\"likeCount\":0,\"params\":{},\"title\":\"代码块测试\",\"content\":\"[TOC]\\n### 标题测试\\n##### 哈哈哈\\n\\n\\n```js\\nimport request from \'@/utils/request\'\\n\\n// 查询文章标签关联列表\\nexport function listTag(query) {\\n  return request({\\n    url: \'/system/tag/list\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n// 查询文章标签关联详细\\nexport function getTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'get\'\\n  })\\n}\\n\\n// 新增文章标签关联\\nexport function addTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'post\',\\n    data: data\\n  })\\n}\\n\\n// 修改文章标签关联\\nexport function updateTag(data) {\\n  return request({\\n    url: \'/system/tag\',\\n    method: \'put\',\\n    data: data\\n  })\\n}\\n\\n// 删除文章标签关联\\nexport function delTag(articleId) {\\n  return request({\\n    url: \'/system/tag/\' + articleId,\\n    method: \'delete\'\\n  })\\n}\\n\\n// 导出文章标签关联\\nexport function exportTag(query) {\\n  return request({\\n    url: \'/system/tag/export\',\\n    method: \'get\',\\n    params: query\\n  })\\n}\\n\\n```\\n\",\"commentCount\":0,\"createBy\":\"admin\",\"createTime\":1610667482000,\"updateBy\":\"guest\",\"isTop\":\"0\",\"viewCount\":24,\"categoryId\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-24 12:10:22');
INSERT INTO `sys_oper_log` VALUES (270, '文章', 1, 'top.cloudos.article.controller.ArticleInfoController.add()', 'POST', 1, 'guest', NULL, '/article/info', '127.0.0.1', '内网IP', '{\"summary\":\"aaa\",\"author\":\"guest\",\"tagIds\":[3,1,4],\"articleId\":\"1353324113766187009\",\"params\":{},\"title\":\"asdsa\",\"content\":\"asdasd\",\"createBy\":\"guest\",\"categoryId\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-24 12:49:49');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '1', 'CTO', 1, '0', 'admin', '2021-01-13 11:05:25', '', NULL, 'pm');
INSERT INTO `sys_post` VALUES (5, '10', '开发工程师', 2, '0', 'admin', '2021-01-13 11:09:34', '', NULL, '开发工程师');
INSERT INTO `sys_post` VALUES (6, '3', '测试工程师', 3, '0', 'admin', '2021-01-13 11:14:03', '', NULL, '测试工程师');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-01-13 19:24:29', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (101, '系统管理员', 'system', 2, '1', 1, 1, '0', '0', 'admin', '2021-01-15 06:01:14', '', NULL, '系统管理员');
INSERT INTO `sys_role` VALUES (102, '普通用户', 'user', 3, '1', 1, 1, '0', '0', 'admin', '2021-01-15 06:06:08', '', NULL, '普通用户');
INSERT INTO `sys_role` VALUES (103, '游客', 'guest', 4, '1', 1, 1, '0', '0', 'admin', '2021-01-15 06:06:40', 'admin', '2021-01-18 13:25:44', '游客');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (101, 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 3);
INSERT INTO `sys_role_menu` VALUES (101, 4);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 114);
INSERT INTO `sys_role_menu` VALUES (101, 115);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 1055);
INSERT INTO `sys_role_menu` VALUES (101, 1056);
INSERT INTO `sys_role_menu` VALUES (101, 1057);
INSERT INTO `sys_role_menu` VALUES (101, 1058);
INSERT INTO `sys_role_menu` VALUES (101, 1059);
INSERT INTO `sys_role_menu` VALUES (101, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (103, 2);
INSERT INTO `sys_role_menu` VALUES (103, 3);
INSERT INTO `sys_role_menu` VALUES (103, 109);
INSERT INTO `sys_role_menu` VALUES (103, 110);
INSERT INTO `sys_role_menu` VALUES (103, 111);
INSERT INTO `sys_role_menu` VALUES (103, 112);
INSERT INTO `sys_role_menu` VALUES (103, 113);
INSERT INTO `sys_role_menu` VALUES (103, 114);
INSERT INTO `sys_role_menu` VALUES (103, 115);
INSERT INTO `sys_role_menu` VALUES (103, 1046);
INSERT INTO `sys_role_menu` VALUES (103, 1047);
INSERT INTO `sys_role_menu` VALUES (103, 1048);
INSERT INTO `sys_role_menu` VALUES (103, 1049);
INSERT INTO `sys_role_menu` VALUES (103, 1050);
INSERT INTO `sys_role_menu` VALUES (103, 1051);
INSERT INTO `sys_role_menu` VALUES (103, 1052);
INSERT INTO `sys_role_menu` VALUES (103, 1053);
INSERT INTO `sys_role_menu` VALUES (103, 1054);
INSERT INTO `sys_role_menu` VALUES (103, 1055);
INSERT INTO `sys_role_menu` VALUES (103, 1056);
INSERT INTO `sys_role_menu` VALUES (103, 1057);
INSERT INTO `sys_role_menu` VALUES (103, 1058);
INSERT INTO `sys_role_menu` VALUES (103, 1059);
INSERT INTO `sys_role_menu` VALUES (103, 1060);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2004);
INSERT INTO `sys_role_menu` VALUES (103, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 2006);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 2010);
INSERT INTO `sys_role_menu` VALUES (103, 2011);
INSERT INTO `sys_role_menu` VALUES (103, 2012);
INSERT INTO `sys_role_menu` VALUES (103, 2013);
INSERT INTO `sys_role_menu` VALUES (103, 2014);
INSERT INTO `sys_role_menu` VALUES (103, 2015);
INSERT INTO `sys_role_menu` VALUES (103, 2016);
INSERT INTO `sys_role_menu` VALUES (103, 2017);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '系统管理员', '00', '3334412097@qq.com', '18888888888', '0', '\r\nhttp://cdn.cloudos.top/profile.jpg', '$2a$10$QQrVvk0sgjBvuT4ELruHn.u8ocBypvcuuA2saSHph9G7ey/WHnMLa', '0', '0', '', NULL, 'admin', '1970-01-13 23:27:29', 'admin', '2021-01-13 15:41:13', 'system');
INSERT INTO `sys_user` VALUES (2, 200, 'aguoxing', '系统管理员-GX', '00', 'aguoxing101@gmail.com', '18988999988', '0', '\r\nhttp://cdn.cloudos.top/profile.jpg', '$2a$10$14fda2rFMwEnsyK5dAKQ/..6a0dtDH6G55kwrMr2VXFLG/gLFIXqa', '0', '0', '', NULL, 'admin', '2021-01-15 06:00:23', 'admin', '2021-01-15 06:03:02', 'admin');
INSERT INTO `sys_user` VALUES (100, 200, 'java_dev', 'java开发工程师', '00', 'java@gmail.com', '19989898898', '0', '', '$2a$10$sMe4joHdkphOXHFTws/Ahev3luDQt/i/9u5aMlY.IYLf0rD6hIRum', '0', '2', '', NULL, 'admin', '2021-01-13 11:09:04', 'admin', '2021-01-15 06:07:10', 'dev');
INSERT INTO `sys_user` VALUES (101, 202, 'test', '测试工程师', '00', 'javatest@gmail.com', '15959989878', '0', '', '$2a$10$cQkSoW1hrHmPNlST/l6gme/.lXrumz8oxb3OOKqv2avZaFRLBmTlK', '0', '2', '', NULL, 'admin', '2021-01-13 11:15:05', 'admin', '2021-01-15 06:07:24', 'test');
INSERT INTO `sys_user` VALUES (103, 202, 'guest', 'guest', '00', 'guest@163.com', '18933338888', '0', '', '$2a$10$jYupfMtGH56n.EAbHl22CuwsOo6IHB./6WSk32GfgIxrtAltrPDRi', '0', '0', '', NULL, 'admin', '2021-01-18 13:05:45', '', NULL, '游客');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (102, 1);
INSERT INTO `sys_user_post` VALUES (103, 6);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (102, 101);
INSERT INTO `sys_user_role` VALUES (103, 103);

SET FOREIGN_KEY_CHECKS = 1;
