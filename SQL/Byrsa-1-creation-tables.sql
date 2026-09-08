CREATE TABLE CATEGORIE (
    id_categorie NUMBER PRIMARY KEY,
    nom_categorie VARCHAR2(50) NOT NULL
);

CREATE TABLE CLIENT (
    id_client NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    prenom VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    mot_de_passe VARCHAR2(100),
    telephone VARCHAR2(20)
);

CREATE TABLE TAILLE (
    id_taille NUMBER PRIMARY KEY,
    libelle VARCHAR2(5)
);

CREATE TABLE PRODUIT (
    id_produit NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    description VARCHAR2(200),
    prix NUMBER(8,2),
    stock_total NUMBER,
    image_url VARCHAR2(200),
    id_categorie NUMBER,
    
    CONSTRAINT fk_categorie
    FOREIGN KEY(id_categorie)
    REFERENCES CATEGORIE(id_categorie)
);

CREATE TABLE PRODUIT_TAILLE (

    id_produit NUMBER,
    id_taille NUMBER,

    CONSTRAINT pk_produit_taille
    PRIMARY KEY(id_produit,id_taille),

    FOREIGN KEY(id_produit)
    REFERENCES PRODUIT(id_produit),

    FOREIGN KEY(id_taille)
    REFERENCES TAILLE(id_taille)
);

CREATE TABLE COMMANDE (

    id_commande NUMBER PRIMARY KEY,
    date_commande DATE,
    statut_commande VARCHAR2(50),

    id_client NUMBER,

    FOREIGN KEY(id_client)
    REFERENCES CLIENT(id_client)
);

CREATE TABLE LIGNE_COMMANDE (

    id_commande NUMBER,
    id_produit NUMBER,

    quantite NUMBER,
    prix_unitaire NUMBER(8,2),

    CONSTRAINT pk_ligne_commande
    PRIMARY KEY(id_commande,id_produit),

    FOREIGN KEY(id_commande)
    REFERENCES COMMANDE(id_commande),

    FOREIGN KEY(id_produit)
    REFERENCES PRODUIT(id_produit)
);

CREATE TABLE PAIEMENT (

    id_paiement NUMBER PRIMARY KEY,
    type_paiement VARCHAR2(50),
    montant NUMBER(8,2),
    date_paiement DATE,

    id_commande NUMBER UNIQUE,

    FOREIGN KEY(id_commande)
    REFERENCES COMMANDE(id_commande)
);

CREATE TABLE LIVRAISON (

    id_livraison NUMBER PRIMARY KEY,
    adresse VARCHAR2(200),
    ville VARCHAR2(50),
    statut_livraison VARCHAR2(50),

    id_commande NUMBER UNIQUE,

    FOREIGN KEY(id_commande)
    REFERENCES COMMANDE(id_commande)
);

commit;