USE ScuolaDb
GO


CREATE PROCEDURE sp_StudentiScrittiAiCorsi
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
        s.StudenteId,
        ISNULL(Nome + ' - ' + Cognome, 'Nome completo noon presente') AS [Nome completo],
        ISNULL(CONVERT(NVARCHAR, DataNascita, 103), 'N/D') AS DataNascita,
        ISNULL(CONVERT(NVARCHAR, Email), 'N/E') AS Email,
        ISNULL(CONVERT(NVARCHAR, Telefono), '0000000000') AS Telefono,
        ISNULL(CONVERT(CHAR(16), CodiceFiscale), 'CF-NULL') AS CodiceFiscale,
		ISNULL(CONVERT(NVARCHAR, c.NomeCorso), 'N/D') AS Corso,
		ISNULL(CONVERT(NVARCHAR, c.DescrizioneCorso), 'N/D') AS [Corso Descrizione]
	FROM Studenti s
	JOIN Iscrizioni i 
		ON s.StudenteId = i.StudenteId
	JOIN Corsi c
		ON i.CorsoId = c.CorsoId;

END
GO
