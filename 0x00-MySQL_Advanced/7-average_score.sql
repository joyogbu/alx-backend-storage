/* script that creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student. */

-- Create a stored program
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN userid INT)
BEGIN
	-- DECLARE no_record INT;
	-- SELECT COUNT(*) INTO no_record FROM corrections WHERE user_id = user_id;
	UPDATE users SET average_score = (SELECT AVG(score) FROM corrections WHERE user_id = userid) WHERE id = userid;
END $$
DELIMITER ;
