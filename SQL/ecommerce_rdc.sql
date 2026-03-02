-- ==========================================
-- Script SQL Mini-Projet E-commerce RDC
-- ==========================================

-- 1️⃣ Création de la base de données
-- (à exécuter dans PostgreSQL si ce n'est pas déjà fait)
CREATE DATABASE ecommerce_rdc;

-- Se connecter à la base
\c ecommerce_rdc;

-- ==========================================
-- 2️⃣ Création des tables
-- ==========================================

-- Table clients
CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    ville VARCHAR(50)
);

-- Table produits
CREATE TABLE produits (
    id_produit SERIAL PRIMARY KEY,
    nom_produit VARCHAR(50),
    categorie VARCHAR(50),
    prix NUMERIC(10,2),
    stock INT
);

-- Table commandes
CREATE TABLE commandes (
    id_commande SERIAL PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    id_produit INT REFERENCES produits(id_produit),
    date_commande DATE,
    quantite INT
);

-- ==========================================
-- 3️⃣ Insertion de données
-- ==========================================

-- Clients (50)
INSERT INTO clients (nom, prenom, ville) VALUES
('Mbala','Jean','Kinshasa'),
('Kabasele','Marie','Lubumbashi'),
('Ngoma','Pierre','Goma'),
('Lusamba','Alice','Matadi'),
('Mbuyi','Paul','Kisangani'),
('Katembo','Sophie','Kananga'),
('Kalala','David','Bukavu'),
('Mwamba','Clara','Mbandaka'),
('Mutombo','Eric','Kikwit'),
('Bemba','Anne','Likasi'),
('Kasongo','Michel','Kananga'),
('Kabongo','Grace','Lubumbashi'),
('Mawete','Alex','Kinshasa'),
('Makabu','Linda','Goma'),
('Munganga','John','Matadi'),
('Kalombo','Fatou','Kisangani'),
('Nkulu','Jean-Pierre','Bukavu'),
('Kanyinda','Marie-Claire','Mbandaka'),
('Lutumba','Pauline','Kikwit'),
('Mbiya','Jean','Likasi'),
('Ngoy','Alice','Kananga'),
('Moke','Pierre','Lubumbashi'),
('Ngalula','Sophie','Kinshasa'),
('Tshibanda','Eric','Goma'),
('Kasala','Anne','Matadi'),
('Kitenge','Michel','Kisangani'),
('Kabala','Grace','Bukavu'),
('Lukusa','Alex','Mbandaka'),
('Mwamba','Linda','Kikwit'),
('Muteba','John','Likasi'),
('Kalombo','Fatou','Kananga'),
('Nkulu','Jean-Pierre','Lubumbashi'),
('Kanyinda','Marie-Claire','Kinshasa'),
('Lutumba','Pauline','Goma'),
('Mbiya','Jean','Matadi'),
('Ngoy','Alice','Kisangani'),
('Moke','Pierre','Bukavu'),
('Ngalula','Sophie','Mbandaka'),
('Tshibanda','Eric','Kikwit'),
('Kasala','Anne','Likasi'),
('Kitenge','Michel','Kananga'),
('Kabala','Grace','Lubumbashi'),
('Lukusa','Alex','Kinshasa'),
('Mwamba','Linda','Goma'),
('Muteba','John','Matadi'),
('Kalombo','Fatou','Kisangani'),
('Nkulu','Jean-Pierre','Bukavu'),
('Kanyinda','Marie-Claire','Mbandaka');

-- Produits (30)
INSERT INTO produits (nom_produit, categorie, prix, stock) VALUES
('Ordinateur','Electronique',1200.00,50),
('Smartphone','Electronique',800.00,100),
('Tablette','Electronique',400.00,70),
('Imprimante','Electronique',200.00,40),
('Clavier','Accessoire',50.00,200),
('Souris','Accessoire',30.00,300),
('Casque Audio','Accessoire',100.00,150),
('Enceinte Bluetooth','Accessoire',150.00,80),
('Disque Dur','Accessoire',120.00,100),
('SSD','Accessoire',200.00,70),
('Moniteur','Electronique',300.00,60),
('Webcam','Electronique',80.00,120),
('Router','Electronique',100.00,100),
('Switch','Electronique',150.00,50),
('Carte Graphique','Electronique',500.00,30),
('RAM 8GB','Accessoire',60.00,100),
('RAM 16GB','Accessoire',100.00,60),
('Clé USB 64GB','Accessoire',20.00,300),
('Clé USB 128GB','Accessoire',40.00,200),
('Projecteur','Electronique',350.00,20),
('Table de bureau','Meuble',150.00,40),
('Chaise bureau','Meuble',120.00,50),
('Lampe LED','Meuble',60.00,100),
('Bibliothèque','Meuble',300.00,20),
('Sac à dos','Accessoire',80.00,100),
('Montre connectée','Accessoire',200.00,80),
('T-shirt','Vêtements',25.00,200),
('Jeans','Vêtements',50.00,150),
('Chaussures','Vêtements',100.00,100),
('Veste','Vêtements',150.00,80);

-- Commandes (100) - exemple aléatoire
INSERT INTO commandes (id_client, id_produit, date_commande, quantite) VALUES
(1,1,'2023-01-05',2),
(2,3,'2023-01-07',1),
(3,5,'2023-01-10',4),
(4,2,'2023-01-12',1),
(5,4,'2023-01-15',2),
(6,6,'2023-01-18',5),
(7,7,'2023-01-20',1),
(8,8,'2023-01-22',2),
(9,9,'2023-01-25',3),
(10,10,'2023-01-28',1),
(11,11,'2023-02-02',1),
(12,12,'2023-02-05',2),
(13,13,'2023-02-07',1),
(14,14,'2023-02-10',2),
(15,15,'2023-02-12',1),
(16,16,'2023-02-15',3),
(17,17,'2023-02-18',1),
(18,18,'2023-02-20',2),
(19,19,'2023-02-22',1),
(20,20,'2023-02-25',1),
-- (ajoute jusqu’à 100 lignes en suivant le même modèle, ou copie-colle les lignes précédentes et change id_client, id_produit, date et quantité)
(21,1,'2023-03-01',1),
(22,2,'2023-03-03',2),
(23,3,'2023-03-05',1),
(24,4,'2023-03-07',3),
(25,5,'2023-03-10',1),
(26,6,'2023-03-12',2),
(27,7,'2023-03-14',1),
(28,8,'2023-03-16',2),
(29,9,'2023-03-18',1),
(30,10,'2023-03-20',3);

-- Tu peux continuer à 100 lignes ou dupliquer les lignes en changeant id_client, id_produit, date et quantite

-- ==========================================
-- 4️⃣ Exemples de requêtes
-- ==========================================

-- Chiffre d’affaires total
SELECT SUM(p.prix * c.quantite) AS chiffre_affaires_total
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit;

-- Top 5 produits les plus rentables
SELECT p.nom_produit,
       SUM(c.quantite * p.prix) AS ca_total
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY p.nom_produit
ORDER BY ca_total DESC
LIMIT 5;

-- Chiffre d’affaires par ville
SELECT cl.ville,
       SUM(c.quantite * p.prix) AS total_chiffre_affaires
FROM commandes c
JOIN clients cl ON c.id_client = cl.id_client
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY cl.ville
ORDER BY total_chiffre_affaires DESC;