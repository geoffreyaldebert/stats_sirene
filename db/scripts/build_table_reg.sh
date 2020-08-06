
echo "CREATE TABLE REGION"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "DROP TABLE IF EXISTS region;"
echo "DROP TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -f "../sql/create_table_region.sql"
echo "CREATE TABLE OK"
datafolder="$(dirname "$(pwd)")"/utils/
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "\copy region(reg, cheflieu, tncc, ncc, nccenr, libelle) FROM '"$datafolder"region2019.csv' delimiter ',' csv header encoding 'UTF8';"
