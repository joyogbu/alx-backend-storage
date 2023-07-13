/* SQL script that creates a trigger that decreases the quantity of an item after adding a new order. */

-- create a trigger
CREATE TRIGGER reduce_quantity AFTER INSERT ON orders FOR EACH ROW UPDATE items SET quantity = quantity - NEW.quantity WHERE name = NEW.name
