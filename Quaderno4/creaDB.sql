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


CREATE TABLE ciclista (
  CodC varchar(10) PRIMARY KEY,
  Nome varchar(50) NOT NULL,
  Cognome varchar(50) NOT NULL,
  Nazionalità varchar(50) NOT NULL,
  CodS varchar(50) NOT NULL REFERENCES SQUADRA(CodS),
  AnnoNascita integer NOT NULL
);

CREATE TABLE Squadra (
  CodS varchar(50) NOT NULL,
  NomeS varchar(50) NOT NULL,
  AnnoFondazione smallint NOT NULL,
  SedeLegale varchar(50) NULL,
  CONSTRAINT chk_AnnoFondazione CHECK (AnnoFondazione>=1900 AND AnnoFondazione <=2000)
);

CREATE TABLE Tappa (
  Edizione smallint ,
  CodT smallint ,
  CittaPartenza varchar(50) NOT NULL,
  CittaArrivo varchar(50) NOT NULL,
  Lunghezza smallint,
  Dislivello smallint,
  GradoDifficolta smallint,
  CONSTRAINT chk_GradoDifficolta CHECK (GradoDifficolta>=1 AND GradoDifficolta<=10),
  PRIMARY KEY(Edizione,CodT)
);


CREATE TABLE CLASSIFICA_INDIVIDUALE (
  CodC varchar(10) REFERENCES CICLISTA(CodC),
  CodT smallint REFERENCES TAPPA(CodT),
  Edizione smallint REFERENCES TAPPA(Edizione),
  Posizione smallint NOT NULL,
  PRIMARY KEY(CodC,CodT,Edizione)
);

COMMIT;


START TRANSACTION;


INSERT INTO Squadra VALUES ('0001','Astana',1991,'boh');
INSERT INTO Ciclista VALUES ('0022','Vincenzo','Nibali','Italiano','0001','1983');
INSERT INTO Tappa VALUES (12,100,'Milano','Torino',200,1100,6);
INSERT INTO Tappa VALUES (7,150,'Milano','SanRemo',300,1100,10);
INSERT INTO Tappa VALUES (8,150,'Milano','SanRemo',300,1100,10);
INSERT INTO CLASSIFICA_INDIVIDUALE VALUES ('0022',100,12,1);
INSERT INTO Tappa VALUES (13,100,'Milano','Torino',200,1100,6);
INSERT INTO Tappa VALUES (15,100,'Milano','Torino',200,1100,6);

COMMIT;
