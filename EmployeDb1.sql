CREATE DATABASE EmployeeDB1;

Use EmployeeDB1;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(100) 
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) ,
    last_name VARCHAR(50) ,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Salaries (
salary INT ,
employee_id INT,
department_id INT,
FOREIGN KEY ( employee_id ) REFERENCES Employees (employee_id),
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
)



INSERT INTO Departments (department_name) VALUES ('Human Resources');
INSERT INTO Departments (department_name) VALUES ('Finance');
INSERT INTO Departments (department_name) VALUES ('QA');
INSERT INTO Departments (department_name) VALUES ('Market');

INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Saikat', 'Mondal', 1);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Goutham', '', 2);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('yashwanth', '', 3);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('lakhsmi', '', 4);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Thanya', 'Yr', 5);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Rahul', 'kumar', 1);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Sam', 'Mank', 2);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('Ganesh', 'mahor', 3);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('ram', 'kal', 4);
INSERT INTO Employees (first_name, last_name, department_id) VALUES ('lakhman', '', 6);

INSERT INTO Salaries values (120000, 3,1);
INSERT INTO Salaries values (200000, 5,3);
INSERT INTO Salaries values (420000, 6,4);
INSERT INTO Salaries values (390000, 7,5);
INSERT INTO Salaries values (220000, 10,3);
INSERT INTO Salaries values (820000, 12,6);


update Departments set department_name='cse' where department_id=1;
update Departments set department_name='Dotnet' where department_id=2;

delete from Employees  where employee_id= 1 Or employee_id=2 ;

select * from Employees;
select* from Departments;
select * from Salaries;

select * from Employees , Departments where Departments.department_id = Employees.department_id;

select department_id, COUNT(*) as number_of_employee from Employees GROUP BY department_id;
SELECT Departments.department_name, COUNT(*) AS number_of_employee 
FROM Employees,Departments,Salaries
where Departments.department_id = Employees.department_id
and Employees.employee_id = Salaries.employee_id
GROUP BY Departments.department_name;


Select Departments.department_name ,AVG(Salaries.salary) 
from Employees,Departments,Salaries 
where Salaries.employee_id= Employees.employee_id and Departments.department_id = Employees.department_id
Group By Departments.department_name;

Select Departments.department_name ,AVG(Salaries.salary) 
from Employees,Departments,Salaries 
where Salaries.employee_id= Employees.employee_id 
Group By Departments.department_name;

Select Departments.department_name ,Sum(Salaries.salary) 
from Employees,Departments,Salaries 
where Salaries.employee_id= Employees.employee_id and Departments.department_id = Salaries.department_id
Group By Departments.department_name;



Select * from Employees where first_name like '%s';
Select * from Employees where first_name like 's%';
Select *from Employees where first_name like 'G%'or  last_name= '';
Select * from Salaries Where (salary between 300000 and 500000);
Select * from Employees where first_name IN ('SAIKAT', 'YAshwanth');
Select  distinct(department_id) from Salaries ;




select Departments.department_name , Employees.first_name, Employees.last_name ,MAX(Salaries.salary)
from Employees , Departments , Salaries 
where Employees.department_id = Departments.department_id and Departments.department_id= Salaries.department_id and Employees.employee_id = Salaries.employee_id
GROUP By department_name,Employees.first_name, Employees.last_name;

select Departments.department_name , Employees.first_name, Employees.last_name ,MIN(Salaries.salary)
from Employees , Departments , Salaries 
where Employees.department_id = Departments.department_id and Departments.department_id= Salaries.department_id and Employees.employee_id = Salaries.employee_id
GROUP By department_name,Employees.first_name, Employees.last_name;

select * from Employees order by first_name;
SELECT * FROM Employees ORDER BY first_name DESC;
select *  from Salaries order BY Salary  ;



SELECT TOP 3 * FROM  Employees;

SELECT TOP 50 PERCENT * FROM Employees;

-- rith join 

select Employees.first_name , Departments.department_name ,Salaries.salary from Employees  
Join Departments  on  Departments.department_id=Employees.department_id

join Salaries on Departments.department_id = Salaries.department_id and Salaries.employee_id = Employees.employee_id

