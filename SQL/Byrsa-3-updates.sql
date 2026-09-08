//Modifier le statut de la commande num 1 en livrée
UPDATE COMMANDE
SET statut_commande='Livrée'
WHERE id_commande=1;

//Modifier le stock total du produit id 1 en en retirant 2 produits
UPDATE PRODUIT
SET stock_total = stock_total - 2
WHERE id_produit = 1;

//Modifier le statut de la livraison id 1 en expédiée
UPDATE LIVRAISON
SET statut_livraison='Expédiée'
WHERE id_livraison=1;