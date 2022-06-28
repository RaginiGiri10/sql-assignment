--Creating database CustomerDB
create database CustomerDB
go
use CustomerDB
go
--Creating Table Country
create table Country(
CountryId int NOT NULL Primary Key identity(1,1),
CountryName varchar(20)
);

go
--INSERTING VALUES IN Table Country 
insert into Country
values('India'),('USA'),('England'),('France')
go
--Creating table Gender
create table Gender(
GenderId int NOT NULL Primary Key identity(1,1),
GenderType varchar(20)
);

go
--Inserting values in Table Gender
insert into Gender
values('Male'),('Female')
go
--Create table Customer
create table Customer(
ID int identity(1000,5),
Name varchar(20),
CountryId int FOREIGN KEY REFERENCES Country(CountryId),
GenderId int FOREIGN KEY REFERENCES Gender(GenderId),
);


go
--1)Inserting the records in Customer Table
insert into Customer
values('John',1,1),('Jessie',4,2),('Tina',2,2),('Thomas',3,NULL),('Johnson',2,1),('Riya',3,2),('Tommy',4,NULL),('Preeti',1,2)
go
select * from Customer
go
--2)Creating stored procededure to get all customer details
create procedure sp_ToGetAllCustomerDetailsWhichShouldDisplayIDNameGenderCountryName
as
begin
select Cr.ID,Cr.Name,G.GenderType,C.CountryName from Customer Cr
join Country C on Cr.CountryId=C.CountryId
join Gender G on Cr.GenderId=G.GenderId
end

go

execute sp_ToGetAllCustomerDetailsWhichShouldDisplayIDNameGenderCountryName

go

--3)Creating stored procededure which accepts a gender type parameter as input and display customer details
--It should display ID,Name,Gender Type,Country Name

create procedure sp_ToAcceptGenderTypeParameterAsInputAndDisplayCustomerDetails
@Gender varchar(15)
 as
begin
select Cr.Id,Cr.Name,G.GenderType,C.CountryName from Customer Cr
join Country C on Cr.CountryId=C.CountryId
join Gender G on Cr.GenderId=G.GenderId where G.GenderType=@Gender
end

 go

 exec sp_ToAcceptGenderTypeParameterAsInputAndDisplayCustomerDetails @Gender='Male'
 go

 --4)creating a function which accept country Id and gender Id as parameters.
 --It must return all customer matching the input criteria.
 create function fn_GetCustomerDetailsWhichAcceptCountryIdGenderIdAsParameter(@CountryId int,@GenderId int)
 returns table
 as
 return(select Cr.Id,Cr.Name,G.GenderType,C.CountryName from Customer Cr
 inner join Country C on C.CountryId=Cr.CountryId
 inner join  Gender G on G.GenderId=Cr.GenderId
 where C.CountryId=@CountryId and G.GenderId=@GenderId)

 go

 select * from fn_GetCustomerDetailsWhichAcceptCountryIdGenderIdAsParameter(3,3)
 go




 --5)Creating stored procedure to find total customers by Country Name
 create procedure sp_FindTotalCustomersByCountryName
 as
 begin
 Select C.CountryName,count(CountryName) as [Total Customers] from Customer Cr
join Country C ON Cr.CountryId=C.CountryId
join Gender G on Cr.GenderId=G.GenderId
group by C.CountryName
end

execute sp_FindTotalCustomersByCountryName





