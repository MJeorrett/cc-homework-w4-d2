DROP TABLE IF EXISTS shoes;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL4 primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE orders (
  id SERIAL4 primary key,
  customer_id INT4 REFERENCES customers(id)
);

CREATE TABLE shoes (
  id SERIAL4 primary key,
  brand VARCHAR(100),
  size INT2,
  price DECIMAL(8, 2),
  order_id INT4 REFERENCES orders(id)
);


INSERT INTO customers(first_name, last_name) VALUES ('Matthew', 'Jeorrett')
INSERT INTO customers(first_name, last_name) VALUES ('Catriona', 'Jeorrett')
INSERT INTO customers(first_name, last_name) VALUES ('David', 'Oleary')
INSERT INTO customers(first_name, last_name) VALUES ('Martin', 'Harkins')
