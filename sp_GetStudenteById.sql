USE ScuolaDb;
GO

-- =============================================
-- Author:		MOUSSA
-- Create date: 28/05/2026
-- Description:	Restituisce lo studente con l'id del parametro
-- =============================================
CREATE PROCEDURE sp_GetStudenteById
	-- Add the parameters for the stored procedure here
	@StudenteId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		ISNULL(Nome + ' - ' + Cognome, 'Nome completo non presente') AS 'Nome completo ',
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, Email), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale
	FROM Studenti
	WHERE StudenteId = @StudenteId
END
GO

