USE ScuolaDb;
GO
-- =============================================
-- Author:		Luisa/Luigia/Laura
-- Create date: 28/05/2026
-- Description:	Delete Studente con ID come parametro
-- =============================================
CREATE PROCEDURE sp_DeleteStudenteByID
	@StudenteId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE  from Studenti   
	WHERE StudenteId = @StudenteId; 
END
GO
