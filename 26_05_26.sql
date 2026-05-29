/*
    =========================================
    RIGHT JOIN
    =========================================

    RIGHT JOIN mostra:
        - tutti i record della tabella destra
        - anche senza corrispondenza
          nella tabella sinistra
*/

-- Esempio teorico:
-- Docenti, Corsi, Aule, Lezioni

-- Lezioni <-> Aule <- Corsi
-- Iscrizione <-> Studenti <- Corsi
-- DocentiCorso <- Docenti

-- Da fare: Recurerare le studente, il corso, l'aula, Docente, lezione
SELECT * FROM Docenti

SELECT
    *
FROM Studenti s
JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
JOIN Corsi c
    ON c.CorsoId = i.CorsoId
JOIN Lezioni l
    ON l.CorsoId = c.CorsoId
JOIN Aule a
    ON a.AulaId = l.AulaId


SELECT
    *
FROM Studenti s
left JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
left JOIN Corsi c
    ON c.CorsoId = i.CorsoId
left JOIN Lezioni l
    ON l.CorsoId = c.CorsoId
left JOIN Aule a
    ON a.AulaId = l.AulaId
left JOIN DocentiCorso dc 
    ON dc.CorsoId = c.CorsoId
left JOIN Docenti d
    ON d.DocenteId = dc.DocenteId
----------------------------------------------------------
select
  Nome + ' ' + Cognome as Studente, 
  ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'D/N') AS DataNascita
from Studenti
Order by DataNascita DESC



SELECT
    s.Nome + ' ' + s.Cognome as Studente,
    c.NomeCorso as 'Nome Corso',
    c.DescrizioneCorso as 'Descrizione Corso',
    l.OraInizio,
    l.DataLezione,
    a.NomeAula,
    d.Nome + ' ' + d.Cognome AS Docente,
    d.Email as 'Docente Mail',
    d.Specializzazione as Materia 
FROM Studenti s
JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
JOIN Corsi c
    ON c.CorsoId = i.CorsoId
JOIN Lezioni l
    ON l.CorsoId = c.CorsoId
JOIN Aule a
    ON a.AulaId = l.AulaId
JOIN DocentiCorso dc 
    ON dc.CorsoId = c.CorsoId
JOIN Docenti d
    ON d.DocenteId = dc.DocenteId
Order by Studente ASC

SELECT 
    --ISNULL(CONVERT(VARCHAR, YEAR(DataLezione), 103), 'N/D') AS DataLezione,
    ISNULL(CONVERT(VARCHAR, DataLezione, 109), 'N/D') AS DataLezione,
    --ISNULL(CONVERT(VARCHAR, MONTH(DataLezione), 113), 'N/D') AS Mese,
    --ISNULL(CONVERT(VARCHAR, DataLezione, 108), 'N/D') AS Mese_Ora,
    --ISNULL(CONVERT(VARCHAR, OraInizio, 108), 'N/D') AS Inizio ,
   
   -- 12:00:50
   ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'ORA NON DEFINITA') AS Inizio,
    --ISNULL(CONVERT(VARCHAR, OraFine, 108), 'N/D') AS Fine,
    ISNULL(Left(CONVERT(VARCHAR, OraFine, 108), 5), 'N/D') AS Fine
    ----ISNULL(Right(CONVERT(VARCHAR, OraFine, 108), 2), 'N/D') AS Fine

FROM Lezioni


-- RIGHT JOIN 
SELECT
    ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non assegnato') as Studente,
    ISNULL(c.NomeCorso, 'N/A') as 'Nome Corso',
    ISNULL(c.DescrizioneCorso, 'N/A') as 'Descrizione Corso',
    ISNULL(CONVERT(VARCHAR, DataLezione, 109), 'N/D') as DataLezione,
    ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'ORA NON DEFINITA') as Inizio,
    ISNULL(Left(CONVERT(VARCHAR, OraFine, 108), 5), 'N/D') AS Fine,
    ISNULL(a.NomeAula, 'N/D') AS NomeAula,
    ISNULL(d.Nome + ' ' + d.Cognome, 'Docente non assegnato') AS Docente,
    ISNULL(d.Email, 'N/D') as 'Docente Mail',
    ISNULL(d.Specializzazione, 'N/D') as Materia 
FROM Studenti s
RIGHT JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
RIGHT JOIN Corsi c
    ON c.CorsoId = i.CorsoId
RIGHT JOIN Lezioni l
    ON l.CorsoId = c.CorsoId
RIGHT JOIN Aule a
    ON a.AulaId = l.AulaId
RIGHT JOIN DocentiCorso dc 
    ON dc.CorsoId = c.CorsoId
RIGHT JOIN Docenti d
    ON d.DocenteId = dc.DocenteId
Order by Studente ASC