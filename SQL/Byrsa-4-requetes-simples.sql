//Afficher la liste des clients
SELECT *
FROM CLIENT;

//Afficher les nom, prix et stock total des produits
SELECT nom, prix, stock_total
FROM PRODUIT;

//Afficher les produits dont le prix est inférieur à 150dt
SELECT nom, prix
FROM PRODUIT
WHERE prix > 150;

//Afficher les commandes livrés
SELECT *
FROM COMMANDE
WHERE statut_commande = 'Livrée';

//Afficher les livraison à la ville de tunis
SELECT *
FROM LIVRAISON
WHERE ville = 'Tunis';