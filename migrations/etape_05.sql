CREATE DATABASE gargotte_rado;
\c gargotte_rado;

CREATE TABLE CATEGORIEPLAT(
    id_categ_plat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_categorie VARCHAR(255) NOT NULL
);

CREATE TABLE PLAT(
    id_plat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_categorie INT,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10,0) NOT NULL,

    FOREIGN KEY (id_categorie) REFERENCES CATEGORIEPLAT(id_categ_plat)
);

INSERT INTO CATEGORIEPLAT(nom_categorie) VALUES
('Plat Malagasy'),
('Plat Chinois'),
('Soupe'),
('Dessert et goûter'),
('Boisson');

INSERT INTO PLAT(nom, id_categorie, prix) VALUES
('Romazava', 1, 7000),
('Ravitoto sy henakisoa', 1, 8000),
('Akoho sy voanio', 1, 8500),
('Mi sao', 2, 6000),
('Soupe chinoise', 3, 5000),
('Mofo gasy (les 4)', 4, 1000),
('Ranon''apango', 5, 500);

ALTER TABLE PLAT ALTER COLUMN id_categorie SET NOT NULL;

CREATE TABLE COMMANDE(
    id_commande INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_commande DATE NOT NULL
);

CREATE TABLE LIGNE_COMMANDE(
    id_ligne_commande INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_commande INT NOT NULL,
    id_plat INT NOT NULL,
    quantite INT NOT NULL,

    FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande),
    FOREIGN KEY (id_plat) REFERENCES PLAT(id_plat)
);

INSERT INTO COMMANDE(date_commande) VALUES
('2026-10-15'),
('2026-10-16');

INSERT INTO LIGNE_COMMANDE(id_commande, id_plat, quantite) VALUES
(1, 2, 2),
(1, 6, 1),
(1, 6, 3),
(2, 5, 2),
(2, 4, 1);

CREATE TABLE CLIENT(
    id_client INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL
);

ALTER TABLE COMMANDE ADD COLUMN id_client INT;
ALTER TABLE COMMANDE ADD CONSTRAINT id_client FOREIGN KEY (id_client) REFERENCES CLIENT(id_client);

INSERT INTO CLIENT(nom_client) VALUES ('Rakoto');

UPDATE COMMANDE SET id_client = 1 WHERE date_commande = '2026-10-15';

CREATE TABLE SALLE(
    id_salle INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_salle VARCHAR(50) NOT NULL
);

CREATE TABLE SALLE_TABLE(
    id_table INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_salle INT NOT NULL,
    numero_table INT NOT NULL,

    FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle)
);

CREATE TABLE SERVEUR(
    id_serveur INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_serveur VARCHAR(100) NOT NULL
);

INSERT INTO SERVEUR(nom_serveur) VALUES 
('Njara Rakoto'), ('Lalao Rasoa');

INSERT INTO SALLE(nom_salle) VALUES ('Salle 1');

INSERT INTO SALLE_TABLE(id_salle, numero_table) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8);

ALTER TABLE COMMANDE ADD COLUMN id_table INT;
ALTER TABLE COMMANDE ADD COLUMN id_serveur INT;
ALTER TABLE COMMANDE ADD CONSTRAINT  id_table FOREIGN KEY (id_table) REFERENCES SALLE_TABLE(id_table);
ALTER TABLE COMMANDE ADD CONSTRAINT  id_serveur FOREIGN KEY (id_serveur) REFERENCES SERVEUR(id_serveur);

UPDATE COMMANDE SET id_table = null, id_serveur = 1, estaemporter = true WHERE id_commande = 1;
UPDATE COMMANDE SET id_table = 31, id_serveur = 2, estaemporter = false WHERE id_commande = 2;

ALTER TABLE COMMANDE ALTER COLUMN id_table SET NOT NULL;
ALTER TABLE COMMANDE ALTER COLUMN id_serveur SET NOT NULL;






