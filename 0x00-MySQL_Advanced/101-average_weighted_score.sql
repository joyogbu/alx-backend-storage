/* SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.*/

-- create stored program
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser()
BEGIN
	DECLARE count_user INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	SELECT COUNT(*) FROM users INTO count_user;
	SET i = 1;
	WHILE i <= count_user DO
		UPDATE users SET average_score = (SELECT SUM(score * weight) / SUM(weight) FROM corrections JOIN projects ON corrections.project_id = projects.id WHERE user_id = i) WHERE id = i;
		SET i = i + 1;
	END WHILE;
END//
DELIMITER ;
