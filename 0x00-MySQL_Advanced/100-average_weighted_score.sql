/* SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.*/

-- create stored program
-- DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
SELECT SUM(score * weight) / SUM(weight) AS avaerage FROM corrections WHERE user_id = user_id
--DELIMITER ;
