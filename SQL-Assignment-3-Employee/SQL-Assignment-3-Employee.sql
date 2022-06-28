--Creating database EmployeeDB
create database EmployeeDB
go
use EmployeeDB
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
--Create table Employee
create table Employee(
ID int identity(1000,5),
Name varchar(20),
CountryId int FOREIGN KEY REFERENCES Country(CountryId),
GenderId int FOREIGN KEY REFERENCES Gender(GenderId),
);

go
--1)Inserting the records in Employee Table
insert into Employee
values('John',1,1),('Jessie',4,2),('Tina',2,2),('Thomas',3,1),('Johnson',2,1),('Riya',3,2),('Tommy',4,1),('Preeti',1,2)
go
select * from Employee
go
--2)Employee records should display ID,Name,GenderType,CountryName
select E.ID,E.Name,G.GenderType,C.CountryName from Employee E
join Country C on E.CountryId=C.CountryId
join Gender G on E.GenderId=G.GenderId

--3)Select all Male Employee records and it should display ID,Name,GenderType,CountryName
select E.ID,E.Name,G.GenderType,C.CountryName from Employee E
join Country C on E.CountryId=C.CountryId
join Gender G on E.GenderId=G.GenderId
where G.GenderType='Male'

--4)Select all Female Employee records and it should display ID,Name,GenderType,CountryName
select E.ID,E.Name,G.GenderType,C.CountryName from Employee E
join Country C on E.CountryId=C.CountryId
join Gender G on E.GenderId=G.GenderId
where G.GenderType='Female'

--5)Query to find total employees by GenderType
select G.GenderType,count(GenderType) as [Total Employee] from Employee E
join Country C ON E.CountryId=C.CountryId
join Gender G on E.GenderId=G.GenderId
group by G.GenderType


--6)Query to find total employees by CountryName
Select C.CountryName,count(CountryName) as [Total Employee] from Employee E
join Country C ON E.CountryId=C.CountryId
join Gender G on E.GenderId=G.GenderId
group by C.CountryName




