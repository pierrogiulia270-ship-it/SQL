-- LISTA DOCENTI corso, Lezioni, aula, colonne da restituire: nome + cognome docente,
-- Nome corso, nome aula, descrizione corso, aula, durata lezione


-- Lezioni <-> Aule <- Corsi
-- Iscrizione <-> Studenti <- Corsi
-- DocentiCorso <- Docenti


SELECT 
    d.Nome + ' ' + d.Cognome as 'Nome Completo Docente',
    c.NomeCorso as 'Nome Corso',
    c.DescrizioneCorso as 'Descrizione Corso',
    a.NomeAula as 'Nome Aula',
    l.OraInizio as Inizio,
    l.OraFine,
    DATEDIFF(MINUTE, l.OraInizio, l.OraFine) AS DurataLezione
from docenti d
JOIN DocentiCorso as dc
    on d.DocenteId = dc.DocenteId
JOIN Corsi as c
    on c.CorsoId = dc.CorsoId
join Lezioni as l
    on l.CorsoId = c.CorsoId
JOIN Aule as a
    on a.AulaId = l.AulaId

SELECT * FROM Lezioni
