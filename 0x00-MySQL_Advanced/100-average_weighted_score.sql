/* SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.*/

-- create stored program
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id)
BEGIN
	SELECT SUM(users.average_score * projects.weight) / SUM(users.average_score) WHERE users.id = user_id
END//
DELIMITER ;
