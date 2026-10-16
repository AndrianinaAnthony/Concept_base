--Verfication etape1:
SELECT * FROM plats ORDER BY prix DESC;

--Verification etape2:(style vue)
SELECT c.nom_categorie, COUNT(p.id_plat) AS nombre_de_plats
FROM categories c
LEFT JOIN plats p ON c.id_categorie = p.id_categorie
GROUP BY c.id_categorie, c.nom_categorie;