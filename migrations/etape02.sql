ALTER TABLE plats ALTER COLUMN categorie SET NOT NULL;

CREATE TABLE categories(
    id_categorie SERIAL PRIMARY KEY,
    nom_categorie VARCHAR(255) NOT NULL
);

INSERT INTO categories(nom_categorie) VALUES
('Plat malagasy'),
('Plat chinois'),
('Soupe'),
('Dessert et goute'),
('Boisson');

ALTER TABLE plats ADD COLUMN id_categorie INT;

UPDATE plats 
SET id_categorie = categories.id_categorie 
FROM categories 
WHERE plats.categorie = categories.nom_categorie;

ALTER TABLE plats ALTER COLUMN id_categorie SET NOT NULL;

ALTER TABLE plats ADD CONSTRAINT fk_plats_categorie 
FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie);