Group by Salaries.salary , Salaries.department_id , Employees.first_name , Departments.department_name
Having Salaries.salary = Min(Salaries.salary);



select Departments.department_name,  Count(*) from Employees join Departments on Departments.department_id = Employees.department_id
group by Departments.department_name;

select Departments.department_name , Avg(Salaries.salary) from Departments
join Salaries on Salaries.department_id = Departments.department_id
group by Departments.department_name;

select Employees.first_name,Departments.department_name from Employees
 Join Departments on Departments.department_id= Employees.department_id
join Salaries on Salaries.employee_id = Employees.employee_id
Join (select department_id ,MAX(salary)as m from Salaries Group by department_id) as max_sal on max_sal.department_id = Salaries.department_id and max_sal.m = salary

SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    s.salary
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id
JOIN 
    Salaries s ON e.employee_id = s.employee_id
JOIN 
    (
        SELECT 
            department_id,
            MAX(salary) AS max_salary
        FROM 
            Salaries
        GROUP BY 
            department_id
    ) AS max_sal ON s.department_id = max_sal.department_id AND s.salary = max_sal.max_salary;

	--select count(*) ,department_name from Employees 
	--join Departments on Employees.department_id = Departments.department_id
	--join 
	--(Select Count(*) as c from Departments group by department_id) as d on d.c = 
	--group by department_name
	
	select Count(*)first_name,department_name from  Employees join Departments on Departments.department_id = Employees.department_id
	group by department_name;

	select AVG(Salaries.salary) , Departments.department_name from Salaries join 
	Departments on Departments.department_id=Salaries.department_id
	group by Departments.department_name;

	select first_name ,salary from Employees 
	Join Salaries on Salaries.employee_id=Employees.employee_id
	Join (Select AVG( salary) as s  from Salaries ) as ss on ss.s < salary
-- same result as above code 	
--	SELECT e.first_name, e.last_name, s.salary
--FROM Employees e
--JOIN Salaries s ON e.employee_id = s.employee_id
--WHERE s.salary > (SELECT AVG(salary) FROM Salaries);

	-- retrive the name which is more than one 
	select first_name , Count(*)  from Employees group by first_name having COUNT(*) >1;

	select first_name from Employees where employee_id  not in  (select Employees.employee_id from Employees Join   Salaries on Salaries.employee_id = Employees.employee_id);
	--same result 
	select first_name from Employees left Join Salaries on Salaries.employee_id = Employees.employee_id where Salaries.salary is null;

	select Distinct(department_name) from Departments  Join Salaries on Salaries.department_id = Departments.department_id 
	group by department_name , salary
	having salary > 200000
-- same as above 
--	SELECT DISTINCT d.department_name
--FROM Departments d
--JOIN Employees e ON d.department_id = e.department_id
--JOIN Salaries s ON e.employee_id = s.employee_id
--WHERE s.salary > 200000;


create view DepartmentEmployeeCount as
select d.department_id,d.department_name,count(e.employee_id) as employee_Count from Departments d 
left join Employees  e on d.department_id = e.department_id 
group by d.department_id , department_name;


select * from DepartmentEmployeeCount;

Create view highestSalary as 
select first_name , last_name  from Employees where employee_id =(select top 1 employee_id from Salaries order by  salary Desc);

select * from highestSalary;



create procedure SpDepartment 
As 
Begin 
select  first_name from Employees  where department_id=1
end 
--create proc SpDepartment 
--As 
--Begin 
--select  first_name from Employees  where department_id=1
--end 

spDepartment
-- execute spDepartment 
--exec spDepartment 

alter proc spDepartment 
As Begin 
select * from Employees where department_id = 1;
select * from Employees where department_id = 2
end 

spDepartment 

-- drop proc aspDepartment 

alter proc spDepartment 
@departmentId  int ,
@firstName varchar(20)
As Begin 
select * from Employees where department_id = @departmentId;
select * from Employees where first_name =@firstName
end 

alter proc spDepartment 
@departmentId  int = 1 ,
@firstName varchar(20) = 'Saikat'
 

As Begin 
select * from Employees where department_id = @departmentId;
select * from Employees where first_name =@firstName
end 

spDepartment 

--create clustered Index empl_idx on Employees (employee_id asc);

