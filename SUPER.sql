DROP TABLE PET;
DROP TABLE PET_OWNER;
DROP TABLE BREED;
CREATE TABLE PET_OWNER(
	OwnerID			INT				NOT NULL IDENTITY(0, 1),
	OwnerLastName 	NVARCHAR(16)	NULL,
	OwnerFirstName	NVARCHAR(16)	NULL,
	OwnerPhone		INT				NULL,
	OwnerEmail		NVARCHAR(64)	NULL UNIQUE,
	CONSTRAINT		PET_OWNER_PK	PRIMARY KEY(OwnerID)
);
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
	
	Alter PROC GetPetOwner
	AS
		BEGIN
			SELECT * FROM PET_OWNER
		END
	GO

CREATE TABLE BREED(
	BreedName 				NVarChar(100)	NOT NULL UNIQUE,
	MinWeight				Float			NULL,
	MaxWeight				Float			NULL,
	AverageLifeExpendency	Int				NULL,
	Constraint				BREED_PK		PRIMARY KEY(BreedName)
);
GO

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
	
	ALTER PROC GetBreed
	AS
		BEGIN
			SELECT * FROM BREED
		END;
	GO
	

CREATE TABLE PET(
	PetID		INT				NOT NULL IDENTITY(0, 1),
	PetName		NVARCHAR(16)	NULL,
	PetType		NVARCHAR(16)	NULL,
	PetBreed	NVARCHAR(100)	NOT NULL,
	PetDOB		DATETIME2		NULL,
	PetWeight	FLOAT(1)		NULL,
	OwnerID		INT				NULL,
	CONSTRAINT	PET_PK			PRIMARY KEY(PetID),
	CONSTRAINT	Pet_PetOwner_FK	FOREIGN KEY(OwnerID)
		REFERENCES PET_OWNER(OwnerID)
			ON DELETE NO ACTION,
	CONSTRAINT breedname_FK FOREIGN KEY (PetBreed) 
		REFERENCES BREED(BreedName),
);
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
	
	ALTER PROC GetPet
	AS
		BEGIN
			SELECT * FROM PET
		END
	GO
	

EXEC InsertBreed 'Border Collie', 15, 22.5, 20
EXEC InsertBreed 'Cashmere', 10, 15, 12
EXEC InsertBreed 'Collie Mix', 17.5, 25, 18
EXEC InsertBreed 'Std. Poodle', 25.5, 30, 18
EXEC InsertBreed 'Unknown'

EXEC InsertPetOwner 'Larsen', 'Hans', 20506010, 'LH@Mail.com'
EXEC InsertPetOwner 'Nielsen', 'Alan', 40806010, 'NA@Mail.com'
Exec InsertPetOwner 'Tøjdyr', 'Tove', 88888888, 'TT@Mail.com'

EXEC InsertPet 'Futte', 'DOG', 'Collie Mix', '2005-06-14'

EXEC GetBreed
EXEC GetPet
EXEC GetPetOwner
