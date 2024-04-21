create database review4;
use review4;
create table Employees12 (
EmployeeId int primary key identity(1, 1 ),
EmployeeName varchar(20),
age int ,
department varchar(20)
)

-- first query 

alter table Employees12 
add salary varchar(20);

--inserting data 
insert into Employees12 values 
('Aman' , 20 , 'cse' , 12000),
('rahul' , 21 , 'HR' , 20000),
('saikat' , 22 , 'finanace' , 30000),
('mani' , 34 , 'dotnet' , 46000)

insert into Employees12 values 
('sai' , 23 , 'cse' , 32000),
('ram' , 25 , 'hr' , 40000)
select * from Employees12;

insert into Employees12 values 
('sai' , 23 , 'cse' , 35000)



--Create a table named "Employees" with columns for employee ID, name, age, and department.
--Add a new column named "Salary" to the "Employees" table.
--Rename the column "Department" to "Dept" in the "Employees" table.
--Retrieve the names of employees in alphabetical order.
--Retrieve the names and salaries of the first 5 highest-paid employees.
--Retrieve the names of employees whose names start with the letter 'A'.
--Skip first 2 data and retrieve next data from table.
--Do inner join on two table of your choice.

-- 2 

exec sp_rename 'Employees12.department' , 'dept' ;

select * from Employees12;
-- 3 
select * from Employees12 order by EmployeeName;
--4 
select top 5 * from Employees12 order by salary desc ;
--5
select * from Employees12 where EmployeeName like'A%';
--6
select * from Employees12;
select * from Employees12  where EmployeeId not in (select top 2  EmployeeId from Employees12);

create table Manager (
managerId int primary key , 
EmployeeId int ,
Foreign key (EmployeeId ) references  Employees12(EmployeeId));

insert into Manager values 
(1 ,1),
(2,2)

select * from Employees12 
inner join Manager on Manager.EmployeeId = Employees12.EmployeeId;

-- stdID ,stdName , address , phone number , age 
-- create table , insert , read , 
-- age > 20 
select * from student;