ALTER PROC InsertPetOwner
(
	@OwnerLastName 	NVARCHAR(16)	NULL,
	@OwnerFirstName	NVARCHAR(16)	NULL,
	@OwnerPhone		INT				NULL,
	@OwnerEmail		NVARCHAR(64)	NULL
)
AS
	BEGIN
		INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
		VALUES (@OwnerLastName, @OwnerFirstName, @OwnerPhone, @OwnerEmail)
	END;