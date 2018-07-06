DELIMITER $$

USE `hotel`$$

DROP PROCEDURE IF EXISTS `proc_login_au`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_login_au`(IN inputname VARCHAR(30),IN inputpw VARCHAR(30),OUT state VARCHAR(30))
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
	    SET au=(SELECT authority FROM `user` WHERE inputname=user_name);
	    IF au='manager' THEN
		SET state='loginManager';
	    ELSEIF au='user' THEN
		SET state='loginUser';
	    ELSEIF au='guest' THEN
		SET state='loginGuest';
	    ELSEIF au='test' THEN
		SET state='test';
	    ELSE
	        SET state='loginUnknowAu';
	    END IF;
	    UPDATE `user` SET last_visit=NOW() WHERE inputname=user_name;
	END IF;
    END IF;
    END$$

DELIMITER ;