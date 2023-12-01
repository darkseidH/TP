CREATE KEYSPACE IF NOT EXISTS university
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3 };

CREATE TABLE Cours (
  idCours int,
  Intitule varchar,
  Responsable int,
  Niveau varchar,
  nbHeuresMax int,
  Coeff int,
  PRIMARY KEY (idCours)
  );

  CREATE INDEX fk_Enseignement_Enseignant_idx ON cours (responsable) ;

  CREATE TABLE Enseignant (idEnseignant int,
   Nom varchar,
    Prenom varchar,
     status varchar,
      PRIMARY KEY( idEnseignant)
      );

DESCRIBE tables;



INSERT INTO cours (idCours, intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (1, 'Introduction aux Bases de Donnees', 1, 'M1',30, 3);

INSERT INTO cours JSON'{"idCours": 1,"Intitule ":"Introduction aux Bases de Donnees"
Introduction aux Bases de Donnees"," Responsable ": 1,"nbHeuresMax ": 30," Coeff ":3}';

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (2, 'C++',4, 'M1', 30, 2);

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (3, 'Initiation Python',5, 'M1', 30,2);

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (4, 'Bases de Donnees Avancees', 1, 'M2', 30,5);

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (5, 'Architecture des Systemes', 6, 'M2', 8,1);

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (6, 'Big Data', 7, 'M2', 20,3);

INSERT INTO cours (idCours, Intitule, Responsable, Niveau, nbHeuresMax, Coeff)
VALUES (7, 'Bd NOSQL', 8, 'M2' , 10, 1);


INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(1, 'ALAOUI' , 'Mohammed', 'Vacataire');
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(2, 'HACHIMI' , 'Fatima', 'Permanant');
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(3, 'NOUACH', 'Adil', 'Vacataire');
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(4, 'SLAMI','Houda' ,'Permanant') ;
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(5, 'BARAKAT', 'Ikram', 'Permanant');
INSERT INTO Enseignant (idenseignant, Nom, Prenom, status) VALUES(6, 'TRABLSI','Mohamed','Permanant');
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(7, 'FATIM', 'Aicha', 'Vacataire');
INSERT INTO Enseignant (idenseignant, Nom, Prenom, status) VALUES(8, 'ZNATY','Imad', 'Vacataire');
INSERT INTO Enseignant (idEnseignant, Nom, Prenom, status) VALUES(9, 'KASSIM', 'Ahmed', 'Vacataire');


select * from cours;

SELECT intitule from cours;

SELECT token(idcours),idcours from cours;

SELECT nom from enseignant where idenseignant = 4;

SELECT intitule from cours where responsable = 1 ALLOW FILTERING ;

SELECT intitule from cours where responsable = 1 ;
// if we CREATE an index on responsable  we don't need ALLOW filtering

CREATE INDEX nbrHMax_Index on cours (nbheuresmax) ;
SELECT intitule from cours where nbheuresMax = 30;

SELECT intitule from cours where nbheuresMax >= 30 ALLOW FILTERING;
// 'ALLOW FILTERING' is nedeed when using >= ou <=

SELECT intitule from cours where responsable = 1 and niveau = 'M1' ALLOW FILTERING ;


SELECT token(idcours),intitule from cours where idCours <= 5 ALLOW FILTERING ;

SELECT count(intitule) as numberOfRows from cours where idCours <= 5 ALLOW FILTERING ;

CREATE TABLE matableList (id int PRIMARY KEY , list_col list <int>);
INSERT INTO matableList (id, list_col ) values (1, [1,2,1]);
SELECT * FROM matableList ;


CREATE TABLE matableSet (id int PRIMARY KEY , set_col set <int>);
INSERT INTO matableSet (id, set_col ) values (1, {'head', 'tail', 'head'});
// InvalidRequest: Error from server: code=2200 [Invalid query]
// message="Invalid set literal for set_col: value 'head' is not of type int"
// because of head duplicated 2 times
SELECT * FROM matableSet ;


CREATE TABLE matableMap (id int PRIMARY KEY , map_col map <int, text>);
INSERT INTO matableMap (id, map_col ) values (1,{ 1:'one', 2:'two', 1:'dupe'});
SELECT * FROM matableMap ;
