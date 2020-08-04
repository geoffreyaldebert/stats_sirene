#!/bin/bash
psql -h localhost -p 5434 -U sirene stats_sirene -c "\copy statsglobales(stock,codeCommuneEtablissement,activitePrincipaleEtablissement,nomenclatureActivitePrincipaleEtablissement,trancheEffectifsEtablissement,caractereEmployeurEtablissement,siret,nb_actif,nb_ferme) FROM '/home/debian/datalake/sirene/2019-07/stats_etablissements.csv' delimiter ',' csv header encoding 'UTF8';"

