/*
Studenti iscritti ad un corso. Campi da restituire:
nome completo studente
codice fiscale studente
nome del corso
descrizione del corso
*/
SELECT
    Nome + '' + Cognome as 'Nome completo studente',
    CodiceFiscale,
    C.NomeCorso as 'Nome del corso',
    C.DescrizioneCorso as 'Descrizione del corso'
from Studenti as S
join Iscrizioni as I
    on S.StudenteId = I.StudenteId
join Corsi as C
    on I.CorsoId = C.CorsoId

