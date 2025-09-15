-- Script : requetes_test.sql
-- Projet : Base de données pour le restaurant italien "Tifosi"
-- Auteur : Prin0u
-- Objectif : Vérification de la base de données

USE tifosi;

/* ================================
   1. Afficher la liste des noms des focaccias par ordre alphabétique
   ================================ */
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;

/* ================================
   2. Afficher le nombre total d'ingrédients
   ================================ */
SELECT COUNT(*) AS nombre_ingredients
FROM ingredient;

/* ================================
   3. Afficher le prix moyen des focaccias
   ================================ */
SELECT AVG(prix) AS prix_moyen
FROM focaccia;

/* ================================
   4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
   ================================ */
SELECT boisson.nom_boisson, marque.nom_marque
FROM boisson
JOIN marque ON boisson.id_marque = marque.id_marque
ORDER BY boisson.nom_boisson ASC;

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

/* ================================
   6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
   ================================ */
SELECT focaccia.nom_focaccia, COUNT(focaccia_ingredient.id_ingredient) AS nombre_ingredients
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia;

/* ================================
   7. Afficher le nom de la focaccia qui a le plus d'ingrédients
   ================================ */
SELECT focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
GROUP BY focaccia.id_focaccia
ORDER BY COUNT(focaccia_ingredient.id_ingredient) DESC
LIMIT 1;

/* ================================
   8. Afficher la liste des focaccias qui contiennent de l'ail
   ================================ */
SELECT DISTINCT focaccia.nom_focaccia
FROM focaccia
JOIN focaccia_ingredient ON focaccia.id_focaccia = focaccia_ingredient.id_focaccia
JOIN ingredient ON focaccia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom_ingredient = 'Ail';

/* ================================
   9. Afficher la liste des ingrédients inutilisés
   ================================ */
SELECT ingredient.nom_ingredient
FROM ingredient
LEFT JOIN focaccia_ingredient ON ingredient.id_ingredient = focaccia_ingredient.id_ingredient
WHERE focaccia_ingredient.id_ingredient IS NULL;

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