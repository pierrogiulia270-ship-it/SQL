USE ScuolaDb;
GO

/*
STORED PROCEDURE
        Cos'è una Stored Procedure

        Una Stored Procedure è:

        codice SQL salvato
        riutilizzabile
        eseguibile con EXEC
*/


-- =============================================
-- Author:	Moussa
-- Create date: 28/05/2026
-- Description:	Restitusce la lis degli studenti
-- =============================================
ALTER PROCEDURE sp_GetAllStudenti
AS
BEGIN
	SELECT 
        StudenteId,
        ISNULL(Nome + ' - ' + Cognome, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, Email), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
	FROM Studenti
    ORDER BY Nome ASC
END
GO



