-- Create schema that matches the specified used in dbt projects.
CREATE SCHEMA IF NOT EXISTS dbt_recipes;

ALTER SCHEMA dbt_recipes OWNER TO postgres;

-- Create the companies table that is used in some modeling examples.
CREATE TABLE IF NOT EXISTS dbt_recipes.companies
(
    id      INT,
    country VARCHAR(8),
    name    VARCHAR(64),
    PRIMARY KEY (id)
);

ALTER TABLE dbt_recipes.companies OWNER TO postgres;

INSERT INTO dbt_recipes.companies (id, country, name) VALUES (1, 'us', 'Acme Inc');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (2, 'us', 'Fey LLC');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (3, 'uk', 'Snatch Ltd');
INSERT INTO dbt_recipes.companies (id, country, name) VALUES (4, 'cn', 'Ming Enterprises');
