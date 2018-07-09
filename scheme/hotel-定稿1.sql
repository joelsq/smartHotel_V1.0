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
  `check_guest_id` smallint(5) unsigned DEFAULT NULL COMMENT '入住客人编号',
  `check_room_id` smallint(5) unsigned DEFAULT NULL COMMENT '入住房间编号',
  `check_in_date` date DEFAULT NULL COMMENT '入住时间',
  `check_days` smallint(5) unsigned DEFAULT NULL COMMENT '入住天数',
  `check_out_date` date DEFAULT NULL COMMENT '退房时间',
  `check_meal_type` varchar(30) DEFAULT NULL COMMENT '餐饮类型',
  `check_num_of_people` tinyint(4) unsigned DEFAULT NULL COMMENT '入住人数',
  `check_room_consume` int(10) unsigned DEFAULT NULL COMMENT '客房消费',
  `check_total_consume` int(10) unsigned DEFAULT NULL COMMENT '消费总额',
  PRIMARY KEY (`checklist_id`),
  KEY `guest_id` (`check_guest_id`),
  KEY `room_id` (`check_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `checklist` */

insert  into `checklist`(`checklist_id`,`check_guest_id`,`check_room_id`,`check_in_date`,`check_days`,`check_out_date`,`check_meal_type`,`check_num_of_people`,`check_room_consume`,`check_total_consume`) values 
(14,NULL,15,'2018-07-02',NULL,NULL,'dinner',NULL,0,0);

/*Table structure for table `financial_report` */

DROP TABLE IF EXISTS `financial_report`;

CREATE TABLE `financial_report` (
  `fin_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '财务报表编号',
  `fin_today_income` smallint(5) unsigned DEFAULT NULL COMMENT '今天的收入',
  `fin_today_expend` smallint(5) unsigned DEFAULT NULL COMMENT '今天的支出',
  `fin_date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `financial_report` */

insert  into `financial_report`(`fin_id`,`fin_today_income`,`fin_today_expend`,`fin_date`) values 
(1,1000,400,'2018-07-06'),
(3,100,2000,'2018-07-13'),
(4,100,200,'2018-07-15');

/*Table structure for table `guest` */

DROP TABLE IF EXISTS `guest`;

CREATE TABLE `guest` (
  `guest_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '客人编号',
  `guest_name` varchar(30) DEFAULT NULL COMMENT '客人姓名',
  `guest_phone` varchar(30) DEFAULT NULL COMMENT '客人手机号',
  `guest_password` varchar(30) DEFAULT NULL COMMENT '客人登录密码',
  `guest_document_num` varchar(30) DEFAULT NULL COMMENT '客人证件号',
  `guest_gender` varchar(10) DEFAULT NULL COMMENT '客人性别',
  `guest_last_visit` datetime DEFAULT NULL COMMENT '客人最近登录时间',
  `guest_last_ip` varchar(23) DEFAULT NULL COMMENT '客人最近登录ip',
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `guest` */

insert  into `guest`(`guest_id`,`guest_name`,`guest_phone`,`guest_password`,`guest_document_num`,`guest_gender`,`guest_last_visit`,`guest_last_ip`) values 
(1,'guest','null','null','442000111122223333','male',NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'test','12313132131','123456','1222222132313','male',NULL,NULL),
(6,'guest3','12313132131','123456','5454552341','male',NULL,NULL),
(7,'guest3','41222143412421','123456','2412441224142','female',NULL,NULL),
(10,'10',NULL,NULL,NULL,NULL,NULL,NULL),
(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'wang','21324',NULL,NULL,NULL,NULL,NULL),
(22,'ting','135468839593','123456',NULL,NULL,NULL,NULL),
(23,'guest1','12313132131','123456',NULL,NULL,NULL,NULL),
(24,'guest4','18923336472','123456',NULL,NULL,NULL,NULL),
(25,'Joe','1342342341','123456',NULL,NULL,NULL,NULL),
(26,'abc','41341411','123456',NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`room_id`,`room_num`,`room_type`,`room_area`,`room_maxnum_of_people`,`room_price`,`room_aircondition`,`room_TV`,`room_wifi`,`room_washroom`,`room_is_stay`) values 
(5,'R1-3','大床房',25,2,200,1,1,1,1,0),
(14,'R3-2','大床房',35,2,500,NULL,NULL,NULL,NULL,0),
(15,'R1-10','大床房',35,2,500,NULL,NULL,NULL,NULL,0),
(16,'R1-5','大床',20,2,1000,NULL,NULL,NULL,NULL,0),
(18,'R1-4','总统套房',50,2,1000,NULL,NULL,NULL,NULL,0),
(19,'R1-1','单人',35,1,500,NULL,NULL,NULL,NULL,0),
(20,'R1-13','优惠房',25,2,300,NULL,NULL,NULL,NULL,0),
(21,'R1-6','优惠房',25,1,140,NULL,NULL,NULL,NULL,0),
(22,'R1-19','总统套房',50,4,1000,NULL,NULL,NULL,NULL,0),
(23,'R2-1','总统套房',50,2,2000,NULL,NULL,NULL,NULL,0),
(24,'R4-1','总统套房',2,1,2000,NULL,NULL,NULL,NULL,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`credits`,`authority`,`last_visit`,`last_ip`) values 
(1002,'admin','123456',10,'manager','2018-07-09 15:26:03','0:0:0:0:0:0:0:1'),
(1004,'user','123456',NULL,'user','2018-07-09 14:04:31',NULL),
(1005,'lg','111222',10,'test',NULL,NULL),
(1006,'Joe','test',10,'test','2018-07-09 01:29:00',NULL),
(1007,'guest2','1212',0,'guest',NULL,NULL),
(1008,'lxx','123456',0,'test',NULL,NULL),
(1009,'guest3','123456',NULL,'guest',NULL,NULL),
(1010,'王小二','1234456',NULL,'guest',NULL,NULL),
(1011,'张三','12345',NULL,'',NULL,NULL),
(1012,'林','123456',100,'manager',NULL,NULL),
(1013,'Bob','bob',NULL,'guest',NULL,NULL);

/* Procedure structure for procedure `proc_checklistAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistAdd`(in guestname varchar(30),In guestPhone varchar(30),
in roomid smallint,IN checkInDate date, IN checkMealType VARCHAR(30), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     declare g smallint;
     SET state='addchecklistinit';
     SET id_exist=(SELECT check_room_id FROM `checklist` WHERE roomid=check_room_id);
     IF  id_exist IS NOT NULL THEN
	SET state='addChecklistFailed';
     ELSE
	set g=(select guest_id from `guest` where guestname=guest_name);
	if g is Null then
		insert into `guest` values(null,guestname,guestPhone,'123456',null,null,null,null);	
	end if;
	INSERT INTO `checklist` VALUES(NULL,g,roomId,checkInDate,null,null,checkMealType,null,0,0);
	SET state='addChecklistSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_checklistDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistDel`(IN checklistId smallint, OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='delchecklistinit';
     SET id_exist=(SELECT checklist_id FROM `checklist` WHERE checklistId=checklist_id);
	IF  id_exist IS NULL THEN
	    SET state='delChecklistFailed';
	ELSE
	    DELETE FROM `checklist` 
	    WHERE checklistId=checklist_id;
	    SET state='delChecklistSuccess';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_checklistSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistSelect`(IN checkGuestId smallint, OUT state VARCHAR(30))
BEGIN
SET state='selectInit';
	IF checkGuestId IS NULL THEN
		SELECT * FROM `checklist` ORDER BY checklist_id ASC;
		SET state='selectAllChecklist';
	ELSE
		SELECT * FROM `checklist` WHERE checkGuestId=check_guest_id;
		SET state='selectOneChecklist';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_checklistUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistUpdate`(in checklistId smallint,IN checkGuestId SMALLINT,IN checkRoomId SMALLINT,IN checkInDate datetime, IN checkDays smallint,
IN checkOutDate datetime, IN checkMealType varchar(30), IN checkNumOfPeople tinyint, IN checkRoomConsume int,IN checkTotalConsume int, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateChecklistInit';
     SET id_exist=(SELECT checklist_id FROM `checklist` WHERE checklistId=checklist_id);
	IF  id_exist IS NULL THEN
	    SET state='updateChecklistFailed';
	ELSE
	   IF checkDays IS NOT NULL THEN
		UPDATE `checklist` SET check_days=checkDays WHERE checklistId=checklist_id;
	   END IF;
	   IF checkOutDate IS NOT NULL THEN
		UPDATE `checklist` SET check_out_date=checkOutDate WHERE checklistId=checklist_id;
	   END IF;
	   IF checkMealType IS NOT NULL THEN
		UPDATE `checklist` SET check_meal_type=checkMealType WHERE checklistId=checklist_id;
	   END IF;
	   IF checkNumOfPeople IS NOT NULL THEN
		UPDATE `checklist` SET check_num_of_people=checkNumOfPeople WHERE checklistId=checklist_id;
	   END IF;
	   IF checkRoomConsume IS NOT NULL THEN
		UPDATE `checklist` SET check_room_consume=checkRoomConsume WHERE checklistId=checklist_id;
	   END IF;
	   IF checkTotalConsume IS NOT NULL THEN
		UPDATE `checklist` SET check_total_consume=checkTotalConsume WHERE checklistId=checklist_id;
	   END IF;
	   SET state='updateChecklistSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportAdd`(IN finTodayIncome VARCHAR(10), IN finTodayExpend VARCHAR(30),
IN finDate Date, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist date;
     SET state='addfinancial_reportinit';
     SET id_exist=(SELECT fin_date FROM `financial_report` WHERE finDate=fin_date);
     IF  id_exist IS NOT NULL THEN
	SET state='addFinancial_reportFailed';
     ELSE
	INSERT INTO `financial_report` VALUES(NULL,finTodayIncome,finTodayExpend,finDate);
	SET state='addFinancial_reportSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportDel`(IN id smallint, OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='deluserinit';
     SET id_exist=(SELECT fin_id FROM `financial_report` WHERE id=fin_id);
	IF  id_exist IS NULL THEN
	    SET state='delFinancial_reportFailed';
	ELSE
	    DELETE FROM `financial_report` 
	    WHERE id=fin_id;
	    SET state='delFiancial_reportSuccess';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportSelect`(IN finDate Date, OUT state VARCHAR(30))
BEGIN
SET state='selectInit';
	IF finDate IS NULL THEN
		SELECT * FROM `financial_report` ORDER BY fin_id ASC;
		SET state='selectAllFinancial_report';
	ELSE
		SELECT * FROM `financial_report` WHERE finDate=fin_date;
		SET state='selectOneFinancial_report';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportUpdate`(IN id smallint, IN income smallint,
in expend smallint,IN finDate date,OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateFinancial_reportInit';
     SET id_exist=(SELECT fin_id FROM `financial_report` WHERE id=fin_id);
	IF  id_exist IS NULL THEN
	    SET state='updateFinancial_reportRFailed';
	ELSE
	   IF income IS NOT NULL THEN
		UPDATE `financial_report` SET fin_today_income=income WHERE id=fin_id;
	   END IF;
	   IF expend IS NOT NULL THEN
		UPDATE `financial_report` SET fin_today_expend=expend WHERE id=fin_id;
	   END IF;
	   IF finDate IS NOT NULL THEN
		UPDATE `financial_report` SET fin_date=finDate WHERE id=fin_id;
	   END IF;
	  
	   SET state='updateFinancial_reportSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_guestAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_guestAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guestAdd`(IN guestName VARCHAR(30), IN guestPhone VARCHAR(30),
IN guestPassword varchar(30), IN guestDocumentnum VARCHAR(30), IN guestGender VARCHAR(10), IN guestLastvisit TINYINT, IN guestLastip varchar(23), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='addguestinit';
     SET id_exist=(SELECT guest_document_num FROM `guest` WHERE guestDocumentnum=guest_document_num);
     IF  id_exist IS NOT NULL THEN
	SET state='addGuestFailed';
     ELSE
	INSERT INTO `guest` VALUES(NULL,guestName,guestPhone,guestPassword,guestDocumentnum,guestGender,guestLastvisit,
	guestLastip);
	SET state='addGuestSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_guestDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_guestDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guestDel`(IN id smallint, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='delguestinit';
     SET id_exist=(SELECT guest_id FROM `guest` WHERE id=guest_id);
	IF  id_exist IS NULL THEN
	    SET state='delGuestFailed';
	ELSE
	    DELETE FROM `guest` 
	    WHERE id=guest_id;
	    SET state='delGuestSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_guestSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_guestSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guestSelect`(IN guestName VARCHAR(30), OUT state VARCHAR(30))
BEGIN
	SET state='selectInit';
	IF guestName IS NULL THEN
		SELECT * FROM `guest` ORDER BY guest_id ASC;
		SET state='selectAllGuest';
	ELSE
		SELECT * FROM `guest` WHERE guestName=guest_name;
		SET state='selectOneGuest';
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_guestUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_guestUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_guestUpdate`(IN guestName VARCHAR(30), IN guestPhone VARCHAR(30),
IN guestPassword varchar(30), IN guestDocumentnum VARCHAR(30), IN  guestGender VARCHAR(10), IN guestLastvisit TINYINT, 
IN guestLastip VARCHAR(23), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateGuestInit';
     SET id_exist=(SELECT guest_id FROM `guest` WHERE guestName=guest_name);
	IF  id_exist IS NULL THEN
	    SET state='updateGuestFailed';
	ELSE
	   IF guestPhone IS NOT NULL THEN
		UPDATE `guest` SET guest_phone=guestPhone WHERE guestName=guest_name;
	   END IF;
	   IF guestPassword IS NOT NULL THEN
		UPDATE `guest` SET guest_password=guestPassword WHERE guestName=guest_name;
	   END IF;
	   IF guestDocumentnum IS NOT NULL THEN
		UPDATE `guest` SET guest_document_num=guestDocumentnum WHERE guestName=guest_name;
	   END IF;
	   IF guestGender IS NOT NULL THEN
		UPDATE `guest` SET guest_gender=guestGender WHERE guestName=guest_name;
	   END IF;
	   IF guestLastvisit IS NOT NULL THEN
		UPDATE `guest` SET guest_last_visit=guestLastvisit WHERE guestName=guest_name;
	   END IF;
	   IF guestLastip IS NOT NULL THEN
		UPDATE `guest` SET guest_last_ip=guestLastip WHERE guestName=guest_name;
	   END IF;
	  
	   SET state='updateGuestSuccess';
	END IF;
END */$$
DELIMITER ;

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
	    ElseIf au='test' then
		set state='test';
	    else
	        set state='loginUnknowAu';
	    end if;
	    UPDATE `user` SET last_visit=NOW() WHERE inputname=user_name;
	END IF;
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_register` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_register` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_register`(IN rname VARCHAR(30),IN pw1 VARCHAR(32),in pw2 varchar(32),
OUT state varchar(20))
BEGIN
    DECLARE name_exist VARCHAR(30);
    DECLARE pw VARCHAR(32);
    SET state='registerInit';
    SET name_exist=(SELECT user_name FROM `user` WHERE rname=user_name);
    IF  name_exist IS not NULL THEN
	SET state='nameExist';
    ELSE
	if pw1!=pw2 then
		set state='differentPw';
	else
		set state='registerSuccess';
		INSERT INTO `user` VALUES(NULL,rname,pw1,0,'guest',null,null);
	END IF;
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_roomAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_roomAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_roomAdd`(IN roomNum VARCHAR(10), IN roomType VARCHAR(30),
IN roomArea TINYINT, IN roomMaxnum TINYINT, IN roomPrice SMALLINT, IN roomAircondition TINYINT, IN roomTV TINYINT,
IN roomWIFI TINYINT, roomWashroom TINYINT, IN roomIsStay TINYINT, OUT state VARCHAR(30))
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

/* Procedure structure for procedure `proc_room_reviewAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_reviewAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_room_reviewAdd`(IN reviewroomNum VARCHAR(10), IN reviewGuestid smallint,
IN reviewScore TINYINT, IN reviewComment TINYINT, IN reviewPhoto varchar(50), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='addroomreviewinit';
     SET id_exist=(SELECT review_room_num FROM `room_review` WHERE reviewroomNum=review_room_num);
     IF  id_exist IS NOT NULL THEN
	SET state='addRoomreviewFailed';
     ELSE
	INSERT INTO `room_review` VALUES(NULL,reviewroomNum,reviewGuestid,reviewScore,reviewComment,reviewPhoto);
	SET state='addRoomreviewSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_reviewDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_reviewDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_room_reviewDel`(IN reviewroomNum VARCHAR(10), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='delroomreviewinit';
     SET id_exist=(SELECT review_id FROM `room_review` WHERE reviewroomNum=review_room_num);
	IF  id_exist IS NULL THEN
	    SET state='delRoomreviewFailed';
	ELSE
	    DELETE FROM `room_review` 
	    WHERE reviewroomNum=review_room_num;
	    SET state='delRoomreviewSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_reviewSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_reviewSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_room_reviewSelect`(IN reviewroomNum VARCHAR(10), OUT state VARCHAR(30))
BEGIN
	SET state='selectInit';
	IF reviewroomNum IS NULL THEN
		SELECT * FROM `room_review` ORDER BY review_id ASC;
		SET state='selectAllRoomreview';
	ELSE
		SELECT * FROM `room_review` WHERE review_room_num=reviewroomNum;
		SET state='selectOneRoomreview';
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_reviewUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_reviewUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_room_reviewUpdate`(IN reviewroomNum VARCHAR(10), IN reviewGuestid smallint,
IN reviewScore TINYINT, IN reviewComment TINYINT, IN reviewPhoto varchar(50),  OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateRoomreviewInit';
     SET id_exist=(SELECT review_id FROM `room_review` WHERE reviewroomNum=review_room_num);
	IF  id_exist IS NULL THEN
	    SET state='updateRoomreviewFailed';
	ELSE
	   IF reviewGuestid IS NOT NULL THEN
		UPDATE `room_review` SET review_guest_id=reviewGuestid WHERE reviewroomNum=review_room_num;
	   END IF;
	   IF reviewScore IS NOT NULL THEN
		UPDATE `room_review` SET review_score=reviewScore WHERE reviewroomNum=review_room_num;
	   END IF;
	   IF reviewComment IS NOT NULL THEN
		UPDATE `room_review` SET review_comment=reviewComment WHERE reviewroomNum=review_room_num;
	   END IF;
	   IF reviewPhoto IS NOT NULL THEN
		UPDATE `room_review` SET review_photo=reviewPhoto WHERE reviewroomNum=review_room_num;
	   
	  
	   END IF;
	   SET state='updateRoomreviewSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_viewDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_viewDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_room_viewDel`()
BEGIN
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userAdd`(IN userName VARCHAR(30), IN userPassword VARCHAR(32),
IN userCredits int, IN userAuthority varchar(20), IN userLastVisit datetime, IN userLastIp varchar(23), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist VARCHAR(10);
     SET state='adduserinit';
     SET id_exist=(SELECT user_name FROM `user` WHERE userName=user_name);
     IF  id_exist IS NOT NULL THEN
	SET state='addUserFailed';
     ELSE
	INSERT INTO `user` VALUES(NULL,userName,userPassword,userCredits,userAuthority,userLastVisit,userLastIp);
	SET state='addUserSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_userDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_userDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userDel`(IN id smallint, OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='deluserinit';
     SET id_exist=(SELECT user_id FROM `user` WHERE id=user_id);
	IF  id_exist IS NULL THEN
	    SET state='delUserFailed';
	ELSE
	    DELETE FROM `user` 
	    WHERE id=user_id;
	    SET state='delUserSuccess';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_userSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_userSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userSelect`(IN userName VARCHAR(30), OUT state VARCHAR(30))
BEGIN
SET state='selectInit';
	IF userName IS NULL THEN
		SELECT * FROM `user` ORDER BY user_name ASC;
		SET state='selectAllUser';
	ELSE
		SELECT * FROM `user` WHERE user_name=userName;
		SET state='selectOneUser';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_userUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_userUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userUpdate`(IN userName VARCHAR(30), IN userPassword VARCHAR(32),
IN userCredits int, IN userAuthority varchar(20), IN userLast_visit datetime, IN userLast_ip varchar(32), OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateUserInit';
     SET id_exist=(SELECT user_id FROM `user` WHERE userName=user_name);
	IF  id_exist IS NULL THEN
	    SET state='updateUserFailed';
	ELSE
	   IF userPassword IS NOT NULL THEN
		UPDATE `user` SET PASSWORD=userPassword WHERE userName=user_name;
	   END IF;
	   IF userCredits IS NOT NULL THEN
		UPDATE `user` SET credits=userCredits WHERE userName=user_name;
	   END IF;
	   IF userAuthority IS NOT NULL THEN
		UPDATE `user` SET authority=userAuthority WHERE userName=user_name;
	   END IF;
	   IF userLast_visit IS NOT NULL THEN
		UPDATE `user` SET last_visit=userLast_visit WHERE userName=user_name;
	   END IF;
	   IF userLast_ip IS NOT NULL THEN
		UPDATE `user` SET last_ip=userLast_ip WHERE userName=user_name;
	   END IF;
	   
	   SET state='updateUserSuccess';
	END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
