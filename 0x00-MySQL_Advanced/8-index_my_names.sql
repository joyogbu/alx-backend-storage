/* : 0.0%)
Write a SQL script that creates an index idx_name_first on the table names and the first letter of name */

-- create an index
CREATE INDEX idx_name_first ON names (name(1));
