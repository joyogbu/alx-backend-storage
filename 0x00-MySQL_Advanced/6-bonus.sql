/* SQL script that creates a stored procedure AddBonus that adds a new correction for a student. */

-- CREATE a stored procedure
DELIMITER $$
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(50), IN score INT)
BEGIN
	DECLARE my_prod_id INT;
	SELECT id INTO my_prod_id FROM projects WHERE name = project_name;
	IF @my_prod_id = NULL THEN
		INSERT INTO projects(name) VALUES(project_name);
		SET my_prod_id = NEW.id;
	END IF;
	INSERT INTO corrections(user_id, project_id, score) VALUES(user_id, proj_id, score);
END$$
