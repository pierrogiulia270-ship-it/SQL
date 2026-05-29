-- ================================================
-- Template generated from Template Explorer using:
USE ScuolaDb;
GO

-- =============================================
-- Author:	Moussa
-- Create date: 28/05/2026
-- Description:	Restitusce la lis degli studenti
-- =============================================
CREATE PROCEDURE sp_UpdateStudente 
	-- Add the parameters for the stored procedure here
	@StudenteId INT,
	@Nome NVARCHAR(100),
	@Cognome VARCHAR(100),
	@Email VARCHAR(150),
	@Cf CHAR(16),
	@DataNascita Date,
	@Telefono VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Studenti
	SET
		Nome = @Nome,
		Cognome = @Cognome,
		Email = @Email,
		CodiceFiscale = @Cf,
		DataNascita = @DataNascita,
		Telefono = @Telefono
	WHERE StudenteId = @StudenteId
END
GO
