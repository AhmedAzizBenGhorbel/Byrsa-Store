//Les produits avec leurs catégories
CREATE VIEW V_CATALOGUE_PRODUITS AS

SELECT p.id_produit, p.nom, p.prix, p.stock_total, c.nom_categorie
FROM PRODUIT p
JOIN CATEGORIE c
ON p.id_categorie = c.id_categorie;

SELECT *
FROM V_CATALOGUE_PRODUITS;

//Client, commande et le total
CREATE VIEW V_RESUME_COMMANDES AS

SELECT cl.nom, co.id_commande, SUM(lc.quantite * lc.prix_unitaire) AS total_commande
FROM CLIENT cl

JOIN COMMANDE co
ON cl.id_client = co.id_client

JOIN LIGNE_COMMANDE lc
ON co.id_commande = lc.id_commande

GROUP BY cl.nom, co.id_commande;


SELECT *
FROM V_RESUME_COMMANDES;