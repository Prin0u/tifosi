# Base de données pour le restaurant italien Tifosi

Création et test d'une base de données SQL pour un restaurant italien nommé Tifosi.

Le but est de modéliser les **focaccias**, leurs **ingrédients**, ainsi que les **boissons** et leurs **marques**.

## Structure du projet

- schema.sql
  Script de création de la base de données (**tables, clés primaires, clés étrangères**).

- data.sql
  Script d'insertion des données de test (**ingrédients, focaccias, boissons, marques...**).

- requetes_test.sql
  Script de vérification de la base de données à travers différentes **requêtes SQL**.

## Installation et exécution

1. Créer la base de données dans MySQL :

```sql
CREATE DATABASE tifosi;

2. Lancer le script de création du schéma :
mysql -u root -p tifosi < schema.sql

3. Insérer les données de test :
mysql -u root -p tifosi < data.sql

4. Vérifier avec les requêtes de test :
mysql -u root -p tifosi < requetes_test.sql

## Requêtes de test incluses

1. Liste alphabétique des focaccias
2. Nombre total d’ingrédients
3. Prix moyen des focaccias
4. Liste des boissons avec leur marque
5. Ingrédients d’une focaccia donnée (ex: Raclaccia)
6. Nombre d’ingrédients par focaccia
7. Focaccia avec le plus d’ingrédients
8. Focaccias contenant de l’ail
9. Ingrédients inutilisés
10. Focaccias sans champignons

## Projet réalisé par GeoDev
```
