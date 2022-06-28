--Creating database CustomerDB
create database CustomerDB
go
use CustomerDB
go
--Creating table Customer
create table Customer(
ID int NOT NULL primary key Identity(1,1),
[Name] varchar(15),
Gender varchar(15),
Salary int,
City varchar(15)
);

go
--Inserting values in table customer
insert into Customer
values('Tom','Male',4000,'London'),
('Pam','Female',3000,'Newyork'),
('John','Male',3500,'London'),
('Sam','Male',4500,'London'),
('Todd','Male',2800,'Sydney'),
('Ben','Male',7000,'Neywork'),
('Sara','Female',4800,'Sydney'),
('Valarie','Female',5500,'Newyork'),
('James','Male',6500,'London'),
('Russell','Male',8800,'London')
go
select * from Customer
go
--1)Creating stored procedure which output the total salary by city
create procedure sp_TotalSalaryByCity
as
begin
select City,sum(Salary) as [Total Salary] from Customer group by City
end

go

execute sp_TotalSalaryByCity

go

--2)Creating stored procedure which output the total salary by city and by gender
create procedure sp_TotalSalaryByCityAndByGender
as
begin
select City,Gender, sum(Salary) as [Total Salary] from Customer group by City,Gender
end

go
execute sp_TotalSalaryByCityAndByGender

go
--3)Creating stored procedure which output the total salary and total number of Employees by City and By Gender
create procedure sp_TotalSalaryAndTotalNumberOfEmployeesByCityAndByGender
as
begin
select City,Gender, sum(Salary)as [Total Salary],count(ID) as [Total Number Of Employees] from Customer group by City,Gender
end

go

exec sp_TotalSalaryAndTotalNumberOfEmployeesByCityAndByGender

go

--4)Creating stored procedure which takes gender and city as input parameters.The
 --stored procedure should display all records of customers which matches the input parameters
 create procedure sp_StoredProcedureWhichTakesGenderAndCityAsInputParameters
 @Gender varchar(15),
 @City varchar(15)
 as
 begin
 select * from Customer where Gender=@Gender and City=@City
 End

 go

 exec sp_StoredProcedureWhichTakesGenderAndCityAsInputParameters @Gender='Male',
 @City='London'
 
