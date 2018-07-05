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

/* Procedure structure for procedure `proc_select` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_select` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_select`(In choice Varchar(20),out state varchar(30))
BEGIN
	set state='selectInit';
	case choice
		when 'room' then
			SELECT * FROM `room` ORDER BY room_id ASC;
		SET state='selectRoomSuccess';
	else 
		set state='selectUnknowError';
	end case;
	
end */$$
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
