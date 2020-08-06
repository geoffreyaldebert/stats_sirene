datafolder="$(dirname "$(pwd)")"/utils/
echo "CREATE TABLE categoriejuridique"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "DROP TABLE IF EXISTS categoriejuridique;"
echo "DROP TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -f "../sql/create_table_categoriejuridique.sql"
echo "CREATE TABLE OK"
psql -h localhost -p 5434 -U sirene -d stats_sirene -c "\copy categoriejuridique(code,libelle,color) FROM '"$datafolder"cat_juridique.csv' delimiter ',' csv header encoding 'UTF8';"

