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
  `guest_id` smallint(5) unsigned NOT NULL COMMENT '入住客人编号',
  `guest_phone` varchar(30) DEFAULT NULL COMMENT '入住客人手机',
  `room_id` smallint(5) unsigned NOT NULL COMMENT '入住房间编号',
  `check_in_date` datetime DEFAULT NULL COMMENT '入住时间',
  `check_days` smallint(5) unsigned DEFAULT NULL COMMENT '入住天数',
  `check_out_date` datetime DEFAULT NULL COMMENT '退房时间',
  `check_meal_type` varchar(30) DEFAULT NULL COMMENT '餐饮类型',
  `check_num_of_people` tinyint(4) unsigned DEFAULT NULL COMMENT '入住人数',
  `check_room_consume` tinyint(5) unsigned DEFAULT NULL COMMENT '客房消费',
  `check_total_consume` tinyint(5) unsigned DEFAULT NULL COMMENT '消费总额',
  PRIMARY KEY (`checklist_id`),
  KEY `guest_id` (`guest_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checklist` */

/*Table structure for table `financial_report` */

DROP TABLE IF EXISTS `financial_report`;

CREATE TABLE `financial_report` (
  `fin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '财务报表编号',
  `fin_today_income` smallint(5) unsigned DEFAULT NULL COMMENT '今天的收入',
  `fin_today_expend` smallint(5) unsigned DEFAULT NULL COMMENT '今天的支出',
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `financial_report` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guest` */

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

/* Procedure structure for procedure `proc_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_login`(IN inputname VARCHAR(30),IN inputpw VARCHAR(30),OUT state INT)
BEGIN
    DECLARE name_exist VARCHAR(30);
    DECLARE pw VARCHAR(32);
    SET state=0;
    SET name_exist=(SELECT admin_name FROM `admin` WHERE inputname=admin_name);
    IF  name_exist IS NULL THEN
	SET state=-1;
    ELSE
	SET pw=(SELECT admin_pw FROM `admin` WHERE inputname=admin_name);
	IF pw!=inputpw THEN
	    SET state=-2;
	ELSE
	    UPDATE `admin` SET admin_last_visit=NOW() WHERE inputname=admin_name;
	    SET state=1;
	END IF;
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_login_au` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_login_au` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_login_au`(IN inputname VARCHAR(30),IN inputpw VARCHAR(30),OUT state VARCHAR(30))
BEGIN
    DECLARE name_exist VARCHAR(30);
    DECLARE pw VARCHAR(32);
    DECLARE au VARCHAR(20);
    SET state='loginInit';
    SET name_exist=(SELECT user_name FROM `user` WHERE inputname=user_name);
    IF  name_exist IS NULL THEN
	SET state='loginNameError';
    ELSE
	SET pw=(SELECT `password` FROM `user` WHERE inputname=user_name);
	IF pw!=inputpw THEN
	    SET state='loginPasswordError';
	ELSE
	    SET au=(SELECT authority FROM `user` where inputname=user_name);
	    if au='manager' then
		set state='loginManager';
	    elseif au='user' then
		set state='loginUser';
	    elseif au='guest' then
		set state='loginGuest';
	    else
	        set state='loginUnknowAu';
	    end if;
	    UPDATE `user` SET last_visit=NOW() WHERE inputname=user_name;
	END IF;
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_roomAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_roomAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_roomAdd`(IN roomNum varchar(10), IN roomType VARCHAR(30),
IN roomArea TINYINT, IN roomMaxnum TINYINT, IN roomPrice SMALLINT, IN roomAircondition TINYINT, IN roomTV TINYINt,
in roomWIFI tinyint, roomWashroom tinyint, IN roomIsStay tinyint, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='addroominit';
     SET id_exist=(SELECT room_num FROM `room` WHERE roomNum=room_num);
     IF  id_exist IS NOT NULL THEN
	SET state='addRoomFailed';
     ELSE
	INSERT INTO `room` VALUES(NULL,roomNum,roomType,roomArea,roomMaxnum,roomPrice,roomAircondition,
	roomTV,roomWIFI,roomWashroom,roomIsStay);
	SET state='addRoomSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_roomDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_roomDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_roomDel`(IN roomNum varchar(10), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist smallint;
     SET state='delroominit';
     SET id_exist=(SELECT room_id FROM `room` WHERE roomNum=room_num);
	IF  id_exist IS NULL THEN
	    SET state='delRoomFailed';
	ELSE
	    DELETE FROM `room` 
	    WHERE roomNum=room_num;
	    SET state='delRoomSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_roomSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_roomSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_roomSelect`(In roomNum varchar(10), out state varchar(30))
BEGIN
	set state='selectInit';
	if roomNum is NUll then
		SELECT * FROM `room` ORDER BY room_id ASC;
		SET state='selectAllRoom';
	else
		Select * from `room` where room_num=roomNum;
		set state='selectOneRoom';
	end if;
	
end */$$
DELIMITER ;

/* Procedure structure for procedure `proc_roomUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_roomUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_roomUpdate`(IN roomNum VARCHAR(10), IN roomType VARCHAR(30),
IN roomArea TINYINT, IN roomMaxnum TINYINT, IN roomPrice SMALLINT, IN roomAircondition TINYINT, 
IN roomTV TINYINT,IN roomWIFI TINYINT, roomWashroom TINYINT, IN roomIsStay TINYINT, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist smallint;
     SET state='updateRoomInit';
     SET id_exist=(SELECT room_id FROM `room` WHERE roomNum=room_num);
	IF  id_exist IS NULL THEN
	    SET state='updateRoomFailed';
	ELSE
	   IF roomType IS NOT NULL THEN
		UPDATE `room` SET room_type=roomType WHERE roomNum=room_num;
	   END IF;
	   IF roomArea IS NOT NULL THEN
		UPDATE `room` SET room_area=roomArea WHERE roomNum=room_num;
	   END IF;
	   IF roomMaxnum IS NOT NULL THEN
		UPDATE `room` SET room_maxnum_of_people=roomMaxnum WHERE roomNum=room_num;
	   END IF;
	   IF roomPrice IS NOT NULL THEN
		UPDATE `room` SET room_price=roomPrice WHERE roomNum=room_num;
	   END IF;
	   IF roomAircondition IS NOT NULL THEN
		UPDATE `room` SET room_aircondition=roomAircondition WHERE roomNum=room_num;
	   END IF;
	   IF roomTV IS NOT NULL THEN
		UPDATE `room` SET room_TV=roomTV WHERE roomNum=room_num;
	   END IF;
	   IF roomWIFI IS NOT NULL THEN
		UPDATE `room` SET room_wifi=roomWIFI WHERE roomNum=room_num;
	   END IF;
	   IF roomWashroom IS NOT NULL THEN
		UPDATE `room` SET room_washroom=roomWashroom WHERE roomNum=room_num;
	   END IF;
	   IF roomIsStay IS NOT NULL THEN
		UPDATE `room` SET room_is_stay=roomIsStay WHERE roomNum=room_num;
	   END IF;
	   SET state='updateRoomSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_selectAll` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_selectAll` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_selectAll`(In choice Varchar(20),out state varchar(30))
BEGIN
	SET state='initSelectAll';
	CASE choice
	WHEN 'room' THEN 
		SELECT * from `room` ORDER BY room_id ASC;
		SET state='selectAllRoom';
	       
	ELSE
		SET state='selectUnknowError';
     END CASE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_userAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_userAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userAdd`()
BEGIN

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
