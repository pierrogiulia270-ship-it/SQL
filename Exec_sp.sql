USE ScuolaDb;
GO

-- Lista Studenti
EXEC sp_GetAllStudenti;

-- Studente con id del parametro
EXEC sp_GetStudenteById 7;

-- Cerca lo Studente tramite(dentro) il Nome del parametro
EXEC sp_GetStudenteByNome 'B';
EXEC sp_GetStudenteByNome @Nome = 'Miranda'

-- Inserimento dello studente
EXEC sp_InsertStudente 'Massimo', 'Zangardo', 'z.massimo@ferrari.it', 'MZD789OP23PC08PZ', '1985/02/10', '+3353894510'

-- Aggiornamento dello studente
EXEC sp_UpdateStudente 50, 'Miranda', 'Baldo', 'm.baldo@gmail.com', 'MZD789OP23PMI45', '1985/02/10', '+3353894510'

-- Elemina lo studente con l'id del parametro
EXEC sp_DeleteStudenteById 50;

-- Lista degli studenti scritti ai corsi
EXEC sp_StudentiScrittiAiCorsi;