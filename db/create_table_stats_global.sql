CREATE TABLE statsglobales
(
    id_statsglobales SERIAL PRIMARY KEY NOT NULL,
    stock CHARACTER VARYING,
    codeCommuneEtablissement CHARACTER VARYING,
    activitePrincipaleEtablissement CHARACTER VARYING,
    trancheEffectifsEtablissement CHARACTER VARYING,
    siret DECIMAL(15,2),
    nb_actif DECIMAL(15,2),
    nb_ferme DECIMAL(15,2),
    new_etab DECIMAL(15,2),
    new_ferme DECIMAL(15,2),
    code_classe CHARACTER VARYING,
    code_groupe CHARACTER VARYING,
    code_division CHARACTER VARYING,
    code_section CHARACTER VARYING,
    reg CHARACTER VARYING,
    dep CHARACTER VARYING
)
TABLESPACE pg_default;
