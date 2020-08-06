psql -h localhost -p 5434 -U sirene -d stats_sirene -f "./create_table_stats_global.sql"
python gen_stats.py
./insert_stats_db.sh
./create_index_db.sh
