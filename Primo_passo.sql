-- creazione database in sql server
create database ScuolaDB;
GO

-- come usare il database
use ScuolaDB;
GO

/* 
    Tipi di dati in SQL server
    INT => INTERO (1 A 1000000)
    CHAR => 'A' 'B' (16) 'default'
    NVARCHAR(MAX, 1000) => TESTO = 64
    VARCHAR(MAX, 700) = 3
    DECIMAL = 1.0

  creazione delle tabella Studenti
    create table "nome della tabella"(
    COLONNE (ID) TIPO (VALORE)
    )
*/

CREATE table studenti(
    StudenteId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL, 
    Email NVARCHAR (150) UNIQUE NULL,
    CodiceFiscale CHAR(16) UNIQUE NOT NULL,
    DataNascita DATE NULL,
    Telefono NVARCHAR(20) UNIQUE NULL
);

/* 
     Select restituisce ill record di tutte le colonne
     SELECT 
         *
     FROM tabella (studenti)
*/



SELECT 
      *
FROM Studenti;

/*
      Inserimento dei dati
      INSERT INTO 
           Tabella(Nome, Cognome, Email, CodiceFiscale, Datanascita, Telefono)
      VALUES 'Anna', 'Maria', ''a.maria@gmail.com, 'MRNANN02L36T278H' '1985/05/12', 3388482722)
*/


INSERT INTO 
           Studenti(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
VALUES ('Anna', 'Maria', 'a.maria@gmail.com', 'MRNANN02L36T278H', '1985/05/12', '3388485722'),


INSERT INTO 
           Studenti(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
VALUES ('Maria', 'Rossi', 'm.rossi@gmail.com', 'MRNAPN02L36T278H', '1974/07/14', '3388782732'),
('Luca', 'Bianchi', 'l.bianchi@gmail.com', 'LMNANN02L36T278H', '1993/02/18', '3388452722'),
('Mario', 'Lene', 'm.mlene@gmail.com', 'MLNANN02L36T278H', '1997/05/25', '3388482782'),
('Serena', 'Mantovani', 's.mantovani@gmail.com', 'MNTANN02L36T278H', '1972/09/02', '3386482722');

SELECT * FROM Studenti

SELECT Nome, Cognome, Email
FROM Studenti 
WHERE StudenteId = 1;

--creare tabella corsi
create table Corso(

	CorsoID int not null primary key identity (1,1),
	NomeCorso nvarchar(100) not null,
	DescrizioneCorso nvarchar(256) not null,
	Crediti int null,
    Durata int null
);

select * from Corso

--creare tabella docenti
create table Docenti(
	DocenteID int not null primary key identity (1,1),
	Nome nvarchar(50) not null,
	Cognome nvarchar(50) not null,
	Email nvarchar(150) unique null,
	Specializzazione nvarchar(100) null
	);

	select * from Docenti;

--crazione tabella aule
create table Aule(
	AulaID int not null primary key identity (1,1),
	NomeAula nvarchar(150)  not null,
	Capacita int not null
);
select * from Aule

--chiave esterna (foreign key) di una tabella
--creazione tabella iscrizione -> corsi

create table Iscrizioni(
	IscrizioneID int not null primary key identity (1,1),
	StudenteId int not null,-- collegamento tabella Studenti
	CorsoID int not null, -- collegamento tab corso
	DataIscrizione date not null,
--vincoli di relazione (foreign key)
foreign key (StudenteId) references Studenti(StudenteId),
foreign key (CorsoID) references Corso(CorsoID)
);
select * from Iscrizioni;

--creazione tabella lezioni
create table Lezioni(
	LezioneID int not null primary key identity (1,1),
	CorsoID int not null,
	AulaID int not null,
	DataLezione date not null,
	Orainizio time,
	Orafine time,
	foreign key (CorsoID) references Corso(CorsoID),
	foreign key (AulaID) references Aule(AulaID)
);
select * from Lezioni;

--creazione tabella  Docenti in corso

create table DocentiCorso(
	ID int not null primary key identity (1,1),
	DocenteID int not null, 
	CorsoID int not null,
foreign key (DocenteID) references Docenti(DocenteID),
foreign key (CorsoID) references Corso(CorsoID)
);

/*
per modificare degli errori in sql:
sp_rename	
scrivi sotto quello che vuoi modificare
CorsoID int not null primary key identity (1,1),
	NomeCorso nvarchar(100) not null,
	DescrizioneCorso nvarchar(100) not null,
	Crediti int not null,------questo va null
    Durata float not null------ questo va int
EXEC sp_rename 'Corso.Crediti', 'CREDITI' ti modifica il nome
ALTER TABLE "nome della tabella"
ALTER COLUMN "Nome nuovo tipo"

alter table Corso
aleter column Durata int not null
NB per le colonne messe in relazione non si possono fare?

*/

/*
esercizio: cambiare la colonna DataIscrizione 
con aggiunta valore di default su tabella di Iscrizione

ALTER TABLE iscrizioni
ADD CONSTRAINT DF_Iscrizioni_DataIscrizione
DEFAULT Getdate() for DataIscrizione 
= GETDATE() usa la data del giorno come default
*/

ALTER TABLE Iscrizioni
ADD CONSTRAINT DF_Iscrizioni_DataIscrizione
DEFAULT Getdate() for DataIscrizione 
select * from Iscrizioni;