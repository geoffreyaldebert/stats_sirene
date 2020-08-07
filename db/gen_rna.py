import pandas as pd

from os import listdir
filenames = listdir("/home/debian/datalake/sirene/2020-08/rna/")

globdf = pd.DataFrame(columns=['id', 'id_ex', 'siret', 'rup_mi', 'gestion', 'date_creat', 'date_decla',
       'date_publi', 'date_disso', 'nature', 'groupement', 'titre',
       'titre_court', 'objet', 'objet_social1', 'objet_social2',
       'adrs_complement', 'adrs_numvoie', 'adrs_repetition', 'adrs_typevoie',
       'adrs_libvoie', 'adrs_distrib', 'adrs_codeinsee', 'adrs_codepostal',
       'adrs_libcommune', 'adrg_declarant', 'adrg_complemid',
       'adrg_complemgeo', 'adrg_libvoie', 'adrg_distrib', 'adrg_codepostal',
       'adrg_achemine', 'adrg_pays', 'dir_civilite', 'siteweb', 'publiweb',
       'observation', 'position', 'maj_time', 'mois_crea', 'mois_ferm',
       'objet_social_parent_id', 'objet_social_lib', 'objet_social_parent_lib',
       'reg', 'dep'])

dfnom = pd.read_csv("/home/debian/projects/postgres-playground/db/utils/rna_nomenclature_objet_social.csv",dtype=str)
dfnom2 = dfnom[dfnom['objet_social_parent_id'] == dfnom['objet_social_id']]
dfnom2 = dfnom2.rename(columns={'objet_social_lib':'objet_social_parent_lib'})
dfnom2 = dfnom2.drop(columns=['objet_social_id'])
dfnom = dfnom[dfnom['objet_social_parent_id'] != dfnom['objet_social_id']]
dfnom = pd.merge(dfnom,dfnom2,on='objet_social_parent_id',how='left')
dfnom = dfnom.rename(columns={'objet_social_id':'objet_social1'})
dfnom =dfnom.drop_duplicates(subset={"objet_social1"})


dfcom = pd.read_csv("/home/debian/projects/postgres-playground/db/utils/communes-2019.csv",dtype=str)
dfcom = dfcom[['com','reg','dep']]
dfcom = dfcom.rename(columns={'com':'adrs_codeinsee'})
dfcom = dfcom.drop_duplicates(subset={'adrs_codeinsee'})

for filename in filenames:
    print(filename)
    df = pd.read_csv("/home/debian/datalake/sirene/2020-08/rna/rna_waldec_20200801_dpt_75.csv",sep=";",encoding="Latin-1",dtype=str)
    df['mois_crea'] = df['date_creat'].apply(lambda x: str(x)[:7])
    df['mois_ferm'] = df['date_disso'].apply(lambda x: str(x)[:7])
    df['mois_ferm'] = df['mois_ferm'].apply(lambda x: None if x == '0001-01' else x)
    df = pd.merge(df,dfnom,on='objet_social1',how='left')
    df = pd.merge(df,dfcom,on='adrs_codeinsee',how='left')
    globdf = globdf.append(df)

globdf.to_csv("/home/debian/datalake/sirene/2020-08/global_rna.csv",index=False)
