/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.21-log : Database - hotel
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

/* Procedure structure for procedure `proc_checklistAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistAdd`(in checkGuestId smallint,in checkRoomId smallint,IN checkInDate datetime, IN checkDays smallint,
IN checkOutDate datetime, IN checkMealType VARCHAR(30), IN checkNumOfPeople tinyint, IN checkRoomConsume TINYINT,IN checkTotalConsume TINYINT, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='addchecklistinit';
     SET id_exist=(SELECT checkInDate FROM `checklist` WHERE checkInDate=check_in_date);
     IF  id_exist IS NOT NULL THEN
	SET state='addChecklistFailed';
     ELSE
	INSERT INTO `checklist` VALUES(NULL,checkGuestId,checkRoomId,checkInDate,checkDays,checkOutDate,checkMealType,checkNumOfPeople,checkRoomConsume,checkTotalConsume);
	SET state='addChecklistSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_checklistDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_checklistDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistDel`(IN checkRoomId smallint, OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='delchecklistinit';
     SET id_exist=(SELECT checklist_id FROM `checklist` WHERE checkRoomId=check_room_id);
	IF  id_exist IS NULL THEN
	    SET state='delChecklistFailed';
	ELSE
	    DELETE FROM `checklist` 
	    WHERE checkRoomId=check_room_id;
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
		SELECT * FROM `checklist` ORDER BY check_guest_id ASC;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistUpdate`(IN checkGuestId SMALLINT,IN checkRoomId SMALLINT,IN checkInDate datetime, IN checkDays smallint,
IN checkOutDate datetime, IN checkMealType varchar(30), IN checkNumOfPeople tinyint, IN checkRoomConsume TINYINT,IN checkTotalConsume TINYINT, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateChecklistInit';
     SET id_exist=(SELECT checklist_id FROM `checklist` WHERE checkInDate=check_in_date);
	IF  id_exist IS NULL THEN
	    SET state='updateChecklistFailed';
	ELSE
	   IF checkDays IS NOT NULL THEN
		UPDATE `checklist` SET check_days=checkDays WHERE checkInDate=check_in_date;
	   END IF;
	   IF checkOutDate IS NOT NULL THEN
		UPDATE `checklist` SET check_out_date=checkOutDate WHERE checkInDate=check_in_date;
	   END IF;
	   IF checkMealType IS NOT NULL THEN
		UPDATE `checklist` SET check_meal_type=checkMealType WHERE checkInDate=check_in_date;
	   END IF;
	   IF checkNumOfPeople IS NOT NULL THEN
		UPDATE `checklist` SET check_num_of_people=checkNumOfPeople WHERE checkInDate=check_in_date;
	   END IF;
	   IF checkRoomConsume IS NOT NULL THEN
		UPDATE `checklist` SET check_room_consume=checkRoomConsume WHERE checkInDate=check_in_date;
	   END IF;
	   IF checkTotalConsume IS NOT NULL THEN
		UPDATE `checklist` SET check_total_consume_consume=checkTotalConsume WHERE checkInDate=check_in_date;
	   END IF;
	   SET state='updateChecklistSuccess';
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportAdd` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportAdd` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportAdd`(IN finTodayIncome VARCHAR(10), IN finTodayExpend VARCHAR(30),
IN finDate TINYINT, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='addfinancial_reportinit';
     SET id_exist=(SELECT fin_today_income FROM `finacial_report` WHERE finTodayIncome=fin_today_income);
     IF  id_exist IS NOT NULL THEN
	SET state='addFinancial_reportFailed';
     ELSE
	INSERT INTO `finacial_report` VALUES(NULL,finTodayIncome,finTodayExpend,finDate);
	SET state='addFinancial_reportSuccess';
     END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportDel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportDel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportDel`(IN finTodayIncome VARCHAR(10), OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='deluserinit';
     SET id_exist=(SELECT fin_id FROM `financial_report` WHERE finTodayIncome=fin_today_income);
	IF  id_exist IS NULL THEN
	    SET state='delFinancial_reportFailed';
	ELSE
	    DELETE FROM `financial_report` 
	    WHERE finTodayIncome=fin_today_income;
	    SET state='delFiancial_reportSuccess';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportSelect` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportSelect` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportSelect`(IN finTodayIncome VARCHAR(10), OUT state VARCHAR(30))
BEGIN
SET state='selectInit';
	IF finTodayIncome IS NULL THEN
		SELECT * FROM `financial_report` ORDER BY fin_today_income ASC;
		SET state='selectAllFinancial_report';
	ELSE
		SELECT * FROM `financial_report` WHERE fin_today_income=finTodayIncome;
		SET state='selectOneFinancial_report';
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_financial_reportUpdate` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_financial_reportUpdate` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_financial_reportUpdate`(IN finTodayIncome VARCHAR(10), IN finTodayExpend VARCHAR(30),
IN finDate TINYINT,OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     SET state='updateFinancial_reportInit';
     SET id_exist=(SELECT fin_id FROM `financial_report` WHERE finTodayIncome=fin_today_income);
	IF  id_exist IS NULL THEN
	    SET state='updateFinancial_reportRFailed';
	ELSE
	   IF roomType IS NOT NULL THEN
		UPDATE `financial_report` SET fin_today_income=finTodayIncome WHERE finTodayIncome=fin_today_income;
	   END IF;
	   IF roomArea IS NOT NULL THEN
		UPDATE `financial_report` SET fin_today_expend=finTodayExpend WHERE finTodayIncome=fin_today_income;
	   END IF;
	   IF roomMaxnum IS NOT NULL THEN
		UPDATE `financial_report` SET fin_date=finDate WHERE finTodayIncome=fin_today_income;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_userDel`(IN userName VARCHAR(30), OUT state VARCHAR(30))
BEGIN
DECLARE id_exist SMALLINT;
     SET state='deluserinit';
     SET id_exist=(SELECT user_id FROM `user` WHERE userName=user_name);
	IF  id_exist IS NULL THEN
	    SET state='delUserFailed';
	ELSE
	    DELETE FROM `user` 
	    WHERE userName=user_name;
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
