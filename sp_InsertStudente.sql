USE ScuolaDb;
GO

-- =============================================
-- Author:	Moussa
-- Create date: 28/05/2026
-- Description:	Restitusce la lis degli studenti
-- =============================================
CREATE PROCEDURE sp_InsertStudente
	@Nome NVARCHAR(100),
	@Cognome VARCHAR(100),
	@Email VARCHAR(150),
	@Cf CHAR(16),
	@DataNascita Date,
	@Telefono VARCHAR(50)
AS 
BEGIN
	INSERT INTO Studenti
		(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
	VALUES
		(@Nome, @Cognome, @Email, @Cf, @DataNascita, @Telefono);
END
GO

