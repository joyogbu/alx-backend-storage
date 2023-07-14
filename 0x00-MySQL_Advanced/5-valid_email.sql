/* SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed. */

-- create a trigger
DELIMITER $$
CREATE TRIGGER check_email AFTER UPDATE ON users
BEGIN
	IF OLD.email != NEW.email
	       IF OLD.email == 0 THEN SET valid_email = 1
		END IF
	END IF
END$$
