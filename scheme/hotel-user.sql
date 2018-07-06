/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.20-log : Database - hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hotel`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '账号',
  `user_name` varchar(30) COLLATE utf8_esperanto_ci DEFAULT NULL COMMENT '姓名',
  `password` varchar(32) COLLATE utf8_esperanto_ci DEFAULT NULL COMMENT '密码',
  `credits` int(11) DEFAULT NULL COMMENT '积分',
  `authority` varchar(20) COLLATE utf8_esperanto_ci DEFAULT NULL COMMENT '权限',
  `last_visit` datetime DEFAULT NULL COMMENT '最近登录时间',
  `last_ip` varchar(23) COLLATE utf8_esperanto_ci DEFAULT NULL COMMENT '最近登录ip',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COLLATE=utf8_esperanto_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`credits`,`authority`,`last_visit`,`last_ip`) values 
(1002,'admin','123456',10,'001','2018-06-28 14:53:42','0:0:0:0:0:0:0:1'),
(1003,'客服001','123456',NULL,'002',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
