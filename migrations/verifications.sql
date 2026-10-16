-- Vérif étape 1 
SELECT nom, prix FROM PLAT ORDER BY prix DESC;

-- Vérif étape 2
SELECT c.nom_categorie, COUNT(*) as nb_plat FROM PLAT P
JOIN CATEGORIEPLAT c ON c.id_categ_plat = p.id_categorie
GROUP BY c.nom_categorie;