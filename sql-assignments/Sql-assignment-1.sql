--1)Creating database named SchoolDB
create database SchoolDB
go
--2)Accessing Database SchoolDB
use SchoolDB
go
--3)Creating a table inside Database SchoolDB
create table Students(
Id int NOT NULL UNIQUE IDENTITY(100,1),
FirstName varchar(20),
LastName varchar(20),
Marks int
);
go
--4)Inserting data in Students table
insert into Students
(FirstName,LastName,Marks)values('Johny','Ryan',55)
insert into Students
(FirstName,LastName,Marks)values('Tina','Mari',75)
insert into Students
(FirstName,LastName,Marks)values('Tim','Keith',65)
insert into Students
(FirstName,LastName,Marks)values('Vineetha','Mathew',88)
insert into Students
(FirstName,LastName,Marks)values('Varun','John',92)
insert into Students
(FirstName,LastName,Marks)values('Tarun','Varghese',94)
go
--5)Displaying all the data
select * from Students
--6)Display ID,FirstName,LastName with marks>60
select Id,FirstName,LastName,Marks from Students where Marks>60
--7)Display maximum marks
select Max(Marks) as [Maximum Marks] from Students
--8)Display minimum marks
select Min(Marks) as [Minimum Marks] from Students
--9)Display average marks
select Avg(Marks) as [Average Marks] from Students

