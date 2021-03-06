/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-05-22 21:31:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `visible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '');
INSERT INTO `admin` VALUES ('2', 'andy', 'andy', '');

-- ----------------------------
-- Table structure for `board`
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime NOT NULL,
  `info` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `visible` bit(1) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `adminid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D5FEC67E0D60DA` (`parentid`),
  KEY `FK3D5FEC6331B2D62` (`userid`),
  KEY `FK3D5FEC6F4015AA8` (`adminid`),
  CONSTRAINT `FK3D5FEC6331B2D62` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3D5FEC67E0D60DA` FOREIGN KEY (`parentid`) REFERENCES `board` (`id`),
  CONSTRAINT `FK3D5FEC6F4015AA8` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of board
-- ----------------------------
INSERT INTO `board` VALUES ('1', '2013-05-20 16:18:32', '计算机爱好者的天堂', '计算机', '', null, '1', '1');
INSERT INTO `board` VALUES ('2', '2013-02-08 19:24:33', '丰富的课外生活总有一款你喜欢的', '课外生活', '', null, '1', '1');
INSERT INTO `board` VALUES ('3', '2013-02-08 19:24:50', '数据结构不好学啊', '数据结构', '', '1', '1', '1');
INSERT INTO `board` VALUES ('4', '2013-02-08 19:25:10', '写下你的生活感悟吧', '生活感悟', '', '2', '1', '1');
INSERT INTO `board` VALUES ('5', '2013-02-08 19:25:29', '篮球、羽毛球各种运动总有你乐于享受的', '运动部落', '', null, '1', '1');
INSERT INTO `board` VALUES ('6', '2013-02-08 19:25:42', '羽毛球爱好者的天堂', '羽毛球爱好者', '', '5', '1', '1');
INSERT INTO `board` VALUES ('7', '2013-03-02 15:32:17', '课外交友就来这儿吧', '交友', '', '2', '1', '1');
INSERT INTO `board` VALUES ('9', '2013-03-17 14:12:34', '计算机操作系统，考研问题解决', '操作系统', '', '1', '2', '1');
INSERT INTO `board` VALUES ('10', '2013-03-17 14:13:03', '计算机组成原理各种问题解决', '组成原理', '', '1', '3', '1');
INSERT INTO `board` VALUES ('11', '2013-04-25 20:02:35', '解决各种数据库疑难问题', '数据库', '', '1', '1', '1');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `modifyTime` datetime NOT NULL,
  `publishTime` datetime NOT NULL,
  `title` varchar(30) NOT NULL,
  `visible` bit(1) NOT NULL,
  `topicid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4B322CAF517F668` (`topicid`),
  KEY `FK4B322CA331B2D62` (`userid`),
  CONSTRAINT `FK4B322CA331B2D62` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK4B322CAF517F668` FOREIGN KEY (`topicid`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('2', '这样建才对', '2013-03-19 19:54:30', '2013-03-19 19:54:30', '单链表这样建', '', '1', '1');
INSERT INTO `reply` VALUES ('3', '这样建才对', '2013-03-19 19:54:47', '2013-03-19 19:54:47', '真的是这样建吗', '', '1', '1');
INSERT INTO `reply` VALUES ('4', '循环链表', '2013-03-19 20:01:40', '2013-03-19 20:01:40', '循环链表？', '', '2', '1');
INSERT INTO `reply` VALUES ('5', '是吗', '2013-03-19 20:16:15', '2013-03-19 20:16:15', '是如何建一个队列吗', '', '3', '1');
INSERT INTO `reply` VALUES ('6', '好方法', '2013-03-19 20:40:51', '2013-03-19 20:40:51', '是这样的', '', '1', '3');
INSERT INTO `reply` VALUES ('7', '是这样的 傻瓜', '2013-03-19 20:41:08', '2013-03-19 20:41:08', '真的是这样的', '', '1', '3');
INSERT INTO `reply` VALUES ('8', '回复', '2013-03-20 11:53:50', '2013-03-20 11:53:50', '回复循环', '', '2', '3');
INSERT INTO `reply` VALUES ('9', '\r\n	爱好：运动（篮球==找准自己的位置 、羽毛球）棋类（象棋、围棋）编程（解决bug是最大的快乐 帮助别人解决问题） 电影、唱歌\r\n\r\n编程方向（坚定，选定，而且是现在一直努力的方向）：Java方向 可以朝Android方向发展 也可以向JavaWeb发展', '2013-03-20 11:56:26', '2013-03-20 11:56:26', '回复', '', '2', '3');
INSERT INTO `reply` VALUES ('10', '大家好\r\n', '2013-04-25 17:24:31', '2013-04-25 17:24:31', '大家好才是真的好', '', '2', '1');
INSERT INTO `reply` VALUES ('11', '一种内存管理机制', '2013-04-25 19:03:55', '2013-04-25 19:03:55', '一种内存管理机制', '', '10', '1');
INSERT INTO `reply` VALUES ('12', '做人应当有所坚守　　有一年，冯小刚受邀担任一次选秀活动的评委。活动期间，主办方暗示冯小刚，一名有来头的选手，已被内定获奖。冯小刚一听此事，怒不可遏：“获奖人已经定好，还要我来当评委干嘛？”随后坚决要求退出该次活动。主办方一下子慌了，如果冯小刚退出，这次活动的影响力将大打折扣，但如果不让那位选手获奖，又要得罪“大人物”。\r\n', '2013-04-25 19:16:21', '2013-04-25 19:16:21', '做人应当有所坚守 ', '', '44', '1');
INSERT INTO `reply` VALUES ('13', '汶川地震幸存者：这一秒钟，我不要死　　2008年，5月12日，那时，我是四川省绵阳中学高中三年级的一名学生。　　2013年，4月20日，凌晨，今天的我已经从浙大毕业快1年，距离当年那场地震，竟也过去5年。　　我无法去表达，作为一个四川人，对于同胞们在两次地震中所给予的支持和帮助，让我有多么感激。\r\n', '2013-04-25 19:16:40', '2013-04-25 19:16:40', '汶川地震幸存者：这一秒钟，我不要死 ', '', '43', '1');
INSERT INTO `reply` VALUES ('14', '十年来，你坚持了什么，放弃了什么？　　十年了，你坚持的东西有哪些呢，你还在坚持什么，如果能回到十年前，你会对自己说什么呢？　　最近在微博上有一个帖子：十年了，你坚持的东西有哪些呢，你还在坚持什么，如果能回到十年前，你会对自己说什么呢？虽然只是短短的几句话，可是却引起了很多网友的关注和评论，不到一周就已经有上万的转载和几千条评论了。\r\n', '2013-04-25 19:16:59', '2013-04-25 19:16:59', '十年来，你坚持了什么，放弃了什么？', '', '41', '1');
INSERT INTO `reply` VALUES ('15', '25到不了的都叫做远方，回不去的名字叫家乡发布:励志| 分类:人生感悟\r\n到不了的都叫做远方，回不去的名字叫家乡　　昨天晚上，做了一个梦，梦到我又回到了家乡那老旧的小广场上，六七月的天气，正是细雨迷离。那建造了百余年的孔庙，虽然早已被改为设备先进的电影院，但是那重重的檐角下，依然庇护了成千上万只燕子，一到傍晚的时候，当微风吹动檐角的风铃，小燕子们就如同受到召唤一般，滑翔着向广场中飞来，\r\n', '2013-04-25 19:17:19', '2013-04-25 19:17:19', '到不了的都叫做远方，回不去的名字叫家乡 ', '', '42', '1');
INSERT INTO `reply` VALUES ('16', '一句话照亮世界　　文/ 麦家　　“家有良田，可能要被水淹掉；家有宫殿，可能要被火烧掉；肚子里的文化，水淹不掉，火烧不掉，谁都拿不走。”　　这句话是我父亲说的。　　我父亲是个农民，只读过一年私塾。可以说，父亲是个没文化的人，识字十分有限，看不完一张报纸。但知识和智慧是两回事，能够说出这么朴素又真切的人生体悟，说明父亲是有“慧根”的。\r\n', '2013-04-25 19:17:57', '2013-04-25 19:17:57', '一句话照亮世界', '', '45', '1');
INSERT INTO `reply` VALUES ('17', '15条人生箴言：自己活，也让别人活　　人活世上，为了利益和开心而已。在顾及自己的利益之后，还需顾及他人的利益。　　已过不惑之年的我，人生阅历虽谈不上丰富，但因生于贫苦人家，少不了遭遇坎坷曲折，体验世态炎凉、阅睹众生百态，也取得了一定的成就，于是乎对人生有所感悟。兹略表一二，与诸君共勉。\r\n', '2013-04-25 19:18:34', '2013-04-25 19:18:34', '15条人生箴言：自己活，也让别人活 ', '', '46', '1');
INSERT INTO `reply` VALUES ('18', '修艺不如修身，保持一份耐心　　文/Jack　　前几天见到一个老朋友，他很开心的告诉我，最近好几家很不错的互联网公司请他去做VP（副总裁），问我选择哪一家比较有前景。我由衷的替他高兴，感觉他越做越好，在属于自己的领域里发展的非常快。　　认识他很多年，年纪比我小，性格比较平淡的一个人，对生活没有太多的追求，更喜欢安静平和的工作和生活。\r\n', '2013-04-25 19:19:33', '2013-04-25 19:19:33', 'andy ', '', '47', '1');
INSERT INTO `reply` VALUES ('19', '最新回复', '2013-04-25 20:15:38', '2013-04-25 20:15:38', '最新回复', '', '23', '3');
INSERT INTO `reply` VALUES ('20', 'cpu子系统的最新回复', '2013-04-25 20:21:12', '2013-04-25 20:21:12', 'cpu子系统的最新回复', '', '23', '3');
INSERT INTO `reply` VALUES ('21', '回复', '2013-04-25 20:30:25', '2013-04-25 20:30:25', '回复', '', '1', '3');
INSERT INTO `reply` VALUES ('22', '回复', '2013-04-25 20:30:30', '2013-04-25 20:30:30', '回复', '', '1', '3');
INSERT INTO `reply` VALUES ('23', '回复', '2013-04-25 20:30:36', '2013-04-25 20:30:36', '回复', '', '1', '3');
INSERT INTO `reply` VALUES ('24', '回复', '2013-04-25 20:30:41', '2013-04-25 20:30:41', '回复', '', '1', '3');
INSERT INTO `reply` VALUES ('25', '回复回复', '2013-04-25 20:30:47', '2013-04-25 20:30:47', '回复回复', '', '1', '3');
INSERT INTO `reply` VALUES ('26', '的是的', '2013-05-17 17:57:19', '2013-05-17 17:57:19', '的', '', '8', '10');
INSERT INTO `reply` VALUES ('27', '的典范爱的啊啊', '2013-05-17 17:57:49', '2013-05-17 17:57:49', '打算打发打发', '', '8', '10');
INSERT INTO `reply` VALUES ('28', 'ASasASasASas S ', '2013-05-18 19:42:36', '2013-05-18 19:42:36', 'SasASas', '', '1', '11');
INSERT INTO `reply` VALUES ('29', '先写表头', '2013-05-19 14:17:33', '2013-05-19 14:17:33', '是这样构建的', '', '1', '1');
INSERT INTO `reply` VALUES ('30', '羽毛球', '2013-05-19 14:38:31', '2013-05-19 14:38:34', '羽毛球', '', '31', '1');
INSERT INTO `reply` VALUES ('31', 'asdfsa', '2013-05-20 14:54:36', '2013-05-20 14:54:36', '默认标题', '', '1', '3');
INSERT INTO `reply` VALUES ('32', 'asdfasdf', '2013-05-20 14:54:43', '2013-05-20 14:54:43', '默认标题', '', '1', '3');
INSERT INTO `reply` VALUES ('33', '单链表创建，最新的回复', '2013-05-20 14:55:45', '2013-05-20 14:55:45', '默认标题', '', '1', '3');
INSERT INTO `reply` VALUES ('34', '队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队列的回复队', '2013-05-20 14:58:27', '2013-05-20 14:58:27', '默认标题', '', '1', '3');
INSERT INTO `reply` VALUES ('35', '发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发表贴纸发', '2013-05-20 15:48:55', '2013-05-20 15:48:55', '默认标题', '', '1', '11');
INSERT INTO `reply` VALUES ('36', '单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复单链表构建回复', '2013-05-20 15:49:29', '2013-05-20 15:49:29', '默认标题', '', '1', '11');
INSERT INTO `reply` VALUES ('37', 'asdf', '2013-05-20 17:15:29', '2013-05-20 17:15:29', '默认标题', '', '47', '1');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `headimage` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `modifyTime` datetime NOT NULL,
  `publishTime` datetime NOT NULL,
  `title` varchar(30) NOT NULL,
  `visible` bit(1) NOT NULL,
  `boardid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4D3DD0F3B1AA816` (`boardid`),
  KEY `FK4D3DD0F331B2D62` (`userid`),
  CONSTRAINT `FK4D3DD0F331B2D62` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FK4D3DD0F3B1AA816` FOREIGN KEY (`boardid`) REFERENCES `board` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '单链表如何构建', '2013-04-25 19:00:36', '2013-04-25 19:00:36', '单链表如何构建', '', '3', '3');
