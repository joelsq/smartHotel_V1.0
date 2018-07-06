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

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '酒店人员账号',
  `admin_name` varchar(30) DEFAULT NULL COMMENT '酒店人员姓名',
  `admin_pw` varchar(32) DEFAULT NULL COMMENT '酒店人员登录密码',
  `admin_au` varchar(32) DEFAULT NULL COMMENT '酒店人员权限',
  `admin_last_visit` datetime DEFAULT NULL COMMENT '酒店人员最近登录时间',
  `admin_last_ip` varchar(23) DEFAULT NULL COMMENT '酒店人员最近登录ip',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_name`,`admin_pw`,`admin_au`,`admin_last_visit`,`admin_last_ip`) values 
(1001,'admin','123456','admin','2018-07-06 08:07:59',NULL),
(1002,'manager','123','mamager',NULL,NULL);

/*Table structure for table `checklist` */

DROP TABLE IF EXISTS `checklist`;

CREATE TABLE `checklist` (
  `checklist_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '入住列表编号',
  `check_guest_id` smallint(5) unsigned NOT NULL COMMENT '入住客人编号',
  `check_room_id` smallint(5) unsigned NOT NULL COMMENT '入住房间编号',
  `check_in_date` datetime DEFAULT NULL COMMENT '入住时间',
  `check_days` smallint(5) unsigned DEFAULT NULL COMMENT '入住天数',
  `check_out_date` datetime DEFAULT NULL COMMENT '退房时间',
  `check_meal_type` varchar(30) DEFAULT NULL COMMENT '餐饮类型',
  `check_num_of_people` tinyint(4) unsigned DEFAULT NULL COMMENT '入住人数',
  `check_room_consume` tinyint(5) unsigned DEFAULT NULL COMMENT '客房消费',
  `check_total_consume` tinyint(5) unsigned DEFAULT NULL COMMENT '消费总额',
  PRIMARY KEY (`checklist_id`),
  KEY `guest_id` (`check_guest_id`),
  KEY `room_id` (`check_room_id`),
  CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`check_room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`check_guest_id`) REFERENCES `guest` (`guest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `checklist` */

insert  into `checklist`(`checklist_id`,`check_guest_id`,`check_room_id`,`check_in_date`,`check_days`,`check_out_date`,`check_meal_type`,`check_num_of_people`,`check_room_consume`,`check_total_consume`) values 
(1,1,1,'2018-07-06 11:41:31',3,NULL,'lunch',2,200,230),
(6,2,2,'2018-07-06 11:42:58',1,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `financial_report` */

DROP TABLE IF EXISTS `financial_report`;

CREATE TABLE `financial_report` (
  `fin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '财务报表编号',
  `fin_today_income` smallint(5) unsigned DEFAULT NULL COMMENT '今天的收入',
  `fin_today_expend` smallint(5) unsigned DEFAULT NULL COMMENT '今天的支出',
  `fin_date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `financial_report` */

insert  into `financial_report`(`fin_id`,`fin_today_income`,`fin_today_expend`,`fin_date`) values 
(1,1000,400,'2018-07-06'),
(2,4000,1000,'2018-07-04');

/*Table structure for table `guest` */

DROP TABLE IF EXISTS `guest`;

CREATE TABLE `guest` (
  `guest_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '客人编号',
  `guest_name` varchar(30) DEFAULT NULL COMMENT '客人姓名',
  `guest_phone` varchar(30) DEFAULT NULL COMMENT '客人手机号',
  `guest_password` varchar(30) DEFAULT NULL COMMENT '客人登录密码',
  `guest_document_num` varchar(30) DEFAULT NULL COMMENT '客人证件号',
  `guest_gender` varchar(10) DEFAULT NULL COMMENT '客人性别',
  `guset_last_visit` datetime DEFAULT NULL COMMENT '客人最近登录时间',
  `guset_last_ip` varchar(23) DEFAULT NULL COMMENT '客人最近登录ip',
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `guest` */

insert  into `guest`(`guest_id`,`guest_name`,`guest_phone`,`guest_password`,`guest_document_num`,`guest_gender`,`guset_last_visit`,`guset_last_ip`) values 
(1,'guest','13923333333','123456','442000111122223333','female',NULL,NULL),
(2,'guest2','13921111444','123456','442000111111111111','female',NULL,NULL);

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(23) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `login_log` */

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `room_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '客房id',
  `room_num` varchar(10) DEFAULT NULL COMMENT '客房编号',
  `room_type` varchar(30) DEFAULT '标准间' COMMENT '客房类型',
  `room_area` tinyint(3) unsigned DEFAULT '25' COMMENT '客房面积',
  `room_maxnum_of_people` tinyint(3) unsigned DEFAULT '2' COMMENT '客房最大容纳人数',
  `room_price` smallint(5) unsigned DEFAULT '200' COMMENT '客房价格',
  `room_aircondition` tinyint(4) unsigned DEFAULT '1' COMMENT '空调',
  `room_TV` tinyint(4) unsigned DEFAULT '1' COMMENT '电视',
  `room_wifi` tinyint(4) unsigned DEFAULT '1' COMMENT '网络',
  `room_washroom` tinyint(4) unsigned DEFAULT '1' COMMENT '卫生间',
  `room_is_stay` tinyint(4) unsigned DEFAULT '0' COMMENT '是否入住',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`room_id`,`room_num`,`room_type`,`room_area`,`room_maxnum_of_people`,`room_price`,`room_aircondition`,`room_TV`,`room_wifi`,`room_washroom`,`room_is_stay`) values 
(1,'R1-1','大床房',25,2,200,1,1,1,1,0),
(2,'R2-1','双床房',25,2,200,1,1,1,1,0),
(3,'R3-1','家庭房',35,4,300,1,1,1,1,0),
(4,'R1-2','大床房',25,2,200,1,1,1,1,0),
(5,'R1-3','大床房',25,2,200,1,1,1,1,0),
(7,'R2-2','家庭房',25,2,250,1,1,1,1,0);

/*Table structure for table `room_review` */

DROP TABLE IF EXISTS `room_review`;

CREATE TABLE `room_review` (
  `review_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `review_room_num` varchar(10) DEFAULT NULL COMMENT '评论的房间编号',
  `review_guest_id` smallint(5) unsigned DEFAULT NULL COMMENT '评论的客人编号',
  `review_score` tinyint(3) unsigned DEFAULT NULL COMMENT '评分',
  `review_comment` text COMMENT '评论内容',
  `review_photo` varchar(50) DEFAULT NULL COMMENT '评论的照片',
  PRIMARY KEY (`review_id`),
  KEY `review_room_id` (`review_room_num`),
  CONSTRAINT `room_review_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room_review` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '账号',
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `credits` int(11) DEFAULT NULL COMMENT '积分',
  `authority` varchar(20) DEFAULT 'guest' COMMENT '权限',
  `last_visit` datetime DEFAULT NULL COMMENT '最近登录时间',
  `last_ip` varchar(23) DEFAULT NULL COMMENT '最近登录ip',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`credits`,`authority`,`last_visit`,`last_ip`) values 
(1002,'admin','123456',10,'manager','2018-07-06 08:53:35','0:0:0:0:0:0:0:1'),
(1003,'客服001','123456',NULL,'user','2018-07-06 09:10:33',NULL),
(1004,'guest','123456',NULL,'guest','2018-07-06 09:12:14',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
