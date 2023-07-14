/* SQL script that creates a trigger that decreases the quantity of an item after adding a new order. */

-- create a trigger
/*DELIMITER $$
CREATE TRIGGER reduce_quantity AFTER INSERT ON orders FOR EACH ROW
BEGIN
	SET @var = NEW.item_name;
	SET @var2 = NEW.number;
	UPDATE items SET quantity = quantity - @var2 WHERE name = New.item_name;
END$$
DELIMITER ;*/
CREATE TRIGGER reduce_quantity AFTER INSERT ON orders FOR EACH ROW UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name
