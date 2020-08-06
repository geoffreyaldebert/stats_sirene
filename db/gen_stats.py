import pandas as pd
from datetime import datetime

actualmonth = datetime.today().strftime('%Y-%m')

list_all_months = pd.date_range('2018-12-01',actualmonth+'-01', freq='MS').strftime("%Y-%m").tolist()

dfnaf = pd.read_csv("/home/debian/projects/postgres-playground/db/utils/naf_complet_color.csv",dtype=str)
dfnaf = dfnaf[['code_sous_classe','code_classe','code_groupe','code_division','code_section']]
dfnaf = dfnaf.rename(columns={'code_sous_classe':'activitePrincipaleEtablissement'})
dfnaf = dfnaf.drop_duplicates()

dfcom = pd.read_csv("/home/debian/projects/postgres-playground/db/utils/communes-2019.csv",dtype=str)
dfcom = dfcom[['com','reg','dep']]
dfcom = dfcom.rename(columns={'com':'codeCommuneEtablissement'})
dfcom = dfcom.drop_duplicates(subset={'codeCommuneEtablissement'})
i = 0
l = ''
for m in list_all_months:
    if(i != 0):
      print(m)
      df = pd.read_csv("/home/debian/datalake/sirene/"+m+"/StockEtablissement_utf8_geo.csv.gz",compression="gzip",dtype=str)
      df['stock'] = l
      df['dateCreationEtablissement'] = pd.to_datetime(df['dateCreationEtablissement'], format='%Y-%m-%d', errors="coerce")
      df['new_etab'] = df['dateCreationEtablissement'].apply(lambda x: 0 if x != x else 0 if x < datetime.strptime(l, '%Y-%m') else 0 if x == datetime.strptime(m, '%Y-%m') else 1)
      df['dateDebut'] = pd.to_datetime(df['dateDebut'], format='%Y-%m-%d', errors="coerce")
      df['new_ferme'] = 0
      df.loc[((df['etatAdministratifEtablissement'] == 'F') & (df['dateDebut'] >= datetime.strptime(l, '%Y-%m')) & (df['dateDebut'] < datetime.strptime(m, '%Y-%m'))), 'new_ferme'] = 1
      df['nb_actif'] = df['etatAdministratifEtablissement'].apply(lambda x: 1 if x == 'A' else 0)
      df['nb_ferme'] = df['etatAdministratifEtablissement'].apply(lambda x: 1 if x == 'F' else 0)
      df = df[['stock',
            'codeCommuneEtablissement',
            'activitePrincipaleEtablissement',
            'trancheEffectifsEtablissement',
            'siret',
            'nb_actif',
            'nb_ferme',
            'new_etab',
            'new_ferme']]\
      .fillna("non_connu")\
      .groupby(['stock',
                  'codeCommuneEtablissement',
                  'activitePrincipaleEtablissement',
                  'trancheEffectifsEtablissement'],as_index=False)\
      .agg({'siret' : 'count',
            'nb_actif' : 'sum',
            'nb_ferme' : 'sum',
            'new_etab' : 'sum',
            'new_ferme' : 'sum'})

      df['trancheEffectifsEtablissement'] = df['trancheEffectifsEtablissement'].apply(lambda x: None if x == 'non_connu' else x)
      df['codeCommuneEtablissement'] = df['codeCommuneEtablissement'].apply(lambda x: None if x == 'non_connu' else x)
      df = pd.merge(df,dfnaf,on='activitePrincipaleEtablissement',how='left')
      df = pd.merge(df,dfcom,on='codeCommuneEtablissement',how='left')
      df.to_csv("/home/debian/datalake/sirene/"+m+"/stats_etab2.csv",index=False)
      del df
      i = i + 1
      l = m
    i = i + 1
    l = m
