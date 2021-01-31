DROP DATABASE IF EXISTS poney;
CREATE DATABASE poney; 
USE poney;

CREATE USER IF NOT EXISTS laure@localhost IDENTIFIED BY 'bibbo';
GRANT ALL ON poney.* TO laure@localhost;

DROP TABLE IF EXISTS adherents;
CREATE TABLE adherents(
    adherentID INT NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    pseudo VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    numero VARCHAR(255) NOT NULL UNIQUE,
    adresse1 VARCHAR(255) NOT NULL,
    codepostal VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    dateadhesion DATETIME,
    PRIMARY KEY (adherentsID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Profils (
    profilID INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    description VARCHAR(255),
    adherentID INT NOT NULL,
    FOREIGN KEY (adherentID) REFERENCES adherents (adherentID),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE InteretAdherent (
    CentreinteretID INT NOT NULL,
    AdherentID INT NOT NULL,
    CONSTRAINT `contrainte_cle_etrangere_utilisateur` FOREIGN KEY (`AdherentID`) REFERENCES `adherents` (`AdherentID`),
    CONSTRAINT `contrainte_cle_etrangere_utilisateur` FOREIGN KEY (`CentreinteretID`) REFERENCES `Interets` (`InteretID`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Interets (
    InteretID INT NOT NULL,
    Nom VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO adherents (adherentsID, prenom, nom, pseudo, password, email, numero, adresse1, codepostal, ville, dateadhesion) VALUES ("2045", "Julie", "Dupont", "Julie12", "$2y$10$Dkz.9JfhOQsxx3OP/P.AS.lfNcNOAc.EpBb29ISGr9H4G8WFalpQK", "julie@gmail.com", "0651429384", "20 rue ajaj", "13004", "Marseille", NOW()); --password: bibbo

INSERT INTO Interets (InteretID) VALUE (Sport);
INSERT INTO Interets (InteretID) VALUE (Musique);    
INSERT INTO Interets (InteretID) VALUE (Jeux vidéos);
INSERT INTO Interets (InteretID) VALUE (Lecture);
INSERT INTO Interets (InteretID) VALUE (Informatique);
INSERT INTO Interets (InteretID) VALUE (Sorties);
INSERT INTO Interets (InteretID) VALUE (Cuisine);
INSERT INTO Interets (InteretID) VALUE (Aviation);
INSERT INTO Interets (InteretID) VALUE (Mécanique;
INSERT INTO Interets (InteretID) VALUE (Licornes);
INSERT INTO Interets (InteretID) VALUE (Joaillerie);
INSERT INTO Interets (InteretID) VALUE (Agriculture);
INSERT INTO Interets (InteretID) VALUE (Cinéma);
INSERT INTO Interets (InteretID) VALUE (Politique);
INSERT INTO Interets (InteretID) VALUE (Couture);
INSERT INTO Interets (InteretID) VALUE (Animaux);
INSERT INTO Interets (InteretID) VALUE (Science);
INSERT INTO Interets (InteretID) VALUE (Histoire);
INSERT INTO Interets (InteretID) VALUE (SVT);
INSERT INTO Interets (InteretID) VALUE (Physique-Chimie);
INSERT INTO Interets (InteretID) VALUE (Taxidermie);
INSERT INTO Interets (InteretID) VALUE (Philatélie);
)