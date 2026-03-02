# Mini-projet SQL : E-commerce RDC

## 1️⃣ Présentation

Ce projet simule une plateforme e-commerce en République Démocratique du Congo (RDC).  
L'objectif est d'analyser les ventes, les produits les plus rentables et le chiffre d'affaires par ville et par mois.  

**Technologies utilisées :** PostgreSQL, SQL (SELECT, JOIN, WHERE, GROUP BY, HAVING, SUM, AVG, ORDER BY, LIMIT)

**Tables :**
- `clients` : informations sur les clients (nom, prénom, ville)
- `produits` : informations sur les produits (nom, catégorie, prix, stock)
- `commandes` : informations sur les commandes (client, produit, date, quantité)

---

## 2️⃣ Structure de la base

### clients
| id_client | nom | prenom | ville |

### produits
| id_produit | nom_produit | categorie | prix | stock |

### commandes
| id_commande | id_client | id_produit | date_commande | quantite |

---

## 3️⃣ Données

- 50 clients  
- 30 produits  
- 100 commandes générées aléatoirement  
- Chiffre d’affaires total attendu : environ 44 794  

---

## 4️⃣ Analyses SQL

1. **Chiffre d’affaires total**

```sql
SELECT SUM(p.prix * c.quantite) AS chiffre_affaires_total
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit;
Top 5 produits les plus rentables

SELECT p.nom_produit,
       SUM(c.quantite * p.prix) AS ca_total
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY p.nom_produit
ORDER BY ca_total DESC
LIMIT 5;

Chiffre d’affaires par ville

SELECT cl.ville,
       SUM(c.quantite * p.prix) AS total_chiffre_affaires
FROM commandes c
JOIN clients cl ON c.id_client = cl.id_client
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY cl.ville
ORDER BY total_chiffre_affaires DESC;

Produits générant plus que la moyenne

SELECT p.nom_produit,
       SUM(c.quantite * p.prix) AS ca_total
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY p.nom_produit
HAVING SUM(c.quantite * p.prix) > (
    SELECT AVG(ca)
    FROM (
        SELECT SUM(c2.quantite * p2.prix) AS ca
        FROM commandes c2
        JOIN produits p2 ON c2.id_produit = p2.id_produit
        GROUP BY p2.id_produit
    ) AS sous
)
ORDER BY ca_total DESC;

Chiffre d’affaires par mois

SELECT EXTRACT(YEAR FROM c.date_commande) AS annee,
       EXTRACT(MONTH FROM c.date_commande) AS mois,
       SUM(c.quantite * p.prix) AS total_chiffre_affaires
FROM commandes c
JOIN produits p ON c.id_produit = p.id_produit
GROUP BY annee, mois
ORDER BY annee DESC, mois DESC;
5️⃣ Instructions pour exécuter le projet

Installer PostgreSQL

Créer la base : CREATE DATABASE ecommerce_rdc;

Exécuter le script SQL : /sql/ecommerce_rdc.sql

Vérifier les résultats avec les requêtes fournies

Capturer les résultats pour le README et les graphiques

6️⃣ Notes et recommandations

Prioriser les villes et produits générant le plus de chiffre d’affaires

Suivre le chiffre d’affaires mensuel pour planifier des campagnes marketing

Ce mini-projet sert de base pour un futur portfolio Data Analyst