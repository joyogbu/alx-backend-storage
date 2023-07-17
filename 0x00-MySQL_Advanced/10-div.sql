/* script  that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.*/

-- create a function
DELIMITER $$
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
	DECLARE result FLOAT DEFAULT 0;
	If (b = 0) THEN
		RETURN 0;
	END IF;
	SET result = a / b;
	RETURN result;
END $$
