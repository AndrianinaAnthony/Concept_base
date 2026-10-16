

```text
PLATS(**id_plat**, nom?, categorie?, prix?)
```

| Attribut | Type SQL | Contraintes | Description |
| :--- | :--- | :--- | :--- |
| **id_plat** | `SERIAL` | **Clé primaire**, générée automatiquement | Identifiant unique du plat |
| nom | `VARCHAR(255)` | Facultatif (`NULL` autorisé) | Nom du plat |
| categorie | `VARCHAR(255)` | Facultatif (`NULL` autorisé) | Catégorie du plat |
| prix | `INT` | Facultatif (`NULL` autorisé) | Prix du plat |

