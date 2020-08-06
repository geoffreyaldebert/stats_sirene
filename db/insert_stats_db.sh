#!/bin/bash
for m in {01..12};
do
echo $m
export PGPASSWORD=password && psql -h localhost -p 5434 -U sirene stats_sirene -c "\copy statsglobales(stock,codeCommuneEtablissement,activitePrincipaleEtablissement,trancheEffectifsEtablissement,siret,nb_actif,nb_ferme,new_etab,new_ferme,code_classe, code_groupe,code_division,code_section,reg,dep) FROM '/home/debian/datalake/sirene/2019-"$m"/stats_etab2.csv' delimiter ',' csv header encoding 'UTF8';"
done
for m in {01..08};
do
echo $m
export PGPASSWORD=password && psql -h localhost -p 5434 -U sirene stats_sirene -c "\copy statsglobales(stock,codeCommuneEtablissement,activitePrincipaleEtablissement,trancheEffectifsEtablissement,siret,nb_actif,nb_ferme,new_etab,new_ferme,code_classe, code_groupe,code_division,code_section,reg,dep) FROM '/home/debian/datalake/sirene/2020-"$m"/stats_etab2.csv' delimiter ',' csv header encoding 'UTF8';"
done
