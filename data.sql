-- Script : data.sql
-- Projet : Base de données pour le restaurant italien "Tifosi"
-- Auteur : Prin0u
-- Objectif : Peupler la base de données avec des données de test

USE tifosi;
/* ===============================
   1. Insertion des marques
   =============================== */
INSERT INTO marque (nom_marque) VALUES
('Coca-Cola'),
('Cristalline'),
('Monster'),
('Pepsico');

/* ================================
   2. Insertion des boissons
   ================================ */
INSERT INTO boisson (nom_boisson, id_marque) VALUES
('Coca-Cola zéro', 1),
('Coca-cola original', 1),
('Fanta citron', 1),
('Fanta orange', 1),
('Capri-sun', 1),
('Pepsi', 2),
('Pepsi Max Zéro', 2),
('Lipton zéro citron', 2),
('Lipton Peach', 2),
('Monster energy  ultra gold', 3),
('Monster energy ultra blue', 3),
('Eau de source', 4);

   /* ================================
   3. Insertion des ingrédients
   ================================ */
INSERT INTO ingredient (nom_ingredient) VALUES
('Ail'),
('Ananas'),
('Artichaut'),
('Bacon'),
('Base Tomate'),
('Base crème'),
('Champignon'),
('Chèvre'),
('Cresson'),
('Emmental'),
('Gorgonzola'),
('Jambon cuit'),
('Jambon fumé'),
('Oeuf'),
('Oignon'),
('Olive noire'),
('Olive verte'),
('Parmesan'),
('Piment'),
('Poivre'),
('Pomme de terre'),
('Raclette'),
('Salami'),
('Tomate cerise'),
('Mozarella');

/* ================================
   4. Insertion des focaccias
   ================================ */
INSERT INTO focaccia (nom_focaccia, prix) VALUES
('Mozaccia', 9.80),
('Gorgonzollaccia', 10.80),
('Raclaccia', 8.90),
('Emmentalaccia', 9.80),
('Tradizione', 8.90),
('Hawaienne', 11.20),
('Américaine', 10.80),
('Paysanne', 12.80);

/* ================================
   5. Association focaccia <-> ingrédients
   ================================ */

-- Table : focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)

-- Mozaccia : Base tomate, Mozarella, cresson, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(1, 5, 200),
(1, 25, 50),
(1, 9, 20),
(1, 13, 80),
(1, 1, 2),
(1, 3, 20),
(1, 7, 40),
(1, 18, 50),
(1, 20, 1),
(1, 16, 20);

-- Gorgonzollaccia : Base tomate, gorgozonla, cresson, ail, champignon, parmesan, poivre, olive noire
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(2, 5, 200),
(2, 11, 50),
(2, 9, 20),
(2, 1, 2),
(2, 7, 40),
(2, 18, 50),
(2, 20, 1),
(2, 16, 20);

-- Raclaccia : Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(3, 5, 200),
(3, 22, 50),
(3, 9, 20),
(3, 1, 2),
(3, 7, 40),
(3, 18, 50),
(3, 20, 1);

-- Emmentalaccia : Base crème, emmental, cresson, champignon, parmesan, poivre, oignon
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(4, 6, 200),
(4, 10, 50),
(4, 9, 20),
(4, 7, 40),
(4, 18, 50),
(4, 20, 1),
(4, 15, 20);

-- Tradizione : Base tomate, mozarella, cresson, jambon cuit, champignon, parmesan, poivre, olive noire, olive verte
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(5, 5, 200),
(5, 25, 50),
(5, 9, 20),
(5, 12, 80),
(5, 7, 80),
(5, 18, 50),
(5, 20, 1),
(5, 16, 10),
(5, 17, 10);

-- Hawaienne : Base tomate, mozarella, cresson, bacon, ananas, piment, parmesan, poivre, olive noire
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(6, 5, 200),
(6, 25, 50),
(6, 9, 20),
(6, 4, 80),
(6, 2, 40),
(6, 19, 2),
(6, 18, 50),
(6, 20, 1),
(6, 16, 20);

-- Américaine : Base tomate, mozarella, cresson, bacon, pomme de terre, parmesan, poivre, olive noire
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(7, 5, 200),
(7, 25, 50),
(7, 9, 20),
(7, 21, 40),
(7, 18, 50),
(7, 20, 1),
(7, 16, 20);

-- Paysanne : Base crème, chèvre, cresson, pomme de terre, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire, oeuf
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite_grammes)
(8, 6, 200),
(8, 8, 50),
(8, 9, 20),
(8, 21, 80),
(8, 13, 80),
(8, 1, 2),
(8, 3, 20),
(8, 7, 40),
(8, 18, 50),
(8, 20, 1),
(8, 16, 20),
(8, 14, 50);

/* ================================
   Fin du script
   ================================ */