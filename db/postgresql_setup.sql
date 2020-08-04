CREATE ROLE sirene WITH LOGIN CREATEDB PASSWORD 'password';
CREATE DATABASE stats_sirene WITH OWNER sirene;

\c stats_sirene;
CREATE EXTENSION pg_trgm;
