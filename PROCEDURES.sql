CREATE PROC InsertPet
(
	@PetName		NVARCHAR(16)	=NULL,
	@PetType		NVARCHAR(16)	=NULL,
	@PetBreed		NVARCHAR(100)	=NULL,
	@PetDOB			DATETIME2		=NULL,
	@PetWeight		FLOAT(1)		=NULL,
	@OwnerID		INT				=NULL
)
AS
	BEGIN
		INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
		VALUES (@PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID)
	END