CREATE TABLE PET_OWNER(
	OwnerID			INT				NOT NULL IDENTITY(0, 1000000),
	OwnerLastName 	NVARCHAR(16)	NULL,
	OwnerFirstName	NVARCHAR(16)	NULL,
	OwnerPhone		INT				NULL,
	OwnerEmail		NVARCHAR(64)	NULL UNIQUE,
	CONSTRAINT		PET_OWNER_PK	PRIMARY KEY(OwnerID)
);