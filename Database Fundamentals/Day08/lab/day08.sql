-- DB Fundamentals - Day08
-- Hussein Mohamed
------------------------------------------------------
-- USE SD37-Company
------------------------------------------------------
-- Q1
/*
Create an Audit table with the following structure   
(ProjectNo, UserName, ModifiedDate, Location_Old, Location_New)
Values(P1, Dbo, 2008-01-31, Cairo, Minia)
This table will be used to audit the update trials on the PLocation column (Project table, Company DB)   
Example:  
If a user updated the PLocation column then the project number, user name that made that update,
 the date of the modification and the value of the old Location and value of the new Location will be inserted into the Audit table  
Note: This process will take place only if the user updated the PLocation column  
*/

create table AuditProj(
    ProjectNo INT,
    UserName VARCHAR(max),
    ModifiedDate DATE,
    Location_Old VARCHAR(50),
    Location_New VARCHAR(50)
)
GO
insert into AuditProj
Values(1, 'Dbo', '2008-01-31', 'Cairo', 'Minia')
GO


create trigger tregProject
on Project
after UPDATE 
as 
BEGIN
    if(UPDATE(Plocation))
    BEGIN
        insert into AuditProj
        VALUES((select ProjectNo from inserted),
                SUSER_NAME(),
                GETDATE(),
               ( select Plocation from deleted),
               ( select Plocation from inserted)
                )
    END

END
GO

update Project
set PLocation = 'Alex'
where ProjectNo = 3

select * from AuditProj

update Project
set PLocation = 'Luxor'
where ProjectNo = 3

GO
------------------------------------------------------
-- Q2
/*
Create a trigger that prevents the insertion Process for Employee table in March [Company DB].  
*/

create or alter TRIGGER trgPreventer
on Company.Employee
INSTEAD of INSERT
as
BEGIN
    IF(MONTH(GETDATE()) = 3)
    begin
        PRINT 'Not this Month'
    END
    else
    begin
        insert into Company.Employee
        select * from inserted
    end
END

GO

insert into Company.Employee(EmpNo)
VALUES(1000)

SELECT * from Company.Employee

GO

------------------------------------------------------
-- Q3
/*
Create a trigger to prevent anyone from inserting a new record in the Department table [ITI DB]  
“Print a message for user to tell him that he can’t insert a new record in that table”  
*/

create or alter TRIGGER trgPrDep
on Company.Department
INSTEAD of INSERT
as
BEGIN
    PRINT 'You are not Authorized to insert here'
END

insert into Company.Department(DeptNo)
VALUES(10)
GO
------------------------------------------------------
-- Q4
/*
Use Ranking Function:  
1. Identifying the Top Topics by the Number of Courses:  
• Use the "Topic" and "Course" tables to count the number of courses available for each topic.  
• Rank the topics based on the count of courses and identify the most popular topics with the highest number of courses.
2. Finding Students with the Highest Overall Grades:  
• Use the "Stud_Course" table to calculate the total grades for each student across all courses.  
• Rank the students based on their total grades and identify the students with the highest overall grades.  
*/

