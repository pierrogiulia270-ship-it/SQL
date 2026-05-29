USE ScuolaDb;
GO

/*
	Le condizione If / else if / else (CASE)
	Sintassi

	CASE
		WHEN CONDIZIONE THEN VALORE
		ELSE VALORE
	END 
*/

SELECT 
	Nome,
	CASE
		WHEN DataNascita IS NULL THEN 'Mancante'
		ELSE 'Presente'
	END as DataNascita
FROM Studenti

select * from Corsi;

-- CASE con numeri
SELECT
	NomeCorso,
	Crediti,
	Durata,
	CASE
		WHEN Crediti < 10 THEN 'Base'
		WHEN Crediti BETWEEN 10 AND 50 THEN 'Intermedio'
		ELSE 'Avanzato'
	END AS VerificaCrediti,
	CASE 
		WHEN Durata <= 45 THEN 'Corso breve'
		WHEN Durata BETWEEN 50 AND 150 THEN 'Corso Standart'
		Else 'Corso Completo'
	END AS VerificaDurata
FROM Corsi;

/*
	Le SubQuery:
		è una query dentro un'aaltro query
	SELECT 
		Colonne
	FROM Tabella 
	where Colonna > (
		SELECT AVG(colonna) FROM tabella)
*/ 

-- Esempio:
SELECT 
	*
FROM Corsi 
where Crediti < 15

-- Verificare prima di procedere 
SELECT 
	AVG(Crediti) AS Media  
FROM Corsi; 

-- Query finale della SubQuery
SELECT 
	*
FROM Corsi 
where Crediti > (
	SELECT 
		AVG(Crediti) AS Media  
	FROM Corsi)
ORDER BY Crediti ASC


-- JOIN CON SubQuery
-- Studenti scritti a più corsi 
SELECT 
	StudenteId
FROM Iscrizioni
GROUP BY StudenteId
HAVING COUNT(*) > 1;

select * from Iscrizioni;



SELECT 
	Nome, 
	Cognome
FROM Studenti s
WHERE s.StudenteId IN (1,7,10,30);


SELECT DISTINCT
	StudenteId,
		Nome, 
		Cognome
	FROM Studenti s
	WHERE s.StudenteId IN (
		SELECT 
			StudenteId
		FROM Iscrizioni
		GROUP BY StudenteId
		HAVING COUNT(*) > 1
	);


SELECT 
	c.CorsoId,
	c.NomeCorso,
	c.DescrizioneCorso,
	c.Crediti, 
	s.Nome + ' ' + s.Cognome AS Studente,
	ISNULL(s.Email, 'Mail Non Definita') AS EMailStudente,
	ISNULL(CONVERT(VARCHAR, s.DataNascita, 104), 'Data Non Definita') AS DataNasita,
	AVG(c.Crediti) AS MediaCrediti,
	COUNT(*) AS TotaleCrediti,
	Min(c.Crediti) AS MinimoCrediti,
	Max(c.Crediti) AS MassimoCrediti,
	COUNT(c.Durata) ToTaleDurata,
	Min(c.Durata) DurataMinimo,
	Max(c.Durata) DurataMassimo
FROM Corsi c
INNER JOIN Iscrizioni i
	ON i.CorsoId = c.CorsoId
INNER JOIN Studenti s
	ON s.StudenteId = i.StudenteId
GROUP BY c.CorsoId, c.NomeCorso, 
		 c.DescrizioneCorso, s.Nome,
		 s.Cognome, s.Email, s.DataNascita,
		 c.Crediti
HAVING AVG(c.Crediti) BETWEEN 10 AND 50 
ORDER BY c.CorsoId




SELECT 
	CorsoId,
	NomeCorso,
	DescrizioneCorso,
	AVG(Crediti) AS MediaCrediti,
	COUNT(*) AS TotaleCrediti,
	Min(Crediti) AS MinimoCrediti,
	Max(Crediti) AS MassimoCrediti,
	AVG(Durata) DurataMedia,
	COUNT(Durata) ToTaleDurata,
	Min(Durata) DurataMinimo,
	Max(Durata) DurataMassimo
from Corsi
GROUP BY CorsoId, NomeCorso, DescrizioneCorso
HAVING AVG(Crediti) > 20
ORDER BY CorsoId



-- Update 
/*
	UPDATE Tabella
	   SET Colonna = valore
	 WHERE Condizione 
*/


UPDATE Iscrizioni
   SET StudenteId = 7 -- luG
 WHERE CorsoId IN (8,9,10,11,12);


UPDATE Studenti
   SET Nome = 'Luigia',
		Cognome = 'Valente'
WHERE StudenteId = 7


SELECT 
	s.StudenteId,
	s.Nome + ' ' + s.Cognome AS NomeCompleto,
	c.NomeCorso, 
	c.DescrizioneCorso
FROM Studenti s
join Iscrizioni i
	On i.StudenteId = s.StudenteId
join Corsi c
	On c.CorsoId = i.CorsoId
Where s.StudenteId = 7


select * from Corsi;


select * from Iscrizioni;

select * from Studenti Where StudenteId = 1;
select 
	* 
from Corsi
where CorsoId > 26

UPDATE Iscrizioni
   SET StudenteId = 15 -- luG
 WHERE CorsoId IN (16, 17, 18, 19, 20, 21);



 Insert into Iscrizioni (StudenteId, CorsoId) Values (1, 15)



-- Delete

select * from Iscrizioni
WHERE CorsoId = 7;

DELETE FROM Iscrizioni
WHERE CorsoId = 7;


DELETE FROM Studenti
WHERE (StudenteId = 7 and Nome = 'Luigia') AND Cognome = 'Valente';

-- Exists (Controllare un record)
/*
EXISTS controlla:
	se una query restituisce risultati
	IF EXISTS(
		SELECT 1
	FROM TABELLA
	)
	BEGIN
		Stampa / condizione / verifica
	END
	ELSE 
	BEGIN
		Condizioni /
		stampa
	END
*/

IF EXISTS(
	SELECT 1 -- non mi insteressano dati
FROM Studenti
)
BEGIN
	print 'Esistono studenti'
END
ELSE 
BEGIN
	print 'Tabella vuota'
END;

IF NOT EXISTS(
	SELECT 1
FROM Studenti
)
BEGIN
	print 'Tabella vuota'
END
ELSE 
BEGIN
	print 'Esistono studenti'
END;


-- STudenti senza data di Nascita 
IF EXISTS(
	SELECT 1
FROM Studenti
WHERE DataNascita IS NULL
)
BEGIN
	print 'Esistono studenti senza data di nascita'
END
ELSE
BEGIN 
	print 'Non Esistono studenti senza data di nascita'  
END;


SELECT 
	*
FROM Studenti;