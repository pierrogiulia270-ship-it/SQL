USE ScuolaDb;
GO 


-- Restituisce la lista delle tabelle 
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

/*
	Operatori di confronto

	Servono per confrontare valori:
		| Operatore | Significato       |
		| --------- | ----------------- |
		| `=`       | uguale            |
		| `!=`      | diverso           |
		| `<>`      | diverso           |
		| `>`       | maggiore          |
		| `<`       | minore            |
		| `>=`      | maggiore o uguale |
		| `<=`      | minore o uguale   |

*/

-- Esempio — studenti nati dopo il 2000
SELECT *
FROM Studenti
WHERE DataNascita > '2000-01-01';


select * from Studenti


-- Operatori logici 
/*
	| Operatore | Significato        |
	| --------- | ------------------ |
	| `AND`     | tutte vere         |
	| `OR`      | almeno una vera    |
	| `NOT`     | nega la condizione |
	| `IS NULL` | valore nullo       |

*/

SELECT 
    Nome + ' ' + Cognome AS 'Nome completo',
    Telefono
FROM Studenti
WHERE DataNascita IS NULL;

SELECT 
	Nome + ' ' + Cognome AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE DataNascita IS NULL AND Nome = 'Mario'



/*
Spiegazione

La query restituisce:
	studenti chiamati Mario
	E con DataNascita mancante
	Entrambe le condizioni devono essere vere.
*/
SELECT 
	Nome + ' ' + Cognome AS 'Nome completo',
	CodiceFiscale,
	Telefono,
	DataNascita
FROM Studenti
WHERE DataNascita >= '1985' AND DataNascita <= '2000'
ORDER BY DataNascita ASC

/*
	Spiegazione della Concattenazione
		Unisce Nome e Cognome.
		AS(Alias) rinomina la colonna nel risultato.
*/

/*
	La query sotto è equivalente a:
	SELECT 
		Nome + ' ' + Cognome AS 'Nome completo',
		CodiceFiscale,
		Telefono
	FROM Studenti
	WHERE Nome = 'Mario'
	   OR Nome = 'Luca'
	   OR Nome = 'Giulia'
	   OR Nome = 'Chiara'
*/
SELECT 
	Nome + ' ' + Cognome AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE Nome IN ('Mario', 'Luca', 'Giulia','Chiara')


/*
	IN con ID
	Permette di cercare più valori.

	Spiegazione del Order by 
		Ordina dalla data più vecchia alla più recente.
		| Keyword | Significato |
		| ------- | ----------- |
		| `ASC`   | crescente   |
		| `DESC`  | decrescente |
*/

SELECT 
	Nome + ' ' + Cognome AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE StudenteId IN (10, 20, 8 ,7, 1)
ORDER BY Nome ASC -- Ordinamento con ORDER BY

SELECT DISTINCT -- Rimuove i duplicati
	StudenteId,
	Nome + ' ' + Cognome AS 'Nome completo'
FROM Studenti;



-- BETWEEN
SELECT 
	* 
FROM Corso 
WHERE Crediti BETWEEN 10 AND 50
ORDER BY Crediti ASC;

/*
	Serve per cercare testi.
	| Pattern | Significato   |
	| ------- | ------------- |
	| `M%`    | inizia con M  |
	| `%o`    | finisce con o |
	| `%a%`   | contiene a    |
	| `_`     | un carattere  |

*/
SELECT 
	Nome + ' ' + Cognome AS 'Nome completo',
	CodiceFiscale,
	Telefono
FROM Studenti
WHERE Nome LIKE 'M%' -- nomi che iniziano con M
	or Nome LIKE '%a' -- oppure finiscono con a