-- DB Fundamentals - Day07
-- Hussein Mohamed
------------------------------------------------------
-- USE ITI
------------------------------------------------------
-- Q1
-- Make a Transaction with 2 save points.  

-- to try the 3 errors change values and delete student >> 
-- delete from newschema.Student where St_Id= 14

begin tran ATM_tran
    declare @err1 int, @err2 int, @err3 INT

    insert into newschema.Student(St_Id, St_Fname)
    VALUES(14, 'Hussein')
    set @err1 = @@ERROR
    save tran SP1

    update newschema.Student
    set Dept_Id = 20
    where St_Id = 14
    set @err2 = @@ERROR
    save tran SP2

    update newschema.Student
    set St_super = 13
    where St_Id = 14
    set @err3 = @@ERROR

    if(@err1 = 0 and @err2 = 0 and @err3 = 0)
        BEGIN
            COMMIT
            print 'All Done'
        END
    else if(@err1 = 0 and @err2 = 0)
        BEGIN
            PRINT 'Two out of three done'
            rollback tran SP2
        END
     else if(@err1 = 0)
        BEGIN
            PRINT 'one out of three done'
            rollback tran SP1
        END
    else
        begin
            PRINT 'ERROR in all'
            ROLLBACK
        end
GO

------------------------------------------------------
-- Q2
-- Use Throw inside Transaction  
-- let's use the previous transation and throw error
-- to try the 3 errors change values and delete student >> 
-- delete from newschema.Student where St_Id= 14

begin tran ATM_tran
    declare @err1 int, @err2 int, @err3 INT

    insert into newschema.Student(St_Id, St_Fname)
    VALUES(14, 'Hussein')
    set @err1 = @@ERROR
    save tran SP1

    update newschema.Student
    set Dept_Id = 10
    where St_Id = 14
    set @err2 = @@ERROR
    save tran SP2

    update newschema.Student
    set St_super = 13
    where St_Id = 14
    set @err3 = @@ERROR

    if(@err1 = 0 and @err2 = 0 and @err3 = 0)
        BEGIN
            COMMIT
            print 'All Done'
        END
    else if(@err1 = 0 and @err2 = 0)
        BEGIN
            rollback tran SP2;
            throw 50001, 'Supervisour Not found', 1                                   --------------------------------------
        END
     else if(@err1 = 0)
        BEGIN
            PRINT 'one out of three done'
            rollback tran SP1;
            throw 50002, 'Department ID Not Found',1 --------------------------------------
        END
    else
        begin
            PRINT 'ERROR in all'
            ROLLBACK;
        end
GO

------------------------------------------------------
-- USE ITI 
------------------------------------------------------
-- Q3
-- Create a stored procedure to show the number of students per department.[use ITI DB] 

create or alter proc ITI_Students
    as
    begin
        SELECT Dept_Id 'Department number', COUNT(St_Id) 'Number of students' from newschema.Student GROUP by Dept_Id 
    end
    GO
exec ITI_Students
GO

------------------------------------------------------
-- Q4
/*
Create a stored procedure that will check for the number of employees in the project p1 if they are more than 3 
print message to the user “'The number of employees in the project p1 is 3 or more'” ithey are less 
display a message to the user “'The following employees work for the project p1'” in addition to the first name and last name of each one. [Company DB]   
*/
create or alter proc Count_Of_Employees @p1 int

as
BEGIN
    declare @countOf int
    SELECT @countOf=COUNT(EmpNo)
    from Company.Employee
    where ProjectNo = @p1


    if(@countOf > 3)
        BEGIN
            print 'The number of employees in the project is 3 or more'
        end
    else
    begin
        DECLARE @F_L_Name VARCHAR(50)
        SELECT @F_L_Name= STRING_AGG( left(EmpFname,1) + left(EmpLname, 1), ' ') from Company.Employee where ProjectNo = @p1
        print 'The following employees work for the project  ' + @F_L_Name
        
    end
end

GO
exec Count_Of_Employees 3
Go
------------------------------------------------------
-- Q5
/*
Create a stored procedure that will be used in case there is an old employee has left the project and a new one become instead of him. 
The procedure should take 3 parameters (old Emp. number, new Emp. number and the project number) and it will be used to update works_on table. [Company DB]  
*/
create or alter proc update_emp
                    @Old_Emp_NO int,
                    @Project_No int,
                    @New_Emp_No int

as 
begin
    update Works_on 
    set EmpNo = @New_Emp_No 
    where ProjectNo = @Project_No and EmpNo = @Old_Emp_NO
end
GO
update_emp 103, 1, 102

------------------------------------------------------
-- Normalization
------------------------------------------------------
-- Q1
/*
DreamHome Company designed to facilitate connecting people who are interested in properties renting and the owners of these properties.
Note that ‘Rent’ is the value of the property cost, which determined by the negotiation between the customer and the owner.
Use the below data to reach the 3rd Normal Form. Show your answer steps. Start with Customer number as a PK. 
Ignore Page number and Date mentioned in the below bill. 
*/

-- answer

