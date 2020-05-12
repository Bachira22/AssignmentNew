create table Products(
ProductsId int identity(1,1),
ProductName varchar (max),
ProductDescription  varchar (max),
ProductPrice int,
ProductImage  varchar (max)
)
insert into Products(ProductName, ProductDescription, ProductPrice, ProductImage)
values ('Paracetamol', 'Pain Killer', 2000,'iis.png')




select * from Products