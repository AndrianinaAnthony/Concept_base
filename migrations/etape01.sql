CREATE DATABASE gargote;
\c gargote;

CREATE TABLE plats(
    id_plat SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    categorie VARCHAR(255),
    prix INT
);

INSERT INTO plats(nom, categorie, prix) VALUES
('Romazava', 'Plat malagasy', 7000),
('Ravitoto sy henakisoa', 'Plat malagasy', 8000),
('Akoho sy voanjo', 'Plat malagasy', 8500),
('Mi sao', 'Plat chinois', 6000),
('Soupe chinoise', 'Soupe', 5000),
('Mofo gasy', 'Dessert et goute', 1000),
('Ranon apango', 'Boisson', 500);

--J'ai choisis INT pour le prix, et j'ai choisi l'idPlat comme identifiant