INSERT INTO `topic` VALUES ('2', '循环链表有谁会构建', '2013-04-25 17:24:45', '2013-04-25 17:24:45', '循环链表如何构建', '', '3', '1');
INSERT INTO `topic` VALUES ('3', '队列如何建 修改 第二次修改', '2013-04-25 19:01:21', '2013-04-25 19:01:21', '一个队列的题目', '', '3', '3');
INSERT INTO `topic` VALUES ('8', '循环链表', '2013-03-19 20:51:51', '2013-03-19 20:51:51', '循环链表', '', '3', '3');
INSERT INTO `topic` VALUES ('9', '操作系统由什么组成', '2013-04-25 18:51:47', '2013-04-25 18:51:47', '操作系统是什么了？', '', '9', '1');
INSERT INTO `topic` VALUES ('10', '操作系统是怎么做到既让牛吃的少，又让牛跑的快的', '2013-04-25 19:02:34', '2013-04-25 19:02:34', '操作系统是怎么做到既让牛吃的少，又让牛跑的快的', '', '9', '1');
INSERT INTO `topic` VALUES ('11', '分时操作系统\r\n', '2013-04-25 19:06:16', '2013-04-25 19:06:16', '分时操作系统', '', '9', '1');
INSERT INTO `topic` VALUES ('12', '实时操作系统\r\n', '2013-04-25 19:06:25', '2013-04-25 19:06:25', '实时操作系统', '', '9', '1');
INSERT INTO `topic` VALUES ('13', '网络操作系统\r\n', '2013-04-25 19:06:33', '2013-04-25 19:06:33', '网络操作系统', '', '9', '1');
INSERT INTO `topic` VALUES ('14', '操作系统的特性和功能\r\n', '2013-04-25 19:06:42', '2013-04-25 19:06:42', '操作系统的特性和功能', '', '9', '1');
INSERT INTO `topic` VALUES ('15', '存储管理\r\n', '2013-04-25 19:06:52', '2013-04-25 19:06:52', '存储管理', '', '9', '1');
INSERT INTO `topic` VALUES ('16', '设备管理\r\n', '2013-04-25 19:07:01', '2013-04-25 19:07:01', '设备管理', '', '9', '1');
INSERT INTO `topic` VALUES ('17', '文件管理\r\n', '2013-04-25 19:07:10', '2013-04-25 19:07:10', '文件管理', '', '9', '1');
INSERT INTO `topic` VALUES ('18', '作业管理', '2013-04-25 19:07:29', '2013-04-25 19:07:29', '作业管理', '', '9', '1');
INSERT INTO `topic` VALUES ('19', 'UNIX操作系统简介\r\n', '2013-04-25 19:07:37', '2013-04-25 19:07:37', 'UNIX操作系统简介', '', '9', '1');
INSERT INTO `topic` VALUES ('20', 'Linux操作系统分析\r\n', '2013-04-25 19:07:44', '2013-04-25 19:07:44', 'Linux操作系统分析', '', '9', '1');
INSERT INTO `topic` VALUES ('21', '计算机的基本概念和计算机系统的硬件、软件组织', '2013-04-25 19:08:33', '2013-04-25 19:08:33', '计算机的基本概念和计算机系统的硬件、软件组织', '', '10', '1');
INSERT INTO `topic` VALUES ('22', '数据信息和指令信息的表示方法', '2013-04-25 19:08:42', '2013-04-25 19:08:42', '数据信息和指令信息的表示方法', '', '10', '1');
INSERT INTO `topic` VALUES ('23', 'CPU子系统', '2013-04-25 19:08:50', '2013-04-25 19:08:50', 'CPU子系统', '', '10', '1');
INSERT INTO `topic` VALUES ('24', '存储子系统，讨论存储原理和主存储器的设计方法', '2013-04-25 19:08:59', '2013-04-25 19:08:59', '存储子系统，讨论存储原理和主存储器的设计方法', '', '10', '1');
INSERT INTO `topic` VALUES ('25', 'I/O子系统，包括接口的基本知识，系统总线，以及中断和DMA等I/O传送控制机制', '2013-04-25 19:09:21', '2013-04-25 19:09:21', 'I/O子系统，包括接口的基本知识，系统总线', '', '10', '1');
INSERT INTO `topic` VALUES ('26', '常用输入/输出设备的工作原理及信息转换过程', '2013-04-25 19:09:36', '2013-04-25 19:09:36', '常用输入/输出设备的工作原理及信息转换过程', '', '10', '1');
INSERT INTO `topic` VALUES ('27', '身体素质练习，跑步、跳绳、身体柔韧性练习', '2013-04-25 19:10:43', '2013-04-25 19:10:43', '身体素质练习，跑步、跳绳、身体柔韧性练习', '', '6', '1');
INSERT INTO `topic` VALUES ('28', '掌握握拍方法、挥拍、发球。', '2013-04-25 19:10:50', '2013-04-25 19:10:50', '掌握握拍方法、挥拍、发球。', '', '6', '1');
INSERT INTO `topic` VALUES ('29', '教高远球，要两个人对拉。', '2013-04-25 19:10:58', '2013-04-25 19:10:58', '教高远球，要两个人对拉。', '', '6', '1');
INSERT INTO `topic` VALUES ('30', '高远球有一定基础后就可以学习步伐，一般开始先掌握半场前后步伐。', '2013-04-25 19:11:16', '2013-04-25 19:11:16', '高远球有一定基础后就可以学习步伐', '', '6', '1');
INSERT INTO `topic` VALUES ('31', '吊球、杀球、勾对角、网前推球、扑球、平抽快打', '2013-04-25 19:11:28', '2013-04-25 19:11:28', '吊球、杀球、勾对角、网前推球、扑球、平抽快打', '', '6', '1');
INSERT INTO `topic` VALUES ('32', '51个人空间请进', '2013-04-25 19:12:54', '2013-04-25 19:12:54', '51个人空间请进', '', '7', '1');
INSERT INTO `topic` VALUES ('33', '我们约会吧', '2013-04-25 19:13:03', '2013-04-25 19:13:03', '我们约会吧', '', '7', '1');
INSERT INTO `topic` VALUES ('34', '三人行', '2013-04-25 19:13:15', '2013-04-25 19:13:15', '三人行', '', '7', '1');
INSERT INTO `topic` VALUES ('35', '飞信同窗', '2013-04-25 19:13:37', '2013-04-25 19:13:37', '飞信同窗', '', '7', '1');
INSERT INTO `topic` VALUES ('36', '开心网', '2013-04-25 19:13:50', '2013-04-25 19:13:50', '开心网', '', '7', '1');
INSERT INTO `topic` VALUES ('37', '朋友网', '2013-04-25 19:13:57', '2013-04-25 19:13:57', '朋友网', '', '7', '1');
INSERT INTO `topic` VALUES ('38', '爱情公寓', '2013-04-25 19:14:13', '2013-04-25 19:14:13', '爱情公寓', '', '7', '1');
INSERT INTO `topic` VALUES ('39', '久久网', '2013-04-25 19:14:34', '2013-04-25 19:14:34', '久久网', '', '7', '1');
INSERT INTO `topic` VALUES ('40', '中国人校友录', '2013-04-25 19:14:47', '2013-04-25 19:14:47', '中国人校友录', '', '7', '1');
INSERT INTO `topic` VALUES ('41', '十年来，你坚持了什么，放弃了什么？', '2013-04-25 19:15:27', '2013-04-25 19:15:27', '十年来，你坚持了什么，放弃了什么？', '', '4', '1');
INSERT INTO `topic` VALUES ('42', '到不了的都叫做远方，回不去的名字叫家乡', '2013-04-25 19:15:36', '2013-04-25 19:15:36', '到不了的都叫做远方，回不去的名字叫家乡', '', '4', '1');
INSERT INTO `topic` VALUES ('43', '\r\n汶川地震幸存者：这一秒钟，我不要死', '2013-04-25 19:15:51', '2013-04-25 19:15:51', '汶川地震幸存者：这一秒钟，我不要死', '', '4', '1');
INSERT INTO `topic` VALUES ('44', '做人应当有所坚守', '2013-04-25 19:16:05', '2013-04-25 19:16:05', '做人应当有所坚守', '', '4', '1');
INSERT INTO `topic` VALUES ('45', '一句话照亮世界', '2013-04-25 19:17:45', '2013-04-25 19:17:45', '一句话照亮世界', '', '4', '1');
INSERT INTO `topic` VALUES ('46', '15条人生箴言：自己活，也让别人活', '2013-04-25 19:18:19', '2013-04-25 19:18:19', '15条人生箴言：自己活，也让别人活', '', '4', '1');
INSERT INTO `topic` VALUES ('47', '修艺不如修身，保持一份耐心', '2013-04-25 19:19:08', '2013-04-25 19:19:08', '修艺不如修身，保持一份耐心', '', '4', '1');
INSERT INTO `topic` VALUES ('48', '做好人，最大的受益人是自己', '2013-04-25 19:20:36', '2013-04-25 19:20:36', '做好人，最大的受益人是自己', '', '4', '1');
INSERT INTO `topic` VALUES ('49', '俞敏洪：不完美生活的美好', '2013-04-25 19:20:45', '2013-04-25 19:20:45', '俞敏洪：不完美生活的美好', '', '4', '1');
INSERT INTO `topic` VALUES ('50', '\r\n这个城市，有没有一个可以随时心疼着收留你的人？', '2013-04-25 19:21:28', '2013-04-25 19:21:28', '这个城市，有没有一个可以随时心疼着收留你的人？', '', '4', '1');
INSERT INTO `topic` VALUES ('51', '没听说过额', '2013-05-17 17:55:48', '2013-05-17 17:55:48', '果冻是谁？', '', '3', '10');
INSERT INTO `topic` VALUES ('52', '短发啊', '2013-05-17 18:00:04', '2013-05-17 18:00:04', '阿达地方', '', '3', '10');
INSERT INTO `topic` VALUES ('53', 'sdf sadf sadfsf s dfsf sfsd\r\nasdf sadf sadf sd\r\nsadf sdf sad fsad fs\r\nas dfasdf sdfsf sadf sdf ', '2013-05-18 19:44:02', '2013-05-18 19:44:02', 'sdf sadf sdf asdf', '', '3', '11');
INSERT INTO `topic` VALUES ('54', 'sadf sadfsdfsadf sdf', '2013-05-18 19:45:23', '2013-05-18 19:45:23', 'sdfsadfs  sdf', '', '6', '11');
INSERT INTO `topic` VALUES ('55', 'asdf', '2013-05-18 20:27:10', '2013-05-18 20:27:10', 'adf', '', '3', '1');
INSERT INTO `topic` VALUES ('56', '队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成队列的构成', '2013-05-20 14:56:34', '2013-05-20 14:56:34', '队列的构成', '', '3', '3');
INSERT INTO `topic` VALUES ('57', '话题发表', '2013-05-20 15:42:39', '2013-05-20 15:42:39', '话题发表话题发表话题发表话题发表话题发表话题发表', '', '3', '11');
INSERT INTO `topic` VALUES ('58', '话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表表话题发表话题发表话题发表话题发表', '2013-05-20 15:43:13', '2013-05-20 15:43:13', '话题发表', '', '3', '11');
INSERT INTO `topic` VALUES ('59', 'asdf', '2013-05-20 17:15:09', '2013-05-20 17:15:09', 'sadf', '', '4', '1');
INSERT INTO `topic` VALUES ('60', '发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题发表话题', '2013-05-21 19:28:03', '2013-05-21 19:28:03', '发表话题发表话题发表话题发表', '', '4', '11');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(5) NOT NULL,
  `headname` varchar(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `regTime` datetime NOT NULL,
  `visible` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'WOMEN', '3.gif', 'andy', 'andy', '2013-03-19 14:06:41', '');
