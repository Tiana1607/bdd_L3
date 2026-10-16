# Étape 1 : La carte

- CATEGORIEPLAT(**id_categorie**, nom_categorie)
- PLAT(**id_plat**, nom, prix, #id_categorie?)

> Piège : J'ai choisi un type DECIMAL(10,0) car on a indiqué que le prix serait un entier et à mon avis, les prix sont toujours stockés dans un DECIMAL(), les INT stocke plus souvent des identifiants, de plus si on souhaite rajouter des décimales plus tard, ce sera plus facile. Je ne comprends la question de "Quel identifiant choisissez-vous ?"

# Étape 2 : Les catégories
Modifié : colonne id_categorie de PLAT mis en NOT NULL

- CATEGORIEPLAT(**id_categorie**, nom_categorie)
- PLAT(**id_plat**, nom, prix, #id_categorie) 

> Piège : La raison de pourquoi on n'a pas fait ainsi est parce qu'il n'y a pas de gestion efficace des catégories du menu puisque si par exemple on utilise ce VARCHAR(), dans la vue, ce sera un champ libre, or tous les employés ne peuvent pas se souvenir de toutes les catégories déjà existantes et insérer ce qui leur passe par la tête, donc mauvaise gestion des plats car ils ne sont pas regroupés de manière homogène. De plus, en champ libre, on risque d'avoir des données superflus dans la base et donc potentiellement des difficultés à créer la carte avec les catégories, on ne saura pas combien de plats chaque catégorie possède de manière exacte. 

# Étape 3 : Les commandes
Nouveau :
- COMMANDE(**id_commande**, date_commande)
- LIGNE_COMMANDE(**id_ligne_commande**, **#id_commande**, **#id_plat**, quantite)

> Piège : J'ai placé la quantité dans la table qui réceptionne les plats associés à la commande, donc LIGNE_COMMANDE

# Étape 4 : Les habitués
Nouveau :
- CLIENT(**id_client**, nom_client)

Modifié :
- COMMANDE(**#id_commande**, **#id_client?**, date_commande)

> Piège : Ma clé étrangère n'est pas NOT NULL car le propriétaire voulait surtout se souvenir de ses habitués et les clients de passage non, donc le nom des clients de passage sera inconnue et donc NULL, d'où on peut faire la condition dans la requête de vérification. J'ai utilisé LEFT JOIN pour que la requête prenne toutes les lignes de la table COMMANDE et met NULL si aucune correspondance avec la table CLIENT

# Étape 5 : Serveurs et tables
Nouveau :
- SALLE(**id_salle**, nom_salle)
- SALLE_TABLE (**id_table**, #id_salle, numero_table)
- SERVEUR(**id_serveur**, nom_serveur)

Modifié :
- COMMANDE(**#id_commande**, **#id_client?**, **#id_table?**, **#id_serveur**, date_commande, estaemporter)

> Piège : Une table ici reçoit une commande, mais une commande ne possède pas forcément de table puisqu'il y a la possibilité d'emporter. Le nom `table` pose problème car c'est une syntaxe déjà présente de base dans Postgresql et donc il y a conflit.  
