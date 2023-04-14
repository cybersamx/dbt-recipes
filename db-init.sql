-- Create schema.
CREATE SCHEMA IF NOT EXISTS dbt_recipes;

ALTER SCHEMA dbt_recipes OWNER TO postgres;

-- HR: companies.
CREATE TABLE IF NOT EXISTS dbt_recipes.companies
(
    id      INT PRIMARY KEY,
    country VARCHAR(8),
    name    VARCHAR(64)
);

ALTER TABLE dbt_recipes.companies OWNER TO postgres;

INSERT INTO dbt_recipes.companies (id, country, name) VALUES (1, 'us', 'Acme Inc');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (2, 'us', 'Fey LLC');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (3, 'uk', 'Snatch Ltd');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (4, 'cn', 'Ming Enterprises');

-- E-Commerce: customers.
CREATE TABLE IF NOT EXISTS dbt_recipes.customers
(
    id      INT PRIMARY KEY,
    name    VARCHAR(64),
    address VARCHAR(128),
    zip     VARCHAR(5),
    email   VARCHAR(128) UNIQUE
);

ALTER TABLE dbt_recipes.customers OWNER TO postgres;

INSERT INTO dbt_recipes.customers (id, name, address, zip, email)
VALUES (1, 'Martin Dole', '458 Joy Valley Rd', '40506', 'martin@example.com');
INSERT INTO dbt_recipes.customers (id, name, address, zip, email)
VALUES (2, 'Sanjay Patel', '101 Main St', '02138', 'spatel@example.com');
INSERT INTO dbt_recipes.customers (id, name, address, zip, email)
VALUES (3, 'Ming Lee', '10 Olympic Blvd', '90506', 'lee@example.com');

-- E-Commerce: products.
CREATE TABLE IF NOT EXISTS dbt_recipes.products
(
    id    INT PRIMARY KEY,
    name  VARCHAR(64),
    price NUMERIC(9, 2)
);

ALTER TABLE dbt_recipes.products OWNER TO postgres;

INSERT INTO dbt_recipes.products (id, name, price) VALUES (1, 'Nintendo Switch', 299.00);
INSERT INTO dbt_recipes.products (id, name, price) VALUES (2, 'Air Jordan shoe', 234.92);
INSERT INTO dbt_recipes.products (id, name, price) VALUES (3, 'Northface jacket', 150.0);
INSERT INTO dbt_recipes.products (id, name, price) VALUES (4, 'Designing Data-Intensive Applications book', 19.90);

-- E-Commerce: orders.
CREATE TABLE IF NOT EXISTS dbt_recipes.orders
(
    id          INT,
    customer_id INT,
    product_id  INT,
    qty         INT,
    ordered_at  TIMESTAMP
);

ALTER TABLE dbt_recipes.orders OWNER TO postgres;

INSERT INTO dbt_recipes.orders (id, customer_id, product_id, qty, ordered_at)
VALUES (1, 1, 2, 1, TIMESTAMP '2022-12-20 00:45:13');
INSERT INTO dbt_recipes.orders (id, customer_id, product_id, qty, ordered_at)
VALUES (1, 1, 3, 2, TIMESTAMP '2022-12-20 00:45:13');
INSERT INTO dbt_recipes.orders (id, customer_id, product_id, qty, ordered_at)
VALUES (1, 2, 3, 1, TIMESTAMP '2023-01-20 09:33:45');

