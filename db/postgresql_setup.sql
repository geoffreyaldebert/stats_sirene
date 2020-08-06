CREATE ROLE metabase WITH LOGIN CREATEDB PASSWORD 'password';
CREATE DATABASE metabase WITH OWNER metabase;

CREATE ROLE sirene WITH LOGIN CREATEDB PASSWORD 'password';
CREATE DATABASE stats_sirene WITH OWNER sirene;

\c stats_sirene;
CREATE EXTENSION pg_trgm;

\c metabase;
CREATE EXTENSION pg_trgm;
