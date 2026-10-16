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