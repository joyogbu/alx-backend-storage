/* script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. */

-- Create a stored program
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
	DECLARE no_record INT;
	SELECT COUNT(*) INTO no_record FROM corrections WHERE user_id = user_id;
	SELECT SUM(score) / no_record FROM corrections WHERE user_id = user_id;
END$$
DELIMITER ;
