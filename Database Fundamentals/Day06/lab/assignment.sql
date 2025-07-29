-- DB Fundamentals - Day06
-- Hussein Mohamed
------------------------------------------------------
-- USE ITI
------------------------------------------------------
-- Q1
/*  Create scalar function that take student id,
and retuen first letters of his first name and his last name concatnated with 
"lives in great cairo" if his address in cairo,
and "lives in lovely Alexandria" if addrees is alex, 
and "lives in El-Mansoura" if address is Mansoura,
and "lives in Assiut" if address is Assiut, 
if city any thing else "lives in Non ITI city".  
*/
CREATE or alter function live_in_city(@STD_ID int)
returns VARCHAR(MAX)
AS
BEGIN
    declare @returned_x VARCHAR(MAX)
    select @returned_x= LEFT(St_Fname, 1) +'.'+ LEFT(St_Lname, 1) + '. ' + IIF(St_Address = 'Alex','lives in lovely Alexandria',
                                                    IIF(St_Address = 'Mansoura','lives in El-Mansoura',
                                                    IIF(St_Address = 'Assiut','lives in Assiut',
                                                    IIF(St_Address = 'Cairo', 'lives in great cairo', 'lives in Non ITI city'))))
    FROM newschema.Student
    WHERE St_Id = @STD_ID
    return @returned_x 
END
GO
SELECT dbo.live_in_city(1) 'The student city'
GO
------------------------------------------------------
-- Q2
/*
Create scalar function that takes salary,no. of experience years as parameters,
and calculates the net salary after increase,
knowing that the employees will take 10% increase on the salary for each experience year,
with a maximum of 70% increase. 

*/
CREATE or alter function Net_salary_increased(@inst_salary int,@inst_exp int)
returns DECIMAL
AS
BEGIN
    declare @returned_x DECIMAL
    if (@inst_exp < 7)
    BEGIN
    SELECT @returned_x= 0.1 * @inst_exp * @inst_salary + @inst_salary
    END
    else if (@inst_exp > 7)
    BEGIN
    SELECT @returned_x= 0.7 *@inst_salary + @inst_salary 
    END
    return @returned_x
END
GO

select dbo.Net_salary_increased(7000, 8) 'Net Salary'
GO
------------------------------------------------------
-- Q3
/*
Create inline tabled-function that returns Employees name, title, Marital status, Gender 
(Contact Table in AdventureWorks). 
Return "Not provided" instead of null titles (Use ISNull). 
For Marital status return “Signle or Married” instead of the appreviations used in the table. (Use Case When). 
For Gender return “Male or Female” instead of the appreviations used in the table. (Use Case When). */
create or alter FUNCTION clear_emp() 
returns table
AS
RETURN(
    SELECT p.FirstName + ' ' + p.LastName 'Name', ISNull(e.Title,'Not provided') 'Title',
    case
    when e.MaritalStatus = 'M' Then 'Married'
    when e.MaritalStatus = 'S' Then 'Signle'
    End 'MaritalStatus',
    case
    when e.Gender = 'M' THEN 'Male'
    when e.Gender = 'F' THEN 'Female'
    end 'Gender'
    FROM HR.Employee e, Person.Contact p
    where e.ContactID = p.ContactID
)
GO
SELECT * from dbo.clear_emp() 
GO
------------------------------------------------------
-- Q4
/*
Create tabled-valued function that return all employees names, 
titles in AdventureWorks database and their experience years of work
(number of years from current date to hire date), 
and their graduation date (birth date +21 year) in format (dd, Mon yyyy) [without time].  
*/
create or alter FUNCTION my_emp()
returns table
AS
RETURN(
    SELECT p.FirstName + ' ' + p.LastName 'Name', e.Title, YEAR(GETDATE()) - YEAR(e.HireDate) 'years of experience', 
    convert(varchar(11), DATEADD(YEAR, 26,e.BirthDate), 113)   AS 'Graduation date'
    FROM HR.Employee e, Person.Contact p
    where e.ContactID = p.ContactID
)
GO
SELECT * from dbo.my_emp() 
GO

------------------------------------------------------
-- Q5
/*
Create function, that take department id as a parameter,
and Select the employees name and salary for employees who earn the highest 10 salary in this department. 
*/

create or alter FUNCTION top_salary(@dep_id int)
returns table
AS
RETURN(
    SELECT top 10 Ins_Name, Salary
    from Instructor
    where Dept_ID = @dep_id
    ORDER by Salary DESC
)
GO
SELECT * from dbo.top_salary(10) 
GO


------------------------------------------------------
-- Q6
/*
Use Cursor For the following Problems   
Problem 1: Calculate Total Salary for Each Department  
Description: Calculate the total salary for each department and display the department name along with the total salary 
*/
DECLARE c1 CURSOR
for SELECT d.Dept_Name, 
    sum(i.Salary)
    from Department d, Instructor i
    where i.Dept_Id = d.Dept_Id
    GROUP by d.Dept_Name
for READ ONLY
declare @dep_name varchar(50), @dep_sal int
open c1
FETCH c1 into @dep_name, @dep_sal
WHILE (@@FETCH_STATUS = 0)
    BEGIN
    SELECT @dep_name 'department name', @dep_sal 'Sum of department salary'
    fetch c1 into @dep_name, @dep_sal
    END
close c1
DEALLOCATE c1
GO

/*
Problem 2: Update Employee Salaries Based on Department  
Description: Update employee salaries by increasing them by a certain percentage for a specific department.  
*/

DECLARE c1 CURSOR
for SELECT Salary, Dept_Id
    from Instructor 
for update
declare @dep_salary int, @dep_id int
open c1
FETCH c1 into @dep_salary, @dep_id
WHILE (@@FETCH_STATUS = 0)
    BEGIN
    update Instructor
    set Salary = Salary +( Dept_Id * 0.1* Salary)
    where current of c1
    fetch c1 into @dep_salary, @dep_id
    END
close c1
DEALLOCATE c1
GO

------------------------------------------------------
-- Q7
/*
Use Pivot Table.
*/


------------------------------------------------------
-- Bonus(Use SD35-Company DB, or any available DB) 

/*
Create a Multi-valued function, that returns the number of employees in each department,
and the sum of the salaries for employees in each department, in this format:
|Dept. Name / Totals | Development | Quality assurance|
|No. of employees    |
|Sum of Salaries     |
(Knowing that the company has 2 departments only, first one its ID=1, and the second its ID=2).  
*/

