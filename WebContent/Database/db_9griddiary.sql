/*
Navicat MySQL Data Transfer

Source Server         : water
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : db_9griddiary

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-04-13 23:15:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_administrator
-- ----------------------------
DROP TABLE IF EXISTS `tb_administrator`;
CREATE TABLE `tb_administrator` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_administrator
-- ----------------------------
INSERT INTO `tb_administrator` VALUES ('1', 'fire1350', 'qq87911862');

-- ----------------------------
-- Table structure for tb_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_content`;
CREATE TABLE `tb_content` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(255) DEFAULT NULL,
  `first` varchar(255) DEFAULT NULL,
  `second` varchar(255) DEFAULT NULL,
  `third` varchar(255) DEFAULT NULL,
  `fourth` varchar(255) DEFAULT NULL,
  `fifth` varchar(255) DEFAULT NULL,
  `sixth` varchar(255) DEFAULT NULL,
  `seventh` varchar(255) DEFAULT NULL,
  `eighth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_content
-- ----------------------------
INSERT INTO `tb_content` VALUES ('1', '10', '好多好吃的', '关心同事', '休息一下', '状态好了', 'weathervalue', '幸福', '大家都在关注神马', '健康饮食');
INSERT INTO `tb_content` VALUES ('2', '10', '我还活着', '问候家人了', '出去旅游', '不再空想了', '没啥可说的', '大家都在关注神马', '胖了', '拥有自己的房子');
INSERT INTO `tb_content` VALUES ('3', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '瘦了', '没啥可说的');
INSERT INTO `tb_content` VALUES ('4', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '我');
INSERT INTO `tb_content` VALUES ('5', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '请在此输入文字请在此输入文字', '我');
INSERT INTO `tb_content` VALUES ('6', '41', '没啥可说的', '扶老奶奶过街', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('7', '41', '工作完成了', '问候家人了', '没啥可说的', '没啥可说的', '神马都是浮云', '新闻联播', '没啥可说的', '努力做好自己');
INSERT INTO `tb_content` VALUES ('8', '41', '今天下雪了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('9', '41', '考试完成', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('10', '41', '考试完成', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('11', '41', '考试过了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('12', '41', '考试满分', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('13', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('14', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('15', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('16', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('17', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('18', '10', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('19', '41', '春天来了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('20', '41', '夏天快要来了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('21', '41', '冬天快要来了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('22', '41', '冬天快要来了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('23', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('24', '10', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('25', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('26', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('27', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('28', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('29', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('30', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '我在图书錧', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('31', '41', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', 'weathervalue', '我在图书錧', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('32', '41', '考试不及格', '没啥可说的', '没啥可说的', '没啥可说的', 'weathervalue', '我在图书錧', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('33', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '又胖了', '没啥可说的');
INSERT INTO `tb_content` VALUES ('34', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '胖到烟花爆', '没啥可说的');
INSERT INTO `tb_content` VALUES ('35', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '热水器', '没啥可说的');
INSERT INTO `tb_content` VALUES ('36', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '冬天快要来了', '没啥可说的');
INSERT INTO `tb_content` VALUES ('37', '41', '今天捡到钱了', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('38', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '今天梦见我老豆');
INSERT INTO `tb_content` VALUES ('39', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '今天梦见我老豆', '没啥可说的');
INSERT INTO `tb_content` VALUES ('40', '41', '为他人做的事', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('41', '41', '没啥可说的', '没啥可说的', '没啥可说的', '比起昨天的进步', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('42', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '心脏', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('43', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('44', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '必要的东西', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('45', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '不必要的东西', '没啥可说的');
INSERT INTO `tb_content` VALUES ('46', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '我梦见自己成了一名软件工程师');
INSERT INTO `tb_content` VALUES ('47', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '您好', '没啥可说的');
INSERT INTO `tb_content` VALUES ('48', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '您不好喜欢', '没啥可说的');
INSERT INTO `tb_content` VALUES ('49', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('50', '43', '旅游', '问候家人了', '继续努力工作', '看书了', '命里有时终须有', '美国大选', '胖了', '年入20W');
INSERT INTO `tb_content` VALUES ('51', '43', '旅游', '问候家人了', '继续努力工作', '状态好了', '命里有时终须有', '美国大选', '胖了', '年入20W');
INSERT INTO `tb_content` VALUES ('52', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('53', '43', '旅游', '没啥可说的', '没啥可说的', '效率提高了', '命里有时终须有', '她/他写九宫格日记了', '胖了', '年入20W');
INSERT INTO `tb_content` VALUES ('54', '43', '旅游', '问候家人了', '继续努力工作', '代码敲出来了', '学会感恩', '副省长被抓', '体重直线下降啊', '买房啊');
INSERT INTO `tb_content` VALUES ('55', '43', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('56', '44', '好多好吃啊', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('57', '46', '好多好吃啊', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('58', '47', '好多好吃啊', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('59', '48', '好多好吃啊', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('60', '41', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('61', '43', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('62', '43', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_content` VALUES ('63', '49', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');

-- ----------------------------
-- Table structure for tb_diary
-- ----------------------------
DROP TABLE IF EXISTS `tb_diary`;
CREATE TABLE `tb_diary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `address` varchar(250) NOT NULL COMMENT '日记保存的地址',
  `writeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `detail` text,
  `visibility` int(10) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_diary
-- ----------------------------
INSERT INTO `tb_diary` VALUES ('6', '请在此输入标题', '-1625618782951844312', '2011-05-26 09:40:10', '1', null, '1', null);
INSERT INTO `tb_diary` VALUES ('8', '请在此输入标题', '-5039247624120215442', '2011-05-27 10:26:47', '1', null, '1', null);
INSERT INTO `tb_diary` VALUES ('9', '心情不错', '241344336121425196', '2011-05-28 14:00:43', '1', null, '1', null);
INSERT INTO `tb_diary` VALUES ('10', '无题', '2030326276105596531', '2011-05-28 14:03:08', '1', null, '1', null);
INSERT INTO `tb_diary` VALUES ('11', '无尽的牵挂', '-2201304326449572193', '2011-05-28 14:09:18', '2', null, '1', null);
INSERT INTO `tb_diary` VALUES ('14', '心情很好', '7076008621496558673', '2011-06-09 16:31:07', '1', null, '1', null);
INSERT INTO `tb_diary` VALUES ('25', '我的碎片日记', '-6553689910180534915', '2016-03-01 18:07:05', '13', null, '1', null);
INSERT INTO `tb_diary` VALUES ('26', '我的碎片日记', '6457543923217660123', '2016-03-01 20:03:33', '13', null, '1', null);
INSERT INTO `tb_diary` VALUES ('27', '我的碎片日记', '-1566363314028551368', '2016-03-01 20:19:16', '13', null, '1', null);
INSERT INTO `tb_diary` VALUES ('28', '我的碎片日记', '1290090186414632277', '2016-03-01 21:18:11', '13', null, '1', null);
INSERT INTO `tb_diary` VALUES ('29', '我的碎片日记', '-3921935991804123575', '2016-03-01 21:45:52', '13', '', '1', null);
INSERT INTO `tb_diary` VALUES ('30', '我的碎片日记', '-7074743718284158288', '2016-03-01 21:46:16', '13', '', '1', null);
INSERT INTO `tb_diary` VALUES ('31', '我的碎片日记', '9062756297180287352', '2016-03-01 21:46:38', '13', '', '1', null);
INSERT INTO `tb_diary` VALUES ('40', '我的碎片日记', '1754327447206555685', '2016-03-02 14:39:33', '10', '我是一个热爱生活的人', '1', null);
INSERT INTO `tb_diary` VALUES ('47', '我的简言日记', '5800600596068080459', '2016-03-03 19:37:41', '10', '', '1', null);
INSERT INTO `tb_diary` VALUES ('49', '我的简言日记', '1515142431918159989', '2016-03-04 11:04:16', '10', '', '0', null);
INSERT INTO `tb_diary` VALUES ('52', '我的简言日记', '-8309435286726582216', '2016-03-07 21:25:01', '10', '大家都在关注神马啊，新闻联播，健康饮食，胖了，白菜贵子，拥有自己的房子，努力做好自己状态好了\r\n健康饮食', '0', null);
INSERT INTO `tb_diary` VALUES ('53', '我的简言日记', '7643710517789959707', '2016-03-07 21:25:01', '10', '大家都在关注神马啊，新闻联播，健康饮食，胖了，白菜贵子，拥有自己的房子，努力做好自己状态好了\r\n健康饮食', '0', null);
INSERT INTO `tb_diary` VALUES ('54', '我的简言日记', '8141422229055042074', '2016-03-08 10:52:40', '10', ' 努力做好自己，胖子主在关注八卦新闻大家都在减少城祃都是浮动啊，胖子不给力啊心脏病努力做好自己', '0', null);
INSERT INTO `tb_diary` VALUES ('56', '我的日记', '8e45d2ee077a87f560fa7', '2016-03-10 15:54:43', '10', '', '1', null);
INSERT INTO `tb_diary` VALUES ('57', '我的日记', '8e45d2ee077a87f560fa7', '2016-03-10 16:09:25', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('58', '我的日记', '1.jpg', '2016-03-10 16:29:10', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('59', '我的简言日记', '-3733237393392925068', '2016-03-10 16:44:11', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('60', '我的日记', '19171059-d502fd3bb7364915999790646d7b7942.png', '2016-03-10 16:47:51', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('63', '我的日记', 'big_buck_bunny.mp4', '2016-03-10 17:58:19', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('64', '我的日记', '8e45d2ee077a87f560fa7&690.jpg', '2016-03-10 22:13:44', '10', '我的老父亲', '1', '1');
INSERT INTO `tb_diary` VALUES ('65', '我的日记', '20150607_111344.jpg', '2016-03-11 09:06:20', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('66', '我的日记', '20150321_160139.jpg', '2016-03-11 10:21:44', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('67', '我的简言日记', '2133981511782075950', '2016-03-11 10:38:57', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('68', '我的简言日记', '-2246118686981926008', '2016-03-11 10:47:43', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('69', '我的日记', '20150321_155432.jpg', '2016-03-11 12:55:28', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('70', '我的日记', '20150321_144544.jpg', '2016-03-11 12:58:43', '10', ' 墙砖柘城奇才', '1', '1');
INSERT INTO `tb_diary` VALUES ('71', '我的日记', '20150321_160101.jpg', '2016-03-11 13:02:39', '10', '这个傻逼啊', '1', '1');
INSERT INTO `tb_diary` VALUES ('72', '我的日记', 'big_buck_bunny (1).mp4', '2016-03-11 13:12:41', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('73', '我的日记', 'big_buck_bunny.mp4', '2016-03-11 13:12:55', '10', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('74', '我的日记', 'big_buck_bunny.mp4', '2016-03-11 13:13:24', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('76', '我的简言日记', '132311717512030114', '2016-03-11 13:22:09', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('77', '我的日记', 'big_buck_bunny.mp4', '2016-03-11 13:42:12', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('81', '我的日记', 'big_buck_bunny.mp4', '2016-03-11 14:15:54', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('82', '我的简言日记', '6287990070873946389', '2016-03-12 09:16:20', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('83', '我的简言日记', '1057534862055439000', '2016-03-12 11:37:49', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('84', '我的简言日记', '963862748133509170', '2016-03-12 11:39:39', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('90', '我的日记', 'big_buck_bunny.mp4', '2016-03-13 10:22:31', '41', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('102', '我的日记', 'big_buck_bunny.mp4', '2016-03-14 09:31:53', '41', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('104', '我的简言日记', '-2850035365540979256', '2016-03-15 17:29:14', '10', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('105', '我的日记', 'big_buck_bunny.mp4', '2016-03-15 17:29:58', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('107', '我的日记', 'big_buck_bunny.mp4', '2016-03-15 22:25:01', '13', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('109', '我的日记', '19171059-d502fd3bb7364915999790646d7b7942.png', '2016-03-16 09:18:35', '41', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('110', '我的简言日记', '4966537991209891235', '2016-03-16 10:14:24', '41', '我的天啊', '0', '0');
INSERT INTO `tb_diary` VALUES ('111', '我的简言日记', '-7582780158177366917', '2016-03-16 10:32:40', '41', '我是警察，我我', '0', '0');
INSERT INTO `tb_diary` VALUES ('112', '我的简言日记', '7748081991049718928', '2016-03-16 11:25:42', '41', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('113', '我的简言日记', '4427120298843689617', '2016-03-16 12:20:44', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('114', '我的简言日记', '-2681813931510808301', '2016-03-16 12:28:07', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('115', '我的日记', '673d8102cc781f6d5940e549f93a3ec1.jpg', '2016-03-16 14:45:48', '41', '这张图片不错哦', '1', '1');
INSERT INTO `tb_diary` VALUES ('116', '我的日记', 'big_buck_bunny.mp4', '2016-03-16 14:54:52', '41', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('117', '我的日记', '45a1e8e448bd5cbb535431a8c68fa6db (1).jpg', '2016-03-16 15:07:57', '41', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('121', '我的简言日记', '-3496163893582897046', '2016-03-16 17:43:23', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('122', '我的日记', 'big_buck_bunny.mp4', '2016-03-16 18:31:35', '41', '好漂亮的视频啊', '1', '2');
INSERT INTO `tb_diary` VALUES ('123', '我的简言日记', '1301120260187657489', '2016-03-16 19:55:30', '41', '', '0', '0');
INSERT INTO `tb_diary` VALUES ('124', '我的简言日记', '5013711022023899027', '2016-03-16 19:56:43', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('125', '我的日记', '673d8102cc781f6d5940e549f93a3ec1.jpg', '2016-03-16 20:01:46', '10', '做个简单测试而已', '1', '1');
INSERT INTO `tb_diary` VALUES ('126', '我的日记', '673d8102cc781f6d5940e549f93a3ec1.jpg', '2016-03-16 20:02:34', '10', '正常应该看不到这张图片，除了我自己外', '0', '1');
INSERT INTO `tb_diary` VALUES ('127', '我的简言日记', '8636284906965284462', '2016-03-16 20:04:01', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('128', '我的简言日记', '-1157148179111378714', '2016-03-16 20:06:38', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('129', '我的简言日记', '-212599658924514609', '2016-03-16 20:09:38', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('130', '我的简言日记', '6237973671353573967', '2016-03-16 20:11:58', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('131', '我的简言日记', '7978690369337628810', '2016-03-16 20:13:57', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('132', '我的简言日记', '6831208344783915818', '2016-03-16 20:14:25', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('133', '我的简言日记', '2766361112900067502', '2016-03-16 20:15:16', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('134', '我的简言日记', '6627623734105577602', '2016-03-16 20:15:40', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('135', '我的简言日记', '4168793446609179232', '2016-03-16 20:15:57', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('136', '我的简言日记', '-3005706547689153403', '2016-03-16 20:17:47', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('137', '我的简言日记', '1473848339299629329', '2016-03-16 20:19:03', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('138', '我的简言日记', '-4125293795573460681', '2016-03-16 20:19:53', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('139', '我的简言日记', '598699327721993398', '2016-03-16 20:23:26', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('140', '我的简言日记', '7339378783003112266', '2016-03-16 20:23:47', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('141', '我的简言日记', '-5658131415154188404', '2016-03-16 20:24:03', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('142', '我的日记', 'headBg.jpg', '2016-03-17 00:01:28', '41', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('143', '我的日记', 'bg_nologin4.jpg', '2016-03-17 09:25:52', '41', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('144', '我的日记', '20140417043207809.jpg', '2016-03-19 18:49:00', '41', '外面好多雾', '1', '1');
INSERT INTO `tb_diary` VALUES ('145', '我的日记', '', '2016-03-19 18:57:38', '41', 'q ', '1', '3');
INSERT INTO `tb_diary` VALUES ('146', '我的日记', '', '2016-03-19 18:59:24', '41', '今天为什么有那么 大的雾啊，好惨啊，咋办啊', '1', '3');
INSERT INTO `tb_diary` VALUES ('147', '我的日记', 'big_buck_bunny.mp4', '2016-03-21 09:58:42', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('149', '我的日记', 'big_buck_bunny.mp4', '2016-03-21 12:00:06', '41', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('153', '我的日记', 'big_buck_bunny.mp4', '2016-03-21 12:09:41', '10', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('156', '我的简言日记', '1357134511096607577', '2016-03-21 13:53:40', '43', 'Hello, everyBody, my simple diary!', '1', '0');
INSERT INTO `tb_diary` VALUES ('157', '我的日记', '673d8102cc781f6d5940e549f93a3ec1.jpg', '2016-03-21 19:14:55', '43', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('158', '我的日记', 'big_buck_bunny.mp4', '2016-03-21 19:26:19', '43', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('159', '我的日记', '673d8102cc781f6d5940e549f93a3ec1.jpg', '2016-03-21 23:37:53', '41', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('160', '我的简言日记', '3420610918587648481', '2016-03-22 21:20:50', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('162', '我的简言日记', '4170792521629250323', '2016-03-25 14:32:59', '43', '今天天气好晴朗啊，昨天还是小雨霏霏的，32个赞！', '1', '0');
INSERT INTO `tb_diary` VALUES ('163', '我的日记', '', '2016-03-25 14:37:17', '43', '回家的路，总是那么漫长。车外的一山一水，逆着我的童年，把那梦里的故乡，编织的是如此的真实。旋转的车轮，夹杂着我复杂的心跳，开启了一段段童年的往事。闭上眼，故乡就在心里，我数着天上那些熟悉的星星，安然入睡。可我总觉得应该醒来，匆匆岁月正在雕琢着我的容貌，改变着我的生活。似乎已经迟了，就像那场迟来的秋雨，湿润了我的双眼，带走了我的童年。', '1', '3');
INSERT INTO `tb_diary` VALUES ('165', '我的日记', '004.jpg', '2016-03-25 14:43:53', '43', '', '1', '1');
INSERT INTO `tb_diary` VALUES ('166', '我的简言日记', '2010055627445259637', '2016-03-25 14:49:11', '43', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('167', '我的简言日记', '8308774451410240929', '2016-03-25 15:01:04', '43', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('168', '我的简言日记', '955411286307391141', '2016-03-25 15:04:14', '44', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('169', '我的简言日记', '-3601949039215332753', '2016-03-25 15:07:13', '46', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('170', '我的简言日记', '-6365560362650694106', '2016-03-25 15:09:50', '47', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('171', '我的简言日记', '1240684532240854777', '2016-03-25 15:14:06', '48', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('173', '我的简言日记', '4943685548730298679', '2016-04-05 14:00:17', '41', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('174', '我的日记', 'big_buck_bunny.mp4', '2016-04-05 15:10:13', '41', '', '1', '2');
INSERT INTO `tb_diary` VALUES ('175', '我的简言日记', '-6914943688025092568', '2016-04-06 14:47:58', '43', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('176', '我的简言日记', '3146227111879842206', '2016-04-06 14:48:23', '43', '第一次写乘凉日记', '1', '0');
INSERT INTO `tb_diary` VALUES ('177', '我的简言日记', '7364856979074457194', '2016-04-09 19:30:57', '49', '', '1', '0');
INSERT INTO `tb_diary` VALUES ('178', '我的日记', '45a1e8e448bd5cbb535431a8c68fa6db (1).jpg', '2016-04-09 19:59:15', '49', '啦啦啦，今天是个好日子，年年都有今日！', '1', '1');
INSERT INTO `tb_diary` VALUES ('179', '我的日记', 'big_buck_bunny.mp4', '2016-04-09 20:02:05', '49', '好逗的视频', '1', '2');

-- ----------------------------
-- Table structure for tb_friend
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend`;
CREATE TABLE `tb_friend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `friendid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_friend
-- ----------------------------
INSERT INTO `tb_friend` VALUES ('6', '10', '13');
INSERT INTO `tb_friend` VALUES ('7', '10', '5');
INSERT INTO `tb_friend` VALUES ('8', '10', '5');
INSERT INTO `tb_friend` VALUES ('9', '13', '10');
INSERT INTO `tb_friend` VALUES ('10', '13', '41');
INSERT INTO `tb_friend` VALUES ('11', '13', '41');
INSERT INTO `tb_friend` VALUES ('12', '41', '10');
INSERT INTO `tb_friend` VALUES ('13', '10', '41');
INSERT INTO `tb_friend` VALUES ('14', '3', '41');
INSERT INTO `tb_friend` VALUES ('15', '3', '10');
INSERT INTO `tb_friend` VALUES ('16', '43', '13');
INSERT INTO `tb_friend` VALUES ('17', '43', '10');
INSERT INTO `tb_friend` VALUES ('18', '43', '13');
INSERT INTO `tb_friend` VALUES ('19', '43', '10');

-- ----------------------------
-- Table structure for tb_grid
-- ----------------------------
DROP TABLE IF EXISTS `tb_grid`;
CREATE TABLE `tb_grid` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `grid` int(255) NOT NULL,
  `firstline` varchar(255) NOT NULL,
  `secondline` varchar(255) DEFAULT NULL,
  `thirdline` varchar(255) DEFAULT NULL,
  `fourthline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_grid
-- ----------------------------
INSERT INTO `tb_grid` VALUES ('1', '1', '工作完成了', '我还活着', '瘦了', '好多好吃啊');
INSERT INTO `tb_grid` VALUES ('2', '2', '关心同事', '问候家人了', '忘记了', '给老人让坐');
INSERT INTO `tb_grid` VALUES ('3', '3', '写工作总结', '出去旅游', '休息一下', '继续努力工作');
INSERT INTO `tb_grid` VALUES ('4', '4', '效率提高了', '看书了', '不再空想了', '状态好了');
INSERT INTO `tb_grid` VALUES ('5', '5', '心情不错', '不给力', '神马都是浮云', '幸福');
INSERT INTO `tb_grid` VALUES ('6', '6', '她/他写九宫格日记了', '白菜贵了', '新闻联播', '大家都在关注神马');
INSERT INTO `tb_grid` VALUES ('7', '7', '瘦了', '胖了', '一日三餐不能少', '健康饮食');
INSERT INTO `tb_grid` VALUES ('8', '8', '睡得很好', '拥有自己的房子', '努力做好自己', '忘记');

-- ----------------------------
-- Table structure for tb_grid_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_grid_user`;
CREATE TABLE `tb_grid_user` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(255) DEFAULT NULL,
  `grid` int(11) DEFAULT NULL,
  `firstline` varchar(255) DEFAULT NULL,
  `secondline` varchar(255) DEFAULT NULL,
  `thirdline` varchar(255) DEFAULT NULL,
  `fourthline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_grid_user
-- ----------------------------
INSERT INTO `tb_grid_user` VALUES ('1', '41', '1', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('2', '41', '2', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('3', '41', '3', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('4', '41', '4', '没啥可说的', '没啥可说的', 'weathervalue', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('5', '41', '5', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('6', '41', '6', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('7', '41', '7', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('8', '41', '8', '没啥可说的', '没啥可说的', '没啥可说的', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('9', '42', '1', '工作完成了', '没啥可说的', '瘦了', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('10', '42', '2', '关心同事', '没啥可说的', '忘记了', '给老人让坐');
INSERT INTO `tb_grid_user` VALUES ('11', '42', '3', '写工作总结', '没啥可说的', '休息一下', '继续努力工作');
INSERT INTO `tb_grid_user` VALUES ('12', '42', '4', '效率提高了', '没啥可说的', '不再空想了', '状态好了');
INSERT INTO `tb_grid_user` VALUES ('13', '42', '5', '心情不错', '没啥可说的', '神马都是浮云', '幸福');
INSERT INTO `tb_grid_user` VALUES ('14', '42', '6', '她/他写九宫格日记了', '没啥可说的', '新闻联播', '大家都在关注神马');
INSERT INTO `tb_grid_user` VALUES ('15', '42', '7', '瘦了', '没啥可说的', '一日三餐不能少', '健康饮食');
INSERT INTO `tb_grid_user` VALUES ('16', '42', '8', '睡得很好', '没啥可说的', '努力做好自己', '忘记');
INSERT INTO `tb_grid_user` VALUES ('17', '43', '1', '没啥可说的', '没啥可说的', '旅游', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('18', '43', '2', '问候家人了', '没啥可说的', '问候家人了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('19', '43', '3', '没啥可说的', '没啥可说的', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('20', '43', '4', '没啥可说的', '没啥可说的', 'weathervalue', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('21', '43', '5', '命里有时终须有', '没啥可说的', '学会感恩', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('22', '43', '6', '美国大选', '没啥可说的', '副省长被抓', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('23', '43', '7', '没啥可说的', '没啥可说的', '体重直线下降啊', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('24', '43', '8', '年入20W', '没啥可说的', '买房啊', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('25', '44', '1', '工作完成了', '没啥可说的', '好多好吃啊', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('26', '44', '2', '没啥可说的', '没啥可说的', '给老人让坐', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('27', '44', '3', '没啥可说的', '没啥可说的', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('28', '44', '4', '没啥可说的', '没啥可说的', '状态好了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('29', '44', '5', '心情不错', '没啥可说的', '幸福', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('30', '44', '6', '她/他写九宫格日记了', '没啥可说的', '大家都在关注神马', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('31', '44', '7', '没啥可说的', '没啥可说的', '健康饮食', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('32', '44', '8', '睡得很好', '没啥可说的', '忘记', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('33', '45', '1', '工作完成了', '没啥可说的', '瘦了', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('34', '45', '2', '关心同事', '没啥可说的', '忘记了', '给老人让坐');
INSERT INTO `tb_grid_user` VALUES ('35', '45', '3', '写工作总结', '没啥可说的', '休息一下', '继续努力工作');
INSERT INTO `tb_grid_user` VALUES ('36', '45', '4', '效率提高了', '没啥可说的', '不再空想了', '状态好了');
INSERT INTO `tb_grid_user` VALUES ('37', '45', '5', '心情不错', '没啥可说的', '神马都是浮云', '幸福');
INSERT INTO `tb_grid_user` VALUES ('38', '45', '6', '她/他写九宫格日记了', '没啥可说的', '新闻联播', '大家都在关注神马');
INSERT INTO `tb_grid_user` VALUES ('39', '45', '7', '瘦了', '没啥可说的', '一日三餐不能少', '健康饮食');
INSERT INTO `tb_grid_user` VALUES ('40', '45', '8', '睡得很好', '没啥可说的', '努力做好自己', '忘记');
INSERT INTO `tb_grid_user` VALUES ('41', '46', '1', '好多好吃啊', '没啥可说的', '好多好吃啊', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('42', '46', '2', '关心同事', '没啥可说的', '给老人让坐', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('43', '46', '3', '写工作总结', '没啥可说的', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('44', '46', '4', '效率提高了', '没啥可说的', '状态好了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('45', '46', '5', '心情不错', '没啥可说的', '幸福', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('46', '46', '6', '她/他写九宫格日记了', '没啥可说的', '大家都在关注神马', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('47', '46', '7', '没啥可说的', '没啥可说的', '健康饮食', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('48', '46', '8', '睡得很好', '没啥可说的', '忘记', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('49', '47', '1', '好多好吃啊', '没啥可说的', '好多好吃啊', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('50', '47', '2', '没啥可说的', '没啥可说的', '给老人让坐', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('51', '47', '3', '写工作总结', '没啥可说的', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('52', '47', '4', '效率提高了', '没啥可说的', '状态好了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('53', '47', '5', '心情不错', '没啥可说的', '幸福', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('54', '47', '6', '她/他写九宫格日记了', '没啥可说的', '大家都在关注神马', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('55', '47', '7', '瘦了', '没啥可说的', '健康饮食', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('56', '47', '8', '睡得很好', '没啥可说的', '忘记', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('57', '48', '1', '工作完成了', '没啥可说的', '瘦了', '好多好吃啊');
INSERT INTO `tb_grid_user` VALUES ('58', '48', '2', '关心同事', '没啥可说的', '给老人让坐', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('59', '48', '3', '写工作总结', '没啥可说的', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('60', '48', '4', '效率提高了', '没啥可说的', '状态好了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('61', '48', '5', '心情不错', '没啥可说的', '幸福', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('62', '48', '6', '她/他写九宫格日记了', '没啥可说的', '大家都在关注神马', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('63', '48', '7', '瘦了', '没啥可说的', '健康饮食', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('64', '48', '8', '没啥可说的', '没啥可说的', '忘记', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('65', '49', '1', '工作完成了', '我还活着', '好多好吃啊', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('66', '49', '2', '关心同事', '问候家人了', '给老人让坐', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('67', '49', '3', '写工作总结', '出去旅游', '继续努力工作', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('68', '49', '4', '效率提高了', '看书了', '状态好了', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('69', '49', '5', '心情不错', '不给力', '幸福', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('70', '49', '6', '她/他写九宫格日记了', '白菜贵了', '大家都在关注神马', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('71', '49', '7', '瘦了', '胖了', '健康饮食', '没啥可说的');
INSERT INTO `tb_grid_user` VALUES ('72', '49', '8', '睡得很好', '拥有自己的房子', '忘记', '没啥可说的');

-- ----------------------------
-- Table structure for tb_music
-- ----------------------------
DROP TABLE IF EXISTS `tb_music`;
CREATE TABLE `tb_music` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `musicname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_music
-- ----------------------------
INSERT INTO `tb_music` VALUES ('21', '41', '373417985044511009.mp3');
INSERT INTO `tb_music` VALUES ('22', '10', '1728377583272458176.mp3');
INSERT INTO `tb_music` VALUES ('23', '43', '-8878733805846671269.mp3');
INSERT INTO `tb_music` VALUES ('24', '49', '8090459563164169795.mp3');

-- ----------------------------
-- Table structure for tb_reply
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `whoid` int(10) NOT NULL,
  `whoname` varchar(255) NOT NULL,
  `whoesid` int(10) DEFAULT NULL,
  `whoesname` varchar(255) DEFAULT NULL,
  `diaryid` int(10) NOT NULL,
  `replyContent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reply
-- ----------------------------
INSERT INTO `tb_reply` VALUES ('2', '10', 'water1350', '13', 'water1360', '53', '6666');
INSERT INTO `tb_reply` VALUES ('7', '10', 'water1350', '0', '', '54', '发表评论');
INSERT INTO `tb_reply` VALUES ('8', '13', 'water1360', '0', '', '44', '发表评论');
INSERT INTO `tb_reply` VALUES ('9', '10', 'water1350', '0', '', '54', '我是个中国人');
INSERT INTO `tb_reply` VALUES ('10', '10', '', '0', '', '47', '发表评论');
INSERT INTO `tb_reply` VALUES ('11', '10', '', '0', '', '45', '努力做好自己，拥有自己的房子，忘记了');
INSERT INTO `tb_reply` VALUES ('12', '10', 'water1350', '0', '', '38', '我的复杂心思吧');
INSERT INTO `tb_reply` VALUES ('13', '10', 'water1350', '0', '', '53', '丢你老母');
INSERT INTO `tb_reply` VALUES ('14', '10', 'water1350', '0', '', '54', '我要累死了啊，真的好坑');
INSERT INTO `tb_reply` VALUES ('15', '10', 'water1350', '0', '', '54', 'nialomu');
INSERT INTO `tb_reply` VALUES ('16', '10', 'water1350', '0', '', '63', '发表评论');
INSERT INTO `tb_reply` VALUES ('17', '10', 'water1350', '0', '', '64', '发表日记');
INSERT INTO `tb_reply` VALUES ('18', '10', 'water1350', '0', '', '68', '发表评论');
INSERT INTO `tb_reply` VALUES ('19', '10', 'water1350', '0', '', '77', '发表评论');
INSERT INTO `tb_reply` VALUES ('20', '10', 'water1350', '0', '', '77', '发表评论');
INSERT INTO `tb_reply` VALUES ('21', '10', 'water1350', '0', '', '78', '玻璃心易碎');
INSERT INTO `tb_reply` VALUES ('22', '10', 'water1350', '0', '', '78', '你是谁');
INSERT INTO `tb_reply` VALUES ('23', '13', 'water1360', '0', '', '78', '我是林泽水');
INSERT INTO `tb_reply` VALUES ('24', '13', 'water1360', '0', '', '80', '欢迎光临简言日记');
INSERT INTO `tb_reply` VALUES ('25', '13', 'water1360', '10', 'water1350', '77', '你好');
INSERT INTO `tb_reply` VALUES ('26', '13', 'water1360', '10', 'water1350', '78', '今天天气怎样啊，要不要来');
INSERT INTO `tb_reply` VALUES ('27', '10', 'water1350', '13', 'water1360', '80', '你是日记，云计算机发表');
INSERT INTO `tb_reply` VALUES ('28', '10', 'water1350', '0', '', '81', '好漂亮的视频啊');
INSERT INTO `tb_reply` VALUES ('29', '41', 'fire1350', '0', '', '102', 'god');
INSERT INTO `tb_reply` VALUES ('30', '41', 'fire1350', '41', 'fire1350', '102', 'god');
INSERT INTO `tb_reply` VALUES ('31', '41', 'fire1350', '0', '', '111', '音乐好听');
INSERT INTO `tb_reply` VALUES ('32', '41', 'fire1350', '0', '', '116', '我在这个地方呆太久了');
INSERT INTO `tb_reply` VALUES ('33', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('34', '41', 'fire1350', '0', '', '120', '发表评论');
INSERT INTO `tb_reply` VALUES ('35', '41', 'fire1350', '0', '', '120', 'good');
INSERT INTO `tb_reply` VALUES ('36', '41', 'fire1350', '0', '', '120', 'website');
INSERT INTO `tb_reply` VALUES ('37', '41', 'fire1350', '0', '', '120', 'website');
INSERT INTO `tb_reply` VALUES ('38', '41', 'fire1350', '0', '', '120', 'website');
INSERT INTO `tb_reply` VALUES ('39', '41', 'fire1350', '0', '', '120', '发表评论');
INSERT INTO `tb_reply` VALUES ('40', '41', 'fire1350', '0', '', '120', 'website');
INSERT INTO `tb_reply` VALUES ('41', '41', 'fire1350', '0', '', '120', '发表评论');
INSERT INTO `tb_reply` VALUES ('42', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('43', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('44', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('45', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('46', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('47', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('48', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('49', '41', 'fire1350', '0', '', '119', '发表评论');
INSERT INTO `tb_reply` VALUES ('50', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('51', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('52', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('53', '41', 'fire1350', '0', '', '118', '');
INSERT INTO `tb_reply` VALUES ('54', '41', 'fire1350', '0', '', '118', '');
INSERT INTO `tb_reply` VALUES ('55', '41', 'fire1350', '0', '', '118', '我');
INSERT INTO `tb_reply` VALUES ('56', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('57', '41', 'fire1350', '41', 'fire1350', '118', '');
INSERT INTO `tb_reply` VALUES ('58', '41', 'fire1350', '41', 'fire1350', '118', 'q ');
INSERT INTO `tb_reply` VALUES ('59', '41', 'fire1350', '41', 'fire1350', '118', 'qq');
INSERT INTO `tb_reply` VALUES ('60', '41', 'fire1350', '41', 'fire1350', '118', 'q');
INSERT INTO `tb_reply` VALUES ('61', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('62', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('63', '41', 'fire1350', '0', '', '118', '发表评论');
INSERT INTO `tb_reply` VALUES ('64', '41', 'fire1350', '41', 'fire1350', '118', 'q');
INSERT INTO `tb_reply` VALUES ('65', '41', 'fire1350', '41', 'fire1350', '118', 'q d');
INSERT INTO `tb_reply` VALUES ('66', '41', 'fire1350', '41', 'fire1350', '118', 'q d');
INSERT INTO `tb_reply` VALUES ('67', '41', 'fire1350', '41', 'fire1350', '118', 'fire');
INSERT INTO `tb_reply` VALUES ('68', '41', 'fire1350', '41', 'fire1350', '118', 'good');
INSERT INTO `tb_reply` VALUES ('69', '41', 'fire1350', '0', '', '117', '发表评论');
INSERT INTO `tb_reply` VALUES ('70', '41', 'fire1350', '41', 'fire1350', '117', 'fire1350');
INSERT INTO `tb_reply` VALUES ('71', '41', 'fire1350', '0', '', '117', '发表评论');
INSERT INTO `tb_reply` VALUES ('72', '41', 'fire1350', '41', 'fire1350', '117', 'good');
INSERT INTO `tb_reply` VALUES ('73', '41', 'fire1350', '0', '', '105', '发表评论');
INSERT INTO `tb_reply` VALUES ('74', '10', 'water1350', '41', 'fire1350', '105', '论文怎么办啊');
INSERT INTO `tb_reply` VALUES ('75', '41', 'fire1350', '0', '', '121', '胖了才好嘛 ');
INSERT INTO `tb_reply` VALUES ('76', '41', 'fire1350', '0', '', '122', '确定很漂亮啊');
INSERT INTO `tb_reply` VALUES ('77', '41', 'fire1350', '0', '', '141', '牛逼');
INSERT INTO `tb_reply` VALUES ('78', '41', 'fire1350', '0', '', '143', '发表评论');
INSERT INTO `tb_reply` VALUES ('79', '41', 'fire1350', '41', 'fire1350', '143', '漂亮的图片啊');
INSERT INTO `tb_reply` VALUES ('80', '41', 'fire1350', '0', '', '138', '我的简言记');
INSERT INTO `tb_reply` VALUES ('81', '41', 'fire1350', '41', 'fire1350', '138', '我的天啊，人在江湖，身不由已');
INSERT INTO `tb_reply` VALUES ('82', '41', 'fire1350', '0', '', '137', '企业邮件');
INSERT INTO `tb_reply` VALUES ('83', '10', 'water1350', '0', '', '147', ' 好美的视频');
INSERT INTO `tb_reply` VALUES ('84', '41', 'fire1350', '0', '', '147', '哈哈');
INSERT INTO `tb_reply` VALUES ('85', '41', 'fire1350', '10', 'water1350', '147', '是吗？有眼光');
INSERT INTO `tb_reply` VALUES ('86', '3', 'qq', '0', '', '147', '好和谐');
INSERT INTO `tb_reply` VALUES ('87', '41', 'fire1350', '0', '', '148', '哈哈');
INSERT INTO `tb_reply` VALUES ('88', '3', 'qq', '0', '', '148', '666，逗逼');
INSERT INTO `tb_reply` VALUES ('89', '10', 'water1350', '0', '', '148', '今天看来很happy');
INSERT INTO `tb_reply` VALUES ('90', '41', 'fire1350', '3', 'qq', '148', '怎么看出来的？');
INSERT INTO `tb_reply` VALUES ('91', '41', 'fire1350', '10', 'water1350', '148', '一点也不happy');
INSERT INTO `tb_reply` VALUES ('92', '43', 'fire1370', '0', '', '156', '写得不错哦');
INSERT INTO `tb_reply` VALUES ('93', '43', 'fire1370', '0', '', '165', 'beautiful');
INSERT INTO `tb_reply` VALUES ('94', '43', 'fire1370', '0', '', '163', '文艺青年啊，士别三日，当刮目相看');
INSERT INTO `tb_reply` VALUES ('95', '41', 'fire1350', '0', '', '160', '我也说一句');
INSERT INTO `tb_reply` VALUES ('96', '41', 'fire1350', '0', '', '149', '我也说一句');
INSERT INTO `tb_reply` VALUES ('97', '41', 'fire1350', '0', '', '149', '好大的太阳啊');
INSERT INTO `tb_reply` VALUES ('98', '41', 'fire1350', '41', 'fire1350', '149', '今天是个好日子');
INSERT INTO `tb_reply` VALUES ('99', '41', 'fire1350', '0', '', '173', 'good');
INSERT INTO `tb_reply` VALUES ('100', '43', 'fire1370', '0', '', '166', '我也说一句');
INSERT INTO `tb_reply` VALUES ('101', '43', 'fire1370', '0', '', '166', '我也说一句');
INSERT INTO `tb_reply` VALUES ('102', '43', 'fire1370', '0', '', '166', '我也说一句');
INSERT INTO `tb_reply` VALUES ('103', '43', 'fire1370', '0', '', '166', '丢你老母');
INSERT INTO `tb_reply` VALUES ('104', '43', 'fire1370', '0', '', '166', '丢你老爸');
INSERT INTO `tb_reply` VALUES ('105', '43', 'fire1370', '0', '', '166', '');
INSERT INTO `tb_reply` VALUES ('106', '41', 'fire1350', '0', '', '160', '我的天啊，你竟然喜欢这个东西');
INSERT INTO `tb_reply` VALUES ('107', '43', 'fire1370', '0', '', '176', '写得不错啊，明天继续捧场啊');
INSERT INTO `tb_reply` VALUES ('108', '10', 'water1350', '0', '', '174', '好有趣的视频');
INSERT INTO `tb_reply` VALUES ('109', '13', 'water1360', '0', '', '174', '哈哈哈，666');
INSERT INTO `tb_reply` VALUES ('110', '41', 'fire1350', '10', 'water1350', '174', '国外的动画好多都是精品啊');

-- ----------------------------
-- Table structure for tb_tab
-- ----------------------------
DROP TABLE IF EXISTS `tb_tab`;
CREATE TABLE `tb_tab` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `grid` int(255) NOT NULL,
  `firstline` varchar(255) DEFAULT NULL,
  `secondline` varchar(255) DEFAULT NULL,
  `thirdline` varchar(255) DEFAULT NULL,
  `fourthline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tab
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT 'E-mail',
  `question` varchar(45) DEFAULT NULL COMMENT '密码提示问题',
  `answer` varchar(45) DEFAULT NULL COMMENT '提示问题答案',
  `city` varchar(30) DEFAULT NULL COMMENT '所在地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('3', 'qq', 'w123456', 'wgh717@sohu.com', '6', '6', '长春');
INSERT INTO `tb_user` VALUES ('4', 'h', 'hhhhhh', 'wgh717@sohu.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('5', 'w', 'wwwwww', 'www@sina.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('6', 'qiqi', 'qq123456', 'wgh8007@163.com', '我的工作单位', '', '长春');
INSERT INTO `tb_user` VALUES ('7', 'kk', 'kkkkkk', 'wgh@gggg.com', '', '', '长春');
INSERT INTO `tb_user` VALUES ('8', '888', 'wwwwww', 'www@si.com', '', '', '葫芦岛');
INSERT INTO `tb_user` VALUES ('9', 'water', 'qq87911862', '1756626759@qq.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('10', 'water1350', 'qq87911862', '1756626759@qq.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('13', 'water1360', 'qq87911862', '1@2.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('22', 'e', 'eeeeee', 'e@e.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('23', 'e1', 'eeeeee', 'e@e.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('24', 'e2', 'eeeeee', 'e@e.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('25', 'water1363', 'eeeeee', 'e@e.com', '', '', '北京');
INSERT INTO `tb_user` VALUES ('26', 'ww', 'aaaaaa', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('27', 'www', 'wwwwww', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('28', 'wwww', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('29', 'water1356', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('30', 'A', 'a123456', '15521244178@163.com', null, null, null);
INSERT INTO `tb_user` VALUES ('31', 'wwwww', 'a123456', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('32', 'wwwwww', 'aaaaaa', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('33', 'AFDSFSD', 'aaaaaa', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('34', 'wssf', 'qq87911862', 'fdf@fds.com', null, null, null);
INSERT INTO `tb_user` VALUES ('35', 'china', 'qq87911862', 'china@c.com', null, null, null);
INSERT INTO `tb_user` VALUES ('36', 'water13500', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('41', 'fire1350', 'QQ87911862', '15521244178@163.com', null, null, null);
INSERT INTO `tb_user` VALUES ('42', 'fire888', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('43', 'fire1370', 'qq87911862', '15521244178@163.com', null, null, null);
INSERT INTO `tb_user` VALUES ('44', 'fire1380', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('45', 'water1390', 'qq87911862', '1756626759@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('46', 'fire1390', 'qq87911862', '87911862@163.com', null, null, null);
INSERT INTO `tb_user` VALUES ('47', 'fire1400', 'qq87911862', 'fire1400@163.com', null, null, null);
INSERT INTO `tb_user` VALUES ('48', 'fire1410', 'qq87911862', 'fire1410@qq.com', null, null, null);
INSERT INTO `tb_user` VALUES ('49', '2000', 'qq87911862', '1756626759@qq.com', null, null, null);
