CREATE TABLE UserDetails (
    UserDetailsID int IDENTITY(1,1) PRIMARY KEY,
    UserId int,
    FirstName varchar(255),
    LastName varchar(255),
    Gender char,
    Address varchar(max),
    MobileNumber varchar(255),
    Profession char,
    EmailAddress varchar(255)
    );

Create Table Users (
	UserId int IDENTITY(1,1) PRIMARY KEY,
	Username varchar (255),
	UserPassword varchar (255)
	);
