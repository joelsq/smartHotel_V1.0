DELIMITER $$

USE `hotel`$$

DROP PROCEDURE IF EXISTS `proc_checklistAdd`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_checklistAdd`(IN checkGuestId SMALLINT,IN checkRoomId SMALLINT,IN checkInDate DATETIME, IN checkDays SMALLINT,
IN checkOutDate DATETIME, IN checkMealType VARCHAR(30), IN checkNumOfPeople TINYINT, IN checkRoomConsume TINYINT,IN checkTotalConsume TINYINT, OUT state VARCHAR(30))
BEGIN
     DECLARE id_exist SMALLINT;
     DECLARE g SMALLINT;
     SET state='addchecklistinit';
     SET id_exist=(SELECT checkInDate FROM `checklist` WHERE checkInDate=check_in_date);
     IF  id_exist IS NOT NULL THEN
	SET state='addChecklistFailed';
     ELSE
	INSERT INTO `checklist` VALUES(NULL,checkGuestId,checkRoomId,checkInDate,checkDays,checkOutDate,checkMealType,checkNumOfPeople,checkRoomConsume,checkTotalConsume);
	SET g=(SELECT guest_id FROM `guest` WHERE checkGuestId=guest_id);
	IF g IS NULL THEN
		INSERT INTO `guest` VALUES(checkGuestId,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
	END IF;
	SET state='addChecklistSuccess';
     END IF;
END$$

DELIMITER ;