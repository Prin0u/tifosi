-- Script : requetes_test.sql
-- Projet : Base de données pour le restaurant italien "Tifosi"
-- Auteur : GeoDev
-- Objectif : Vérification de la base de données

USE tifosi;

/* ================================
   1. Afficher la liste des noms des focaccias par ordre alphabétique
   ================================ */
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

/*
Résultat attendu :
Américaine
Emmentalaccia
Gorgonzollaccia
Hawaienne
Mozaccia
Paysanne
Raclaccia
Tradizione

Résultat obtenu : Exactement le même */

/* ================================
   2. Afficher le nombre total d'ingrédients
   ================================ */
SELECT COUNT(*) AS nombre_ingredients
FROM ingredient;

/*
Résultat attendu : 25
Résultat obtenu : 25
*/

/* ================================
   3. Afficher le prix moyen des focaccias
   ================================ */
SELECT AVG(prix) AS prix_moyen
FROM focaccia;

/*
Résultat attendu : 10.37 (approximatif)
Résultat obtenu : 10.37
*/

/* ================================
   4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
   ================================ */
SELECT boisson.nom_boisson, marque.nom_marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson ASC;

/*
Résultat attendu : (liste triée alphabétiquement avec la marque correspondante)
Capri-sun          Coca-Cola
Coca-Cola zéro     Coca-Cola
Coca-cola original Coca-Cola
Eau de source      Pepsico
Fanta citron       Coca-Cola
Fanta orange       Coca-Cola
Lipton Peach       Cristalline
Lipton zéro citron Cristalline
Monster energy ultra blue Monster
Monster energy  ultra gold Monster
Pepsi              Cristalline
Pepsi Max Zéro     Cristalline

Résultat obtenu : Exactement le même */

/* ================================
   5. Afficher la liste des ingrédients pour une Raclaccia
   ================================ */
SELECT ingredient.nom_ingredient
FROM focaccia_ingredient
JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE focaccia_ingredient.id_focaccia = (
    SELECT id_focaccia
    FROM focaccia
    WHERE nom_focaccia = 'Raclaccia'
);

/*
Résultat attendu :
Base Tomate
Raclette
Cresson
Ail
Champignon
Parmesan
Poivre

Résultat obtenu : identique
*/

/* ================================
   6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
   ================================ */
SELECT focaccia.nom_focaccia, COUNT(focaccia_ingredient.id_ingredient) AS nombre_ingredients
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia;

/*
Résultat attendu :
Mozaccia          10
Gorgonzollaccia   8
Raclaccia         7
Emmentalaccia     7
Tradizione        9
Hawaienne         9
Américaine        7
Paysanne          12

Résultat obtenu : correspond exactement
*/

/* ================================
   7. Afficher le nom de la focaccia qui a le plus d'ingrédients
   ================================ */
SELECT focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia
ORDER BY COUNT(focaccia_ingredient.id_ingredient) DESC
LIMIT 1;

/*
Résultat attendu : Paysanne
Résultat obtenu : Paysanne
*/

/* ================================
   8. Afficher la liste des focaccias qui contiennent de l'ail
   ================================ */
SELECT DISTINCT focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';

/*
Résultat attendu :
Mozaccia
Gorgonzollaccia
Raclaccia
Paysanne

Résultat obtenu : identique
*/

/* ================================
   9. Afficher la liste des ingrédients inutilisés
   ================================ */
SELECT ingredient.nom_ingredient
FROM ingredient
LEFT JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia_ingredient.id_ingredient IS NULL;

/*
Résultat attendu :
Salami
Tomate cerise

Résultat obtenu : identique
*/

/* ================================
   10. Afficher la liste des focaccias qui n'ont pas de champignons
   ================================ */
SELECT focaccia.nom_focaccia
FROM focaccia
WHERE focaccia.id_focaccia NOT IN (
    SELECT focaccia_ingredient.id_focaccia
    FROM focaccia_ingredient
    JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
    WHERE ingredient.nom_ingredient = 'Champignon'
);

/*
Résultat attendu :
Américaine
Hawaienne

Résultat obtenu : identique
*/