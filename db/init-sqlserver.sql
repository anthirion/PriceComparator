-- Création de la base de données (seulement si elle n'existe pas)
IF NOT EXISTS (SELECT name
FROM sys.databases
WHERE name = 'priceComparator')
BEGIN
    CREATE DATABASE priceComparator;
END
GO

-- Utilisation de la base de données
USE priceComparator;
GO

-- Création de la table products
CREATE TABLE products
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    nom NVARCHAR(255) NOT NULL,
    categorie NVARCHAR(100) NOT NULL,
    prixLeclerc DECIMAL(10,2) NOT NULL,
    prixAuchan DECIMAL(10,2) NOT NULL,
    eligibleSodexo BIT NOT NULL
);
GO

-- Insertion des données
-- si le produit n'existe pas, un prix de 100 euros est indique (prix demesurement haut)
INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Steak hache 250g', N'Alimentation', 3.69, 2.00, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Feuille de chene', N'Alimentation', 0.99, 1.89, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Lait frais', N'Alimentation', 1.29, 1.89, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Yaourt fruits Panier de Yoplait', N'Alimentation', 4.66, 5.45, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Compote peche Andros', N'Alimentation', 2.29, 2.39, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Jambon 4 tranches', N'Alimentation', 1.72, 2.69, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Pates', N'Alimentation', 1.35, 1.01, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Cereales Special K Kellogg''s Nature - 750g', N'Alimentation', 4.24, 4.68, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Chocolat au lait Lindt Creation Le Rocher lait - 150g', N'Alimentation', 2.60, 3.65, 0);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Bananes 5 doigts', N'Alimentation', 0.79, 0.99, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Cafe moulu', N'Alimentation', 2.23, 3.12, 1);

INSERT INTO products
    (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES
    (N'Savon Le Petit Marseillais Solide amande douce - 2x100g', N'Hygiene', 1.91, 2.79, 0);
GO