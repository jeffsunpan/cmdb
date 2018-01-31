-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: task
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '部门名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `hostname` char(15) DEFAULT NULL,
  `distributionversion` char(20) DEFAULT NULL,
  `kernel` varchar(45) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `distribution` char(15) DEFAULT NULL,
  `arch` varchar(10) DEFAULT NULL,
  `cpus` int(2) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `project` varchar(45) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hosts_app`
--

DROP TABLE IF EXISTS `hosts_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `host_app` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '项目名',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '项目创建人ID',
  `itype` varchar(50) NOT NULL DEFAULT '0' COMMENT '项目类型',
  `adddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目创建时间',
  `startdate` date DEFAULT NULL COMMENT '项目开始执行时间',
  `enddate` date DEFAULT NULL COMMENT '项目完成结束时间',
  `content` text COMMENT '项目描述',
  `status` tinyint(4) DEFAULT '0' COMMENT '项目状态（等待、开始，完成）',
  `del_userid` int(11) NOT NULL COMMENT '删除项目的用户ID',
  `del_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '项目删除状态（0=删除，1=正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='项目名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_reply`
--

DROP TABLE IF EXISTS `item_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `userid` int(11) NOT NULL COMMENT '回复人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `editdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `taskid` int(11) NOT NULL COMMENT '所属任务表id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `inputid` int(11) DEFAULT NULL COMMENT '任务发起人id',
  `inputdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务发起时间',
  `userid` int(11) NOT NULL COMMENT '任务责任人用户（user）表id',
  `depid` int(11) NOT NULL COMMENT '任务责任人部门（department）表id',
  `assistid` int(11) NOT NULL COMMENT '任务协助人id',
  `assdepid` int(11) NOT NULL COMMENT '任务协助人部门（department）表id',
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务主题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务内容',
  `status` tinyint(3) unsigned zerofill DEFAULT '000' COMMENT '任务接收状态（0=末接、1=开始、2=结束）',
  `startdate` datetime NOT NULL COMMENT '任务开始时间（发单人规定任务开始时间）',
  `enddate` datetime NOT NULL COMMENT '任务结束时间（发单人规定任务结束时间）',
  `begindate` datetime DEFAULT NULL COMMENT '任务接单时间（责任人任务接单时间）',
  `finishdate` datetime DEFAULT NULL COMMENT '任务完成时间（责任人提交任务时间）',
  `evaluate` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '发起人对任务评估',
  `priority` tinyint(4) NOT NULL COMMENT '优先级 1-最低 2-普通 3-紧急',
  `itemid` int(11) unsigned zerofill DEFAULT NULL COMMENT '关联项目的ID',
  `departmentid` int(11) NOT NULL COMMENT '关联的部门ID,即任务所属的部门',
  `del_userid` int(11) DEFAULT NULL COMMENT '删除任务人的用户ID',
  `del_status` int(11) NOT NULL DEFAULT '1' COMMENT '任务删除状态（0=删除，1=正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_reply`
--

DROP TABLE IF EXISTS `task_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `userid` int(11) NOT NULL COMMENT '回复人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `editdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `taskid` int(11) NOT NULL COMMENT '所属任务表id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='任务回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(20) NOT NULL DEFAULT '0' COMMENT '姓名',
  `username` varchar(50) NOT NULL DEFAULT '0' COMMENT '帐号',
  `passwd` varchar(50) NOT NULL DEFAULT '0' COMMENT '密码',
  `phone` int(11) DEFAULT '0' COMMENT '电话',
  `birthday` varchar(20) DEFAULT '0' COMMENT '生日',
  `sex` varchar(4) DEFAULT '0' COMMENT '性别，女-0，男-1',
  `qq` int(11) DEFAULT '0' COMMENT 'qq',
  `email` varchar(50) DEFAULT '0' COMMENT '邮箱',
  `department` int(11) DEFAULT '0' COMMENT '所属部门ID',
  `access` tinyint(4) DEFAULT '0' COMMENT '权限',
  `image` varchar(50) DEFAULT NULL COMMENT '头像地址',
  `adddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户加入时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态（0=删除，1=正常）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-31 14:41:38
