ALTER PROC InsertBreed
(
	@BreedName 				NVarChar(100)	=NULL,
	@MinWeight				Float			=NULL,
	@MaxWeight				Float			=NULL,
	@AverageLifeExpendency	Int				=NULL
)
AS
	BEGIN
		INSERT INTO BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpendency)
		VALUES (@BreedName, @MinWeight, @MaxWeight, @AverageLifeExpendency)
	END;

GO
ALTER PROC InsertPetOwner
(
	@OwnerLastName 	NVARCHAR(16)	=NULL,
	@OwnerFirstName	NVARCHAR(16)	=NULL,
	@OwnerPhone		INT				=NULL,
	@OwnerEmail		NVARCHAR(64)	=NULL
)
AS
	BEGIN
		INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
		VALUES (@OwnerLastName, @OwnerFirstName, @OwnerPhone, @OwnerEmail)
	END;

GO
ALTER PROC InsertPet
(
	@PetName		NVARCHAR(16)	=NULL,
	@PetType		NVARCHAR(16)	=NULL,
	@PetBreed		NVARCHAR(100)	='Unknown',
	@PetDOB			DATETIME2		=NULL,
	@PetWeight		FLOAT(1)		=NULL,
	@OwnerID		INT				=NULL
)
AS
	BEGIN
		INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID)
		VALUES (@PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID)
	END;

GO