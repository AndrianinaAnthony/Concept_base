CREATE TABLE commandes(
    id_commande SERIAL PRIMARY KEY,
    date_commande DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE commande_plats(
    id_commande INT NOT NULL,
    id_plat INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat),
    CONSTRAINT fk_commande_plats_commande
        FOREIGN KEY (id_commande) REFERENCES commandes(id_commande),
    CONSTRAINT fk_commande_plats_plat
        FOREIGN KEY (id_plat) REFERENCES plats(id_plat)
);

-- Verification: montant total de chaque commande
SELECT c.id_commande,
       c.date_commande,
       COALESCE(SUM(cp.quantite * p.prix), 0) AS montant_total
FROM commandes c
LEFT JOIN commande_plats cp ON c.id_commande = cp.id_commande
LEFT JOIN plats p ON cp.id_plat = p.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;