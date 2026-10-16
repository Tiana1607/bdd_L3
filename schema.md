# Étape 1 : La carte

- CATEGORIEPLAT(**id_categorie**, nom_categorie)
- PLAT(**id_plat**, nom, prix, #id_categorie?)

> Piège : J'ai choisi un type DECIMAL(10,0) car on a indiqué que le prix serait un entier et à mon avis, les prix sont toujours stockés dans un DECIMAL(), les INT stocke plus souvent des identifiants, de plus si on souhaite rajouter des décimales plus tard, ce sera plus facile. Je ne comprends la question de "Quel identifiant choisissez-vous ?"

