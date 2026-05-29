use ScuolaDb;
Go

-- Inserimente dati Studenti
INSERT INTO Studenti
(
    Nome,
    Cognome,
    DataNascita,
    Email,
    Telefono,
    CodiceFiscale
)
VALUES
('Mario', 'Rossi', NULL, 'mario2.rossi@libero.it', '+393874665', 'HFJFNVJIEIWJSFB'),
('Luca', 'Bianchi', NULL, 'luca.bianchi@libero.it', '+393874659', 'LCABNC01A01H501'),
('Giulia', 'Verdi', NULL, 'giulia.verdi@gmail.com', '+393874660', 'GLIVRD02B12F205'),
('Anna', 'Ferrari', NULL, 'anna.ferrari@yahoo.it', '+393874661', 'NNAFRR03C23L219'),
('Marco', 'Romano', NULL, 'marco.romano@outlook.it', '+393874662', 'MRCRMN04D14G273'),
('Sara', 'Gallo', NULL, 'sara.gallo@icloud.com', '+393874663', 'SRAGLL05E55C351'),
('Davide', 'Conti', NULL, 'davide.conti@virgilio.it', '+393874664', 'DVDCNT06F66D612'),
('Mario','Rossi',NULL,'mario.rossi@libero.it','+393823493834','RSIMRT45E33T494K'),

('Mario','Rossi','2000-01-10','mario.rossi1@email.com','300000001','RSSMRA00A10H501A'),
('Luca','Bianchi','1999-03-15','luca.bianchi2@email.com','300000002','BNCLCU99C15F205B'),
('Anna','Verdi','2001-07-20','anna.verdi3@email.com','300000003','VRDANN01L20H501C'),
('Marco','Neri','1998-11-05','marco.neri4@email.com','300000004','NRIMRC98S05F205D'),
('Sara','Blu','2002-02-28','sara.blu5@email.com','300000005','BLUSRA02B28H501E'),
('Paolo','Gialli',NULL,'paolo.gialli6@email.com','300000006','GLLPLA90A01H501F'),
('Giulia','Rosa','2000-06-12','giulia.rosa7@email.com','300000007','RSOGLI00H12F205G'),
('Davide','Conti','1997-09-09','davide.conti8@email.com','300000008','CNTDVD97P09H501H'),
('Elena','Ferrari','2001-04-18','elena.ferrari9@email.com','300000009','FRRLNE01D18F205I'),
('Simone','Greco','1999-12-30','simone.greco10@email.com','300000010','GRCSMN99T30H501J'),

('Alessia','Romano','2002-08-14','alessia.romano11@email.com','300000011','RMNLSS02M14F205K'),
('Matteo','Colombo','2000-10-01','matteo.colombo12@email.com','300000012','CLMMTT00R01H501L'),
('Francesca','Ricci','1998-01-22','francesca.ricci13@email.com','300000013','RCCFNC98A22F205M'),
('Andrea','Marino','2001-05-05','andrea.marino14@email.com','300000014','MRNNDR01E05H501N'),
('Chiara','Lombardi','1999-07-17','chiara.lombardi15@email.com','300000015','LMBCHR99L17F205O'),
('Stefano','Moretti',NULL,'stefano.moretti16@email.com','300000016','MRTSFN90A01H501P'),
('Valentina','Barbieri','2000-03-03','valentina.barbieri17@email.com','300000017','BRBVLT00C03F205Q'),
('Giorgio','Fontana','1997-06-25','giorgio.fontana18@email.com','300000018','FNTGRG97H25H501R'),
('Martina','Santoro','2002-09-11','martina.santoro19@email.com','300000019','SNTMRT02P11F205S'),
('Alberto','Rinaldi','1998-02-07','alberto.rinaldi20@email.com','300000020','RNLALB98B07H501T'),

('Federica','Caruso','2001-11-19','federica.caruso21@email.com','300000021','CRSFDR01S19F205U'),
('Daniele','Leone','1999-04-23','daniele.leone22@email.com','300000022','LNEDNL99D23H501V'),
('Silvia','Serra','2000-12-12','silvia.serra23@email.com','300000023','SRRSLV00T12F205W'),
('Roberto','Testa','1997-08-30','roberto.testa24@email.com','300000024','TSTRRT97M30H501X'),
('Laura','De Luca','2002-01-09','laura.deluca25@email.com','300000025','DLCLRA02A09F205Y'),
('Antonio','Pellegrini','1998-05-16','antonio.pellegrini26@email.com','300000026','PLLNTN98E16H501Z'),
('Claudia','Fiore','2001-06-06','claudia.fiore27@email.com','300000027','FIOCLD01H06F205A'),
('Fabio','Costa',NULL,'fabio.costa28@email.com','300000028','CSTFBA90A01H501B'),
('Irene','Gatti','2000-09-27','irene.gatti29@email.com','300000029','GTTIRN00P27F205C'),
('Emanuele','Villa','1999-10-10','emanuele.villa30@email.com','300000030','VLLMNL99R10H501D');


SELECT * FROM Studenti;


-- Where filtra a secondo le condizione
SELECT 
	Nome, 
	Cognome,
	Email
From Studenti 
Where StudenteId = 30;


-- IS NULL / IS NOT NULL
-- RESTITURE LA LISTA DEGLI STUDENTI SENZA DATA DI NASCITA 
-- Ordina la colonna Nome in ordine decrescente = DESC 
SELECT 
    * 
FROM Studenti
WHERE DataNascita is null 
ORDER BY Nome DESC


-- RESTITURE LA LISTA DEGLI STUDENTI CON DATA DI NASCITA 
-- Ordina la colonna Nome in ordine ASCENDENTE = ASC 
SELECT 
    * 
FROM Studenti
WHERE DataNascita IS NOT NULL 
ORDER BY Nome ASC

-- CONCATENAZIONE / AS
SELECT 
   Nome + ' ' + Cognome AS 'Nome completo degli studenti',
   CodiceFiscale
FROM Studenti 

-- CREARE LA TABELLA CORSI CON 
/*
    CorsoId  int
    NomeCorso nvarchar = 100
    DescrizioneCorso
    Crediti int
    durata int
*/

-- Modifica del nome della colonna 
-- sp_rename
-- Modificazione del nome della tabella
EXEC sp_rename 'DocentiCorso', 'Docenti_Corso'

EXEC sp_rename 'DocentiCorso.Docente_In_CorsoId', 'Id'

select * from DocentiCorso;

/*
    Modifica del tipo della colonna
    ALTER TABLE NOMETABELLA
    ALTER COLUMN NOMECOLONNA NUOVOTIPO
*/
ALTER TABLE Docenti
ALTER COLUMN Specializzazione NVARCHAR(150) NOT NULL

/*
    Definizione del valore di default 
    usando (Add Constraint) sulla tabella,
    per definire il valore di default 
    come data di registrazione(GETDATE() = data in cui viene dffatta la regiatra )
*/
ALTER TABLE Iscrizioni
ADD CONSTRAINT DF_Iscrizioni_DataIscrizione
DEFAULT GETDATE() FOR DataIscrizione

SELECT * FROM Iscrizioni;