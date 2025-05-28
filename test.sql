CREATE TABLE Client (
    code_client VARCHAR(6) PRIMARY KEY,
    CHECK (code_client ~ '^[a-z]{2}-[0-9]{3}$') -- Le regex est seulement pour PostgreSQL sinon faire un trigger car MySQL ne supporte pas
);

CREATE TABLE Commande (
    id_commande INT PRIMARY KEY,
    code_client VARCHAR(6) REFERENCES Client(code_client),
    date_commande DATE NOT NULL
);

-- Associativité 
CREATE TABLE Detail_commande (
    id_commande INT REFERENCES Commande(id_commande),
    id_boite INT REFERENCES Boite(id_boite),
    quantite INT NOT NULL CHECK,
    PRIMARY KEY (id_commande, id_boite)
);




CREATE TABLE Boite (
    id_boite INT PRIMARY KEY,
    id_matiere INT NOT NULL,
    id_couleur INT NOT NULL,
    longueur_mm INT NOT NULL CHECK (longueur_mm > 0 AND longueur_mm <= 1000),
    largeur_mm INT NOT NULL CHECK (largeur_mm > 0 AND largeur_mm <= 1000),
    hauteur_mm INT NOT NULL CHECK (hauteur_mm > 0 AND hauteur_mm <= 1000),
    FOREIGN KEY (id_matiere, id_couleur) REFERENCES Matiere_couleur(id_matiere, id_couleur)
);



CREATE TABLE Matiere (
    id_matiere INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Couleur (
    id_couleur INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Associativité
CREATE TABLE Matiere_couleur (
    id_matiere INT REFERENCES Matiere(id_matiere),
    id_couleur INT REFERENCES Couleur(id_couleur),
    PRIMARY KEY (id_matiere, id_couleur)
);





