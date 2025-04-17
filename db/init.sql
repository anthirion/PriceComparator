CREATE DATABASE IF NOT EXISTS priceComparator_ant;

USE priceComparator_ant;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    categorie VARCHAR(100) NOT NULL,
    prixLeclerc DECIMAL(10,2) NOT NULL,
    prixAuchan DECIMAL(10,2) NOT NULL,
    eligibleSodexo BOOLEAN NOT NULL
);

-- si le produit n'existe pas, un prix de 100 euros est indique (prix demesurement haut)
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Steak hache 250g", "Alimentation", 3.69, 2.00, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Feuille de chene", "Alimentation", 0.99, 1.89, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Lait frais", "Alimentation", 1.29, 1.89, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Yaourt fruits Panier de Yoplait", "Alimentation", 4.66, 5.45, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Compote peche Andros", "Alimentation", 2.29, 2.39, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Jambon 4 tranches", "Alimentation", 1.72, 2.69, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Pates", "Alimentation", 1.35, 1.01, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Cereales Special K Kellogg's Nature - 750g", "Alimentation", 4.24, 4.68, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Chocolat au lait Lindt Creation Le Rocher lait - 150g", "Alimentation", 2.60, 3.65, FALSE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Bananes 5 doigts", "Alimentation", 0.79, 0.99, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Cafe moulu", "Alimentation", 2.23, 3.12, TRUE);
INSERT INTO products (nom, categorie, prixLeclerc, prixAuchan, eligibleSodexo)
VALUES ("Savon Le Petit Marseillais Solide amande douce - 2x100g", "Hygiene", 1.91, 2.79, FALSE);