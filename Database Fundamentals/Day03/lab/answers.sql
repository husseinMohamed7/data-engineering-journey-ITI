-- DB Fundamentals - Day03
-- Hussein Mohamed
------------------------------------------------------

-- Q4
-- Display all the data from the Employee table (HumanResources Schema) 
---- first transfere from the HR schema
ALTER SCHEMA HumanResources transfere HR.Employee;
--- Select all from it
Select * from HR.Employee
GO
  
------------------------------------------------------
-- Q5
-- Display the Employee National ID, LoginID, JobTitle from the Employee table (HumanResources Schema) as a report to your manager.
SELECT NationalIDNumber 'The National ID Number', LoginID 'The Login ID', Title 'Job Title'
from HumanResources.Employee
GO
  
------------------------------------------------------
-- Q6
-- Display the Contact Title,FirstName and LastName for those holding Title 'Ms' OR  LastName=’Antrim’
SELECT ContactID, Title, FirstName, LastName
from Person.Contact
where  Title = 'Ms' OR LastName = 'Antrim'
GO
  
------------------------------------------------------
-- Q7
-- Display the Contact Title, FirstName,LastName who is not holding Title ‘Ms”.
SELECT ContactID, Title, FirstName, LastName
from Person.Contact
where  Title != 'Ms'
GO
  
------------------------------------------------------
-- Q8
-- Display all Contacts with a Title ‘Ms.’ & a FirstName ‘Catherine’.
-- In addition to displaying anyone else with a LastName ‘Adams’ regardless of  his/her Title and FirstName.
SELECT *
from Person.Contact
where  (Title = 'Ms.' AND FirstName = 'Catherine') OR LastName = 'Adams'
GO
  
------------------------------------------------------
-- Q9
-- Display the SalesOrderID, ShipDate of the SalesOrderHearder table (Sales schema) to designate SalesOrders
-- that occurred within the period ‘7/28/2002’ and ‘7/29/2002’
SELECT SalesOrderID, ShipDate
from Sales.SalesOrderHeader
where OrderDate BETWEEN '7-28-2002' and '7-28-2002'
GO
------------------------------------------------------
-- Q10
-- Display only Products(Production schema) with a StandardCost below $110.00 (show ProductID, Name only)
SELECT ProductID, Name
from Production.Product
where StandardCost < 110
GO
  
------------------------------------------------------
-- Q11
-- Display ProductID, Name if its weight is unknown (Null).
SELECT ProductID, Name
from Production.Product
where Weight is null
GO
  
------------------------------------------------------
-- Q12
-- Display each product name along with its its sub categoray name and category name.   
SELECT pp.Name + ' - ' + ps.Name+ ' - ' + pc.Name 'product - sub category - category'
from Production.Product as pp, Production.ProductCategory as pc, Production.ProductSubcategory as ps
where pp.ProductSubcategoryID =  ps.ProductSubcategoryID 
AND ps.ProductCategoryID =  pc.ProductCategoryID
GO
------------------------------------------------------
-- Q13
-- Display all Products with  a Silver, Black, or Red Color (use in keyword).
SELECT *
from Production.Product
where Color in ('Silver', 'Black', 'Red')
GO
------------------------------------------------------
-- Q14
-- Display any Product with a Name starting with the letter B.
SELECT *
from Production.Product
where Name like 'B%'
GO
------------------------------------------------------
-- Q15
-- Display the Sub Categories that contain products start with B letter (Use Sub Queries). 
SELECT * 
FROM  Production.ProductSubcategory
where ProductSubcategoryID IN(
    SELECT ProductSubcategoryID
    from Production.Product
    where Name like 'B%'
)
GO

------------------------------------------------------
-- Q16
-- Calculate sum of TotalDue for each OrderDate in Sales.SalesOrderHeader table for the period between  '7/1/2001' and '7/31/2001'
SELECT sum(TotalDue) 'Sum of total due for the day', OrderDate
from Sales.SalesOrderHeader
where OrderDate BETWEEN '7-1-2001' and '7-31-2001'
GROUP by OrderDate
GO
------------------------------------------------------
-- Q17
-- Display the Employees HireDate (note no repeated values are allowed)
SELECT distinct HireDate
from HumanResources.Employee
GO

------------------------------------------------------
-- Q18
-- Calculate the average of the unique ListPrices and category id in the Product table for each product category id which have average listPrice>1000

SELECT avg(distinct pp.ListPrice) as avg_price, pc.Name
from Production.Product as pp, Production.ProductCategory as pc, Production.ProductSubcategory as ps
where pp.ProductSubcategoryID = ps.ProductSubcategoryID
AND ps.ProductCategoryID =  pc.ProductCategoryID
Group By pc.Name
HAVING avg(distinct pp.ListPrice) > 1000
GO 
-- a. Group by Category name instead of Category ID.
SELECT avg(distinct pp.ListPrice) as avg_price, pc.ProductCategoryID
from Production.Product as pp, Production.ProductCategory as pc, Production.ProductSubcategory as ps
where pp.ProductSubcategoryID = ps.ProductSubcategoryID
AND ps.ProductCategoryID =  pc.ProductCategoryID
Group By pc.ProductCategoryID
HAVING avg(distinct pp.ListPrice) > 1000
GO

------------------------------------------------------
-- Q19
-- Display the Product Name and its ListPrice within the values of 100 and 120 The list should has the following format 
-- "The [product name] is only! [List price]"
-- (the list will be sorted according to its ListPrice value)
SELECT 'The ' + Name + ' is only! ' + CAST(ListPrice as varchar) AS 'Product price'
from Production.Product 
where ListPrice  BETWEEN 100 AND 120
ORDER by ListPrice
GO
  
------------------------------------------------------
-- Q20
-- Using union statement, retrieve the today’s date in different styles.
SELECT CONVERT(varchar, GETDATE(), 101) as manyMethods
UNION
SELECT CONVERT(varchar, GETDATE(), 103)
UNION
SELECT CONVERT(varchar, GETDATE(), 104)
UNION
SELECT CONVERT(varchar, GETDATE(), 105)
UNION
SELECT CONVERT(varchar, GETDATE(), 110)
GO
------------------------------------------------------
-- Bonus: 
------------------------------------------------------
-- 1. Use sys schema to display columns’ names and data types on “Product” table in Adventureworks.

-- There is sys.types containing the data types of the columns but not the names
-- And sys.columns containing the names of the columns join with types with 'user_type_id'
-- OBJECT_ID is a function that returns the id of any table/column in the database
SELECT sc.name as 'Column Name', st.name as 'Data type'
from sys.columns as sc
join sys.types as st on sc.user_type_id = st.user_type_id
WHERE sc.object_id = OBJECT_ID('Production.Product');
GO

------------------------------------------------------
-- 2. Display all the data from the Employee table (HumanResources Schema) 
-- a. Using Sql Server management studio query.

---- first transfere from the hr schema
ALTER SCHEMA HumanResources transfere HR.Employee;
--- Select all from it
Select * from HumanResources.Employee
GO
------------------------------------------------------

-- 3. Try using Temp Tables.
-- We loged the viewd data into the #temptest
-- review it using select on a temp table

select * 
into #temptest
from Production.Product
GO
--
select *
from #temptest
GO

