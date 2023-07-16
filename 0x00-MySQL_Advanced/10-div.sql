/* script  that divides (and returns) the first by the second number or returns 0 if the second number is equal to 0.*/

-- create a function
CREATE FUNCTION SafeDiv (@a INT @b INT)
RETURNS FLOAT AS
BEGIN
	DECLARE @result FLOAT
	If (@b = 0)
		RETURN 0
	SELECT @result = a / b FROM numbers
	RETURN @result
END
