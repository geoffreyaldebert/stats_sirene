datafolder="$(dirname "$(pwd)")"/utils/
echo "CREATE TABLE CLASSEEFFECTIF"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "DROP TABLE IF EXISTS classeeffectif;"
echo "DROP TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -f "../sql/create_table_classe_effectif.sql"
echo "CREATE TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "\copy classeeffectif(denomination, libelle, libelle_long,color) FROM '"$datafolder"classeeffectif.csv' delimiter ',' csv header encoding 'UTF8';"

