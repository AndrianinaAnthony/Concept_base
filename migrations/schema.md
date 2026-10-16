```text
PLATS(**id_plat**, nom?, categorie (modifié), prix?, #id_categorie (nouveau))

CATEGORIES(**id_categorie (nouveau)**, nom_categorie (nouveau))

COMMANDES(**id_commande (nouveau)**, date_commande (nouveau))

COMMANDE_PLATS(**#id_commande (nouveau), #id_plat (nouveau)**, quantite (nouveau))
```

| Relation | Attribut | Type SQL | Contraintes | Description |
| :--- | :--- | :--- | :--- | :--- |
| PLATS | **id_plat** | `SERIAL` | **Clé primaire**, générée automatiquement | Identifiant unique du plat |
| PLATS | nom | `VARCHAR(255)` | Facultatif (`NULL` autorisé) | Nom du plat |
| PLATS | categorie | `VARCHAR(255)` | Obligatoire (`NOT NULL`) **(modifié)** | Nom de la catégorie du plat |
| PLATS | prix | `INT` | Facultatif (`NULL` autorisé) | Prix du plat |
| PLATS | #id_categorie | `INT` | Obligatoire (`NOT NULL`), clé étrangère vers `CATEGORIES.id_categorie` **(nouveau)** | Identifiant de la catégorie du plat |
| CATEGORIES | **id_categorie** | `SERIAL` | **Clé primaire**, générée automatiquement **(nouveau)** | Identifiant unique de la catégorie |
| CATEGORIES | nom_categorie | `VARCHAR(255)` | Obligatoire (`NOT NULL`) **(nouveau)** | Nom de la catégorie |
| COMMANDES | **id_commande** | `SERIAL` | **Clé primaire**, générée automatiquement **(nouveau)** | Identifiant unique de la commande |
| COMMANDES | date_commande | `DATE` | Obligatoire (`NOT NULL`), valeur par défaut : date du jour **(nouveau)** | Date de la commande |
| COMMANDE_PLATS | **#id_commande** | `INT` | **Clé primaire composée**, clé étrangère vers `COMMANDES.id_commande` **(nouveau)** | Identifiant de la commande |
| COMMANDE_PLATS | **#id_plat** | `INT` | **Clé primaire composée**, clé étrangère vers `PLATS.id_plat` **(nouveau)** | Identifiant du plat |
| COMMANDE_PLATS | quantite | `INT` | Obligatoire (`NOT NULL`), strictement positive **(nouveau)** | Quantité du plat dans cette commande |

```text
PLATS.#id_categorie → CATEGORIES.id_categorie
COMMANDE_PLATS.#id_commande → COMMANDES.id_commande
COMMANDE_PLATS.#id_plat → PLATS.id_plat
```

La quantité est placée dans `COMMANDE_PLATS`, car elle dépend de l'association
entre une commande et un plat. Le montant total d'une commande est calculé avec
`SUM(quantite * prix)`.
