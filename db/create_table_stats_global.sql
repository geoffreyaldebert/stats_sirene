CREATE TABLE statsglobales
(
    id_statsglobales SERIAL PRIMARY KEY NOT NULL,
    stock CHARACTER VARYING,
    codeCommuneEtablissement CHARACTER VARYING,
    activitePrincipaleEtablissement CHARACTER VARYING,
    nomenclatureActivitePrincipaleEtablissement CHARACTER VARYING,
    trancheEffectifsEtablissement CHARACTER VARYING,
    caractereEmployeurEtablissement CHARACTER VARYING,
    siret DECIMAL(15,2),
    nb_actif DECIMAL(15,2),
    nb_ferme DECIMAL(15,2)
)
TABLESPACE pg_default;
