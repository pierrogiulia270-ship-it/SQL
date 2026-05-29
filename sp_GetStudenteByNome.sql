CREATE PROCEDURE sp_GetStudenteByNome
	@Nome NVARCHAR(100) 
AS
BEGIN
	SELECT 
		ISNULL(Nome + ' - ' + Cognome, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, Email), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
	FROM Studenti
	WHERE Nome LIKE '%' + @Nome + '%';
END