/*
steps
the table combined
Customer_Interests(Cust_No(PK),Cust_Name, Prop_No, Prop_Add, Rent_SD, Rent_FD, Neg_Rent, Owner_No, Owner_Name)

1- Make it in First Normal Form
-- We check on the Multi-Valued Columns
(property Address(Prop_add), Rent start(Rent_SD), Rent Finish(Rent_FD),
Rent(Neg_Rent), Owner Numbr(Owner_No), Owner Name(Owner_Name))

-- Split the tables(Move every related with the PK to a new table)
Customer_Info(Cust_No(PK), Cust_Name)
Customer_Interests(Cust_No(PK, FK > Customer_Info), Prop_No(PK), Prop_Add, Rent_SD, Rent_FD, Neg_Rent, Owner_No, Owner_Name)


2- Make it in Second Normal Form 
-- We check on the partial dependency columns
(Prop_Add, Rent_SD, Rent_FD, Neg_Rent, Owner_No, Owner_Name) > Prop_No

-- Split the tables(move dependent to new tabke)
Customer_Info(Cust_No(PK), Cust_Name)
Customer_Interests(Cust_No(PK, FK > Customer_Info), Prop_No(PK), Neg_Rent)
Prop_Info(Prop_No(PK, FK > Customer_Interestes), Prop_Address, Rent_SD, Rent_FD, Owner_No, Owner_Name)


3- Make it in Third Normal Form
-- We check on the transitive dependency
(Owner_Name) > Owner_No > Prop_No

-- Split the tables(move transitive dependent to new tabke)
Customer_Info(Cust_No(PK), Cust_Name)
Customer_Interests(Cust_No(PK, FK > Customer_Info), Prop_No(PK), Neg_Rent)
Prop_Info(Prop_No(PK, FK > Customer_Interestes), Prop_Address, Rent_SD, Rent_FD, Owner_No)
Owner_Info(Owner_No(PK, FK > Prop_Info), Ower_Name)

--- Final tables ---

Customer_Info(Cust_No(PK), Cust_Name)
Customer_Interests(Cust_No(PK, FK > Customer_Info), Prop_No(PK), Neg_Rent)
Prop_Info(Prop_No(PK, FK > Customer_Interestes), Prop_Address, Rent_SD, Rent_FD, Owner_No)
Owner_Info(Owner_No(PK, FK > Prop_Info), Ower_Name)

*/

------------------------------------------------------
-- Q2
/*
The below report shows detailed information about the organization projects and the employees work for. 
As shown in below records; the project may have many employees; also, an employee may work for more than one project. 
Each job classification has a specific hourly rate (CHG/Hour). You are required to apply the 1st, 2nd and 3rd NF. 
*/

-- answer
/*
steps
the table combined
Org_Projects(Proj_No(PK), Proj_Name, Emp_No, Emp_Name, Job_Class, CHG_Hour, Hours_Billed, Total_Charge)

1- Make it in First Normal Form
-- We check on the Multi-Valued Columns
(Emp_No, Emp_Name, Job_Class, CHG_Hour, Hours_Billed, Total_Charge)

-- Split the tables(Move every related with the PK to a new table)
Project_Info(Proj_No(PK), Proj_Name)
Org_Projects(Proj_No(PK, FK > Proj_Info), Emp_No(PK), Emp_Name, Job_Class, CHG_Hour, Hours_Billed, Total_Charge)


2- Make it in Second Normal Form 
-- We check on the partial dependency columns
(Emp_Name) > Emp_No

-- We didn't take the Job_Class as a partial dependency on Emp_No cause Assumed it depend on both Proj_No, Emp_No --

-- Split the tables(move dependent to new tabke)
Project_Info(Proj_No(PK), Proj_Name)
Org_Projects(Proj_No(PK, FK > Proj_Info), Emp_No(PK), Job_Class, CHG_Hour, Hours_Billed, Total_Charge)
Employee_Info(Emp_No(PK, FK > Org_projects), Emp_Name)

3- Make it in Third Normal Form
-- We check on the transitive dependency
(CHG_Hour) > Job_Class > (Proje_No, Emp_No)

-- Split the tables(move transitive dependent to new tabke)
Project_Info(Proj_No(PK), Proj_Name)
Org_Projects(Proj_No(PK, FK > Proj_Info), Emp_No(PK), Job_Class, Hours_Billed, Total_Charge)
Employee_Info(Emp_No(PK, FK > Org_projects), Emp_Name)
Job_CHG(Job_Class(PK, FK > Org_Projects), CHG_Hour)

--- Final tables ---
\\Org_Projects(Proj_No(PK), Proj_Name, Emp_No, Emp_Name, Job_Class, CHG_Hour, Hours_Billed, Total_Charge)

Project_Info(Proj_No(PK), Proj_Name)
Org_Projects(Proj_No(PK, FK > Proj_Info), Emp_No(PK), Job_Class, Hours_Billed, Total_Charge)
Employee_Info(Emp_No(PK, FK > Org_projects), Emp_Name)
Job_CHG(Job_Class(PK, FK > Org_Projects), CHG_Hour)


-- Note Total_Charge is a derived attribute we normally delete it. it's also dependent on both PKs so, No Problem in the Normalizaiton --
*/
------------------------------------------------------


