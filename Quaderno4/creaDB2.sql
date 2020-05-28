SET storage_engine=InnoDB;
SET FOREIGN_KEY_CHECKS=1;



CREATE DATABASE IF NOT EXISTS CICLISMO;

USE CICLISMO;

DROP TABLE IF EXISTS CICLISTA;
DROP TABLE IF EXISTS SQUADRA;
DROP TABLE IF EXISTS TAPPA;
DROP TABLE IF EXISTS CLASSIFICA_INDIVIDUALE;



SET AUTOCOMMIT=0;
START TRANSACTION;




CREATE TABLE Squadra (
  CodS varchar(50) NOT NULL,
  NomeS varchar(50) NOT NULL,
  AnnoFondazione smallint NOT NULL,
  SedeLegale varchar(50) NULL,
  PRIMARY KEY (CodS),
  CONSTRAINT check_AnnoFondazione CHECK (AnnoFondazione>=1900 AND AnnoFondazione <=2000)
);

CREATE TABLE ciclista (
  CodC varchar(10) NOT NULL,
  Nome varchar(50) NOT NULL,
  Cognome varchar(50) NOT NULL,
  Nazionalità varchar(50) NOT NULL,
  CodS varchar(50) NOT NULL,
  AnnoNascita integer NOT NULL,
  PRIMARY KEY (CodC),
  FOREIGN KEY (CodS)
        REFERENCES SQUADRA (CodS)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Tappa (
  Edizione smallint NOT NULL AUTO_INCREMENT,
  CodT smallint NOT NULL ,
  CittaPartenza varchar(50) NOT NULL,
  CittaArrivo varchar(50) NOT NULL,
  Lunghezza smallint,
  Dislivello smallint,
  GradoDifficolta smallint,
  CONSTRAINT check_GradoDifficolta CHECK (GradoDifficolta>=1 AND GradoDifficolta<=10),
  PRIMARY KEY(Edizione,CodT)
);


CREATE TABLE CLASSIFICA_INDIVIDUALE (
  CodC varchar(10) NOT NULL,
  CodT smallint NOT NULL,
  Edizione smallint NOT NULL,
  Posizione smallint NOT NULL,
  PRIMARY KEY(CodC,CodT,Edizione),
  FOREIGN KEY (CodC)
          REFERENCES ciclista(CodC)
          ON DELETE CASCADE
          ON UPDATE CASCADE,
  FOREIGN KEY (CodT)
          REFERENCES Tappa(CodT)
          ON DELETE CASCADE
          ON UPDATE CASCADE,
  FOREIGN KEY (Edizione)
          REFERENCES Tappa(Edizione)
          ON DELETE CASCADE
          ON UPDATE CASCADE
);

COMMIT;


START TRANSACTION;


INSERT INTO Squadra VALUES ('0001','Astana',1991,'boh');
INSERT INTO Ciclista VALUES ('0022','Vincenzo','Nibali','Italiano','0001','1983');
INSERT INTO Tappa VALUES ('Milano','Torino',200,1100,6);
INSERT INTO Tappa VALUES ('Milano','SanRemo',300,1100,10);
INSERT INTO Tappa VALUES ('Milano','SanRemo',300,1100,10);
INSERT INTO CLASSIFICA_INDIVIDUALE VALUES ('0022',100,12,1);
INSERT INTO Tappa VALUES ('Milano','Torino',200,1100,6);
INSERT INTO Tappa VALUES ('Milano','Torino',200,1100,6);

COMMIT;
