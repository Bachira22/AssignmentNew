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