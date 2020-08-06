#!/bin/bash

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_codecommune ON statsglobales (codeCommuneEtablissement);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_stock ON statsglobales (stock);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_ape ON statsglobales (activitePrincipaleEtablissement);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_tee ON statsglobales (trancheEffectifsEtablissement);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_cc ON statsglobales (code_classe);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_cg ON statsglobales (code_groupe);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_cd ON statsglobales (code_division);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_cs ON statsglobales (code_section);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_reg ON statsglobales (reg);"

psql -h localhost -p 5434 -U sirene stats_sirene -c "CREATE INDEX sirene_dep ON statsglobales (dep);"

