-- Vérif étape 1 
SELECT nom, prix FROM PLAT ORDER BY prix DESC;

-- Vérif étape 2
SELECT c.nom_categorie, COUNT(*) as nb_plat FROM PLAT p
JOIN CATEGORIEPLAT c ON c.id_categ_plat = p.id_categorie
GROUP BY c.nom_categorie;

-- Vérif 3
SELECT c.id_commande, SUM(p.prix * lg.quantite) as montant_total FROM COMMANDE c
JOIN LIGNE_COMMANDE lg ON lg.id_commande = c.id_commande
JOIN PLAT p ON p.id_plat = lg.id_plat
GROUP BY c.id_commande
ORDER BY c.id_commande ASC;