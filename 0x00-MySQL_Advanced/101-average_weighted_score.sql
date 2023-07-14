/* SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.*/

-- create stored program
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser()
BEGIN
	DECLARE count_user INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	SET count_user = SELECT COUNT(*) AS total FROM users;
	SET i = 0;
	WHILE i < count_user DO
		UPDATE users SET average_score = (SELECT SUM(score * weight) / SUM(weight) FROM corrections JOIN projects ON corrections.project_id = projects.id);
		SET i = i + 1;
	END WHILE;
END//
DELIMITER ;
