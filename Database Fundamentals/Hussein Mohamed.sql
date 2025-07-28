-- DB Fundamentals - Day05
-- Hussein Mohamed
------------------------------------------------------
-- Index -- Use ITI
------------------------------------------------------
-- Q1
-- Create Clustered index on  Employee Table. [Use Company]

-- it's made just after we create the Primary Key
-- so we will drpo the primary key and the pervious Cluster index, then create the new one


ALTER table Course
DROP CONSTRAINT PK_Course
DROP index PK_Course on Course
create clustered index CI_ID on Course(Crs_Name)
alter table Course
add constraint Pk_Course primary key (Crs_Id)
GO
------------------------------------------------------
-- Q2
-- Create Non-Clustered index on Salary Column in Employee Table.
create nonclustered index NCI_Ins_Sal on Instructor(Salary)
GO
------------------------------------------------------
-- Q3
-- Create Indexed View on any table ( make sure the SQL Server uses the Index of the view not the Index of the physical table).

-- we first create a view on Department
create view View_Department
with schemabinding 
as
    SELECT Dept_Name, Dept_Location
    from Department
    where Dept_Location = 'Alex'
GO
create unique clustered index View_Index_View_Department on View_Department(Dept_Desc)
GO

Select * from View_Department with (noexpand)