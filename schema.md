# Étape 1 : La carte

- CATEGORIEPLAT(**id_categorie**, nom_categorie)
- PLAT(**id_plat**, nom, prix, #id_categorie?)

> Piège : J'ai choisi un type DECIMAL(10,0) car on a indiqué que le prix serait un entier et à mon avis, les prix sont toujours stockés dans un DECIMAL(), les INT stocke plus souvent des identifiants, de plus si on souhaite rajouter des décimales plus tard, ce sera plus facile. Je ne comprends la question de "Quel identifiant choisissez-vous ?"

# Étape 2 : Les catégories
Modifié : colonne id_categorie de PLAT mis en NOT NULL

- CATEGORIEPLAT(**id_categorie**, nom_categorie)
- PLAT(**id_plat**, nom, prix, #id_categorie) 

> Piège : La raison de pourquoi on n'a pas fait ainsi est parce qu'il n'y a pas de gestion efficace des catégories du menu puisque si par exemple on utilise ce VARCHAR(), dans la vue, ce sera un champ libre, or tous les employés ne peuvent pas se souvenir de toutes les catégories déjà existantes et insérer ce qui leur passe par la tête, donc mauvaise gestion des plats car ils ne sont pas regroupés de manière homogène. De plus, en champ libre, on risque d'avoir des données superflus dans la base et donc potentiellement des difficultés à créer la carte avec les catégories, on ne saura pas combien de plats chaque catégorie possède de manière exacte. 


