
echo "CREATE TABLE DEPARTEMENT"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "DROP TABLE IF EXISTS departement;"
echo "DROP TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -f "../sql/create_table_departement.sql"
echo "CREATE TABLE OK"
datafolder="$(dirname "$(pwd)")"/utils/
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "\copy departement(dep, reg, cheflieu, tncc, ncc, nccenr, libelle) FROM '"$datafolder"departement2019.csv' delimiter ',' csv header encoding 'UTF8';"