INSERT INTO `user` VALUES ('2', 'MAN', '2.gif', 'andy', 'andy', '2013-03-17 09:30:56', '');
INSERT INTO `user` VALUES ('3', 'MAN', '1.gif', 'admin', 'admin', '2013-02-08 13:38:01', '');
INSERT INTO `user` VALUES ('4', 'MAN', '2.gif', 'andy', 'andy', '2013-03-17 09:30:56', '');
INSERT INTO `user` VALUES ('5', 'MAN', '1.gif', 'admin', 'admin', '2013-02-08 13:38:01', '');
INSERT INTO `user` VALUES ('6', 'MAN', '2.gif', 'andy', 'andy', '2013-03-17 09:30:56', '');
INSERT INTO `user` VALUES ('7', 'MAN', '2.gif', 'asdf', 'asdf', '2013-03-19 14:23:52', '');
INSERT INTO `user` VALUES ('8', 'MAN', '2.gif', 'asdf', 'asdf', '2013-03-19 14:32:19', '');
INSERT INTO `user` VALUES ('9', 'WOMEN', '2.gif', 'andy', 'andy', '2013-05-17 17:12:39', '');
INSERT INTO `user` VALUES ('10', 'MAN', '5.gif', '沈亮', '123456', '2013-05-17 17:54:44', '');
INSERT INTO `user` VALUES ('11', 'WOMEN', '7.gif', 'aaa', 'aaa', '2013-05-18 19:40:29', '');
INSERT INTO `user` VALUES ('12', 'WOMEN', '9.gif', 'andy', 'andy', '2013-05-20 16:24:35', '');
INSERT INTO `user` VALUES ('13', 'MAN', '1.gif', 'aaaa', 'aaaa, ', '2013-05-20 16:26:30', '');
INSERT INTO `user` VALUES ('14', 'MAN', '3.gif', 'bbb', 'bbb, bbb', '2013-05-20 16:27:31', '');
