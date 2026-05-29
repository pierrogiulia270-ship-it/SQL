USE ScuolaDb;
GO

/*
    =========================================
    SELECT TOP
    =========================================

    TOP serve per limitare il numero di righe
    restituite dalla query.
*/

-- Mostra i primi 10 studenti
SELECT TOP 10
    *
FROM Studenti;

-- Mostra i primi 10 studenti con data di nascita presente
SELECT TOP 10
    *
FROM Studenti
WHERE DataNascita IS NOT NULL;

-- Mostra i primi 10 studenti senza data di nascita
SELECT TOP 10
    *
FROM Studenti
WHERE DataNascita IS NULL;



/*
    =========================================
    FUNZIONI DI AGGREGAZIONE
    =========================================

    Le funzioni di aggregazione servono per:
        - contare dati
        - calcolare medie
        - sommare valori
        - trovare il minimo
        - trovare il massimo

    Principali funzioni:
        COUNT() → Conta
        AVG()   → Media
        SUM()   → Somma
        MIN()   → Valore minimo
        MAX()   → Valore massimo
*/

-- Conta il numero totale degli studenti
SELECT
    COUNT(*) AS TotaleStudenti
FROM Studenti;

-- Calcola la durata media dei corsi
SELECT
    AVG(Durata) AS DurataMedia
FROM Corso;

-- Calcola la media dei crediti
SELECT
    AVG(Crediti) AS MediaCrediti
FROM Corso;

-- Somma totale dei crediti
SELECT
    SUM(Crediti) AS TotaleCrediti
FROM Corso;

-- Statistiche complete sui corsi
SELECT
    COUNT(*)      AS TotaleCorsi,
    AVG(Crediti)  AS MediaCrediti,
    SUM(Crediti)  AS SommaCrediti,
    MIN(Crediti)  AS CreditoMinimo,
    MAX(Crediti)  AS CreditoMassimo
FROM Corso;



/*
    =========================================
    OPERATORE LIKE
    =========================================

    LIKE serve per cercare valori simili.

    Simboli principali:
        %  → qualsiasi sequenza di caratteri
        _  → un solo carattere
*/

-- Studenti con:
--  - data di nascita presente
--  - nome che inizia con G
SELECT
    *
FROM Studenti
WHERE DataNascita IS NOT NULL
    AND Nome LIKE 'G%';



/*
    =========================================
    OPERATORE BETWEEN
    =========================================

    BETWEEN serve per filtrare valori
    compresi in un intervallo.
*/

-- Mostra i corsi con crediti tra 10 e 50
-- ordinati dal maggiore al minore
SELECT
    *
FROM Corso
WHERE Crediti BETWEEN 10 AND 50
ORDER BY Crediti DESC;



/*
    =========================================
    JOIN
    =========================================

    Una JOIN serve per unire dati
    provenienti da più tabelle.

    Tipi principali:
        INNER JOIN
        LEFT JOIN
        RIGHT JOIN
        FULL JOIN

    Sintassi base:

    SELECT colonne
    FROM Tabella1
    JOIN Tabella2
        ON Tabella1.Id = Tabella2.Id;
*/



/*
    =========================================
    INNER JOIN
    =========================================

    INNER JOIN mostra SOLO i record
    che hanno corrispondenza in entrambe
    le tabelle.
*/

-- Unisce Studenti e Iscrizioni
SELECT
    Studenti.Nome,
    Studenti.Cognome,
    Iscrizioni.CorsoId,
    Iscrizioni.DataIscrizione
FROM Studenti
INNER JOIN Iscrizioni
    ON Studenti.StudenteId = Iscrizioni.StudenteId;


-- Studenti iscritti ai corsi
SELECT DISTINCT
    s.Nome + ' ' + s.Cognome AS NomeStudente,
    s.CodiceFiscale          AS CodiceFiscale,
    c.NomeCorso              AS NomeCorso,
    c.DescrizioneCorso       AS Descrizione,
    i.DataIscrizione         AS DataIscrizione,
    c.Durata                 AS DurataCorso
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
INNER JOIN Corso AS c
    ON i.CorsoId = c.CorsoId;



/*
    =========================================
    LEFT JOIN
    =========================================

    LEFT JOIN mostra:
        - tutti i record della tabella sinistra
        - anche se non esiste corrispondenza
          nella tabella destra

    Differenza:

    INNER JOIN
        Mostra solo dati collegati

    LEFT JOIN
        Mostra tutti i dati della tabella
        principale anche senza collegamenti
*/

-- Mostra tutti gli studenti
-- anche quelli senza iscrizioni
SELECT
    s.Nome,
    s.Cognome,
    s.CodiceFiscale,
    c.NomeCorso,
    c.DescrizioneCorso,
    c.Durata,
    i.DataIscrizione
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corso AS c
    ON c.CorsoId = i.CorsoId;


-- Studenti iscritti a un corso
SELECT TOP 5
    s.Nome,
    s.Cognome,
    s.CodiceFiscale,
    c.NomeCorso,
    c.DescrizioneCorso,
    c.Durata,
    i.DataIscrizione
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corso AS c
    ON c.CorsoId = i.CorsoId
WHERE c.NomeCorso IS NOT NULL
    AND s.Nome LIKE '%a';


-- Studenti senza corsi
SELECT TOP 5
    s.Nome,
    s.Cognome,
    s.CodiceFiscale,
    c.NomeCorso,
    c.DescrizioneCorso,
    c.Durata,
    i.DataIscrizione
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corso AS c
    ON c.CorsoId = i.CorsoId
WHERE c.NomeCorso IS NULL
    AND s.Nome LIKE '%a';



/*
    =========================================
    JOIN CON FILTRI
    =========================================
*/

-- Mostra i primi 10 studenti iscritti
SELECT TOP 10
    s.Nome,
    s.Cognome,
    s.CodiceFiscale,
    i.DataIscrizione
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId;



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