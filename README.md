# Stats Sirene

Premiers essai pour la réalisation d'un tableau de bord SIRENE basé sur Metabase.

```
mkdir -p tmp/db
docker-compose -f docker-compose.yml up --build -d
# Download monthly batch for sirene in a specific folder
cd db && ./build.sh
```

First demo : http://metabase.dataeng.etalab.studio/public/dashboard/55c2761b-45ba-4280-bb52-f3e9bd7837d6

