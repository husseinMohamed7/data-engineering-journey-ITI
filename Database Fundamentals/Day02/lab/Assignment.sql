-- DB Fundamentals - Day02
-- Hussein Mohamed
------------------------------------------------------
-- Q1
/* Create the following database “Programatically”:
    ◦ Database Name: SD37-Company 
    ◦ Data File Name: SD37 -Company-Data 
    ◦ Location: (Default path) 
    ◦ Initial size: 10MB 
    ◦ File Group: Primary 
    ◦ File Growth: 10 percent 
    ◦ Max. File Size: 50 MB 
    ◦ Log File Name: SD3x -Company-Log 
    ◦ Location: (Default) 
    ◦ Initial Size: 5MB 
    ◦ File Growth: 10 Percent 
    ◦ Log File Max. Size: 40MB
*/

------------------------------------------------------

use master
create DATABASE [SD37-Company]
on -- if Primary isn't mentioned it's the default 
(
    NAME = 'SD37-Company-Data', -- primary file,
    FILENAME = '/var/opt/mssql/data/SD37-Company-Data.mdf',
    SIZE = 10MB,
    FILEGROWTH = 10%,
    MAXSIZE = 50MB
)
LOG ON
(
    NAME = 'SD3x-Company-Log',
    FILENAME = '/var/opt/mssql/data/SD3x-Company-Log.ldf',
    SIZE = 5MB,
    FILEGROWTH = 10%,
    MAXSIZE = 40MB
)
GO

------------------------------------------------------

-- Q2
/*
    2. Create the following tables with all the required information and insert the required data as specified in each table using insert statements[at least two rows]:
        a. Table name: Department (Programatically)
            i. Columns: 
                1. DeptNo: int , PK.
                2. DeptName: Nvarchar(20)
                    a. Why did we choose Nvarchar Data type not Nchar or varchar?
                3. Location: Nchar(2)
                    a. Why did we choose Nchar data type not Nvarchar?
                    b. Can we make the data type for that column as char(2)?
            ii. Table values of location should be one of the following values only (NY,DS,KW)), do what’s required to make sure that user can’t enter any different values than the prev. defined values.
            iii. Make the location column value ”NY” as a default value in case of user didn’t insert it.
*/
create table Department(
    DeptNo INT PRIMARY KEY,
    DeptName nvarchar(20) default 'NY', -- nvarchar is good for non english names
    Location NCHAR(2), -- because it's fixed width we can make it nvarchar if the are not english

    CONSTRAINT CHK_Location check(Location in ('NY', 'DS', 'KW'))
)


-- make the filegroup secondaryFG
ALTER DATABASE [SD37-Company]
ADD FILEGROUP SecondaryFG;
GO
-- create the file for it
alter DATABASE [SD37-Company]
ADD FILE(
    NAME = 'SecondaryFG_file',
    filename = '/var/opt/mssql/data/SecondaryFG_File.ndf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
) to filegroup SecondaryFG
GO

create table Employee(
    EmpNo INT PRIMARY KEY,
    EmpFname VARCHAR(50) not null,
    EmpLname VARCHAR(50) not null,
    DepNo int FOREIGN KEY REFERENCES Department,
    Salary int UNIQUE,

    CONSTRAINT CHK_salary CHECK(Salary BETWEEN 700 and 6000)
) on SecondaryFG -- add the table to the group
GO

-- the rest made visually 
------------------------------------------------------

-- Q3
/*
3. Modify the tables as following:
    a. Add  TelephoneNumber column to the employee table[programmatically]
    b. drop this column[programmatically]
*/ 
ALTER table employee
add  TelephoneNumber INT 
GO
ALTER table employee
drop column TelephoneNumber 
GO
------------------------------------------------------

-- Q4
/*
4. Create the following schema and transfer the following tables to it
    a. Company  schema  
        i. Department table (Programmatically)
        ii. Employee table (visually)
*/

create SCHEMA Company
GO
alter schema Company transfer dbo.Department
alter schema Company transfer dbo.Employee

--employee moved visually
------------------------------------------------------
-- Q5
/*
5. Delete the primary key of the Employee table. Why it will not work?
    a. Can a Primary key refer to Unique key instead of Foreign key? yes
*/
alter table Employee
drop column EmpNo
-- err one or more objects access this column(it's foreign key in another table)
-- NO, foreign key is the one the referes.
------------------------------------------------------
-- Q6
/*
Insert at least 3 records (Programatically) in each table from the data shown in the above image, 
and the other records you can insert them Visually.
*/
INSERT into Company.Department
VALUES(1, 'Head', 'NY'), (2, 'HR', 'NY'), (3, 'Data', 'NY')
insert into Company.Employee
VALUES(101, 'Hussien', 'Mohamed', 1, 5001), (102, 'Ahmed', 'Alaa', 1, 5000),(103, 'Eslam', 'Fares', 3, 4000)
insert into Project
VALUES( 'ORAL1', 10000),( 'ORAL2', 20000),( 'ORAL3', 30000)
INSERT into Works_on(EmpNo,ProjectNo,job)
values (103, 1, 'Data Engineer')
GO
------------------------------------------------------
-- Q7
/*
7. Try update and Delete on the previous data.
    a. Testing Referential Integrity:
        i. Add new employee with EmpNo =11111 In the works_on table [Is there error what is it].
        ii. Change the employee number 10102  to 11111  in the works on table [is there error what is it].
        iii. Modify the employee number 10102 in the employee table to 22222. [is there error what is it].
        iv. Delete the employee with id 10102
*/
INSERT into Works_on(EmpNo, ProjectNo, job)
VALUES (11111, 1, 'Analyst')
GO
UPDATE Works_on
set EmpNo = 10102
where EmpNo =11111
GO
-- error it's not the the prime table 11111, same error for 10102
UPDATE Employee
set EmpNo = 22222
where EmpNo =10102
GO
-- error, connected to a foreuign key in another table
delete from Employee
where EmpNo = 10102
-- error it's connect also to the works_on table
