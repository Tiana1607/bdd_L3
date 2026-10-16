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