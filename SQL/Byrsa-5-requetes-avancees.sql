//Afficher les clients et leurs commandes
SELECT c.nom, co.id_commande, co.statut_commande
FROM CLIENT c
JOIN COMMANDE co
ON c.id_client = co.id_client;


//Produits avec catégorie
SELECT p.nom, p.prix, ca.nom_categorie
FROM PRODUIT p
JOIN CATEGORIE ca
ON p.id_categorie = ca.id_categorie;


//Total de la commande
SELECT id_commande, SUM(quantite * prix_unitaire) AS total_commande
FROM LIGNE_COMMANDE
GROUP BY id_commande;


//Nombre de commandes par client
SELECT id_client, COUNT(*) AS nombre_commandes
FROM COMMANDE
GROUP BY id_client;


//Produits plus chers que la moyenne
SELECT nom, prix
FROM PRODUIT
WHERE prix >
(SELECT AVG( prix)
FROM PRODUIT);