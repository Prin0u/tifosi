-- Script : schema.sql
-- Projet : Base de données pour le restaurant italien "Tifosi"
-- Auteur : Prin0u
-- Objectif : Création du schéma de la base de données

/* ===================================
   1. Création de la base
   =================================== */
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

/* ===================================
   2. Création de l'utilisateur
   =================================== */
DROP USER IF EXISTS 'tifosi'@'localhost';
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'pizza4fromages';

-- Attribution des droits sur la base
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;


/* ===================================
   3. Utilisation de la base
   =================================== */
USE tifosi;

/* ===================================
   4. Création du schéma
   =================================== */

-- Table : marque
-- Contient les marques des boissons
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL UNIQUE
);

-- Table : boisson
-- Contient les boissons avec leur prix et leur marque
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0),
    id_marque INT NOT NULL,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table : ingredient
-- Contient les ingrédients utilisés dans les focaccias
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

-- Table : focaccia
-- Contient les focaccias proposées par le restaurant
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix >= 0)
);

-- Table : focaccia_ingredient
-- Relation N-N entre focaccia et ingrédients
CREATE TABLE focaccia_ingredient (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

/* ===================================
   Fin du script
   =================================== */