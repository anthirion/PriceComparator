CREATE DATABASE priceComparator_ant;

USE priceComparator_ant;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    leclercPrice DECIMAL(10,2) NOT NULL,
    auchanPrice DECIMAL(10,2) NOT NULL,
    sodexoEligible BOOLEAN NOT NULL
);

-- si le produit n'existe pas, un prix de 100 euros est indiqué (prix démesurément haut)
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Steak haché 250g", "Alimentation", 3.69, 2.00, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Feuille de chêne", "Alimentation", 0.99, 1.89, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Lait frais", "Alimentation", 1.29, 1.89, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Yaourt fruits Panier de Yoplait", "Alimentation", 4.66, 5.45, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Compote peche Andros", "Alimentation", 2.29, 2.39, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Jambon 4 tranches", "Alimentation", 1.72, 2.69, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Pates", "Alimentation", 1.35, 1.01, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Céréales Special K Kellogg's Nature - 750g", "Alimentation", 4.24, 4.68, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Chocolat au lait Lindt Création Le Rocher lait - 150g", "Alimentation", 2.60, 3.65, FALSE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Bananes 5 doigts", "Alimentation", 0.79, 0.99, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Cafe moulu", "Alimentation", 2.23, 3.12, TRUE);
INSERT INTO products (productName, category, leclercPrice, auchanPrice, sodexoEligible)
VALUES ("Savon Le Petit Marseillais Solide amande douce - 2x100g", "Hygiène", 1.91, 2.79, FALSE);

-- pour copier ce script dans le conteneur pour ensuite l'exécuter, taper la commande suivante:
-- docker cp <src_path_on_computer> <container_name>:<dest_path_in_container>
-- exécuter le script avec la commande suivante :
-- mysql -u root -p < /script.sql
-- ensuite le système demande de taper le mdp
