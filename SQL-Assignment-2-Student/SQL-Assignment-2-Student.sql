--Creating database StudentDB
Create database StudentDB
go
use StudentDB
go
--Creating table Student
create table Student(
ID int NOT NULL UNIQUE IDENTITY(1000,5),
Name varchar(20) NOT NULL,
Gender varchar(10) NOT NULL,
Marks int check(Marks>0 and Marks<=100)
);
go
--1)Insert records in student table
insert into Student
values('John','Male',80),
('Jessie','Female',92),
('Tina','Female',75),
('Thomas','Male',65),
('Johnson','Male',45),
('Riya','Female',50)
go
--2)Select all student records
select *from Student
--3)Select all male student records
select * from Student where Gender='Male'
--4)Select all female student records
select * from Student where Gender='Female'
--5)Select all records with marks>45
select *from Student where Marks>45
--6)Select all records whose name starts with 'j'
select * from Student where Name like 'j%'
--7)Select all records whose name ends with 'a'
select * from Student where Name like '%a'
--8)A query to get total marks by Gender
select Gender,sum(Marks) as [Total Marks] from Student group by Gender
--9)A query to get total students by Gender
select Gender,count(Gender) as [Total Students By Gender] from Student group by Gender
--10)A query to get the total students by Gender whose marks>70
select Gender,count(Name) from Student where Marks>70 group by Gender
