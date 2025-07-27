-- DB Fundamentals - Day04
-- Hussein Mohamed
------------------------------------------------------
-- Views Assignment -- USE ITI
------------------------------------------------------
-- Q1
-- Create a view that displays student full name, course name if the student has a grade more than 50. 
CREATE VIEW student_course
as 
SELECT s.St_Fname, c.Crs_Name
FROM newschema.Student s, Course c, Stud_Course
WHERE s.St_Id = Stud_Course.St_Id AND c.Crs_id = Stud_Course.Crs_id AND Stud_Course.grade > 50
GO 
------------------------------------------------------
-- Q2
-- Create a view that will display Instructor Name, Department Name for the ‘SD’ or ‘Java’ Department 
CREATE VIEW instructor_dep
as 
SELECT i.Ins_Name, d.Dept_Name
FROM Instructor i, Department d
WHERE i.Dept_Id = d.Dept_Id AND d.Dept_Name in ('SD', 'Java') 
GO 
------------------------------------------------------
-- Q3
-- Create a view “V1” that displays student data for student who lives in Alex or Cairo. 
-- Note: Prevent the users to run the following query 
-- Update V1 set st_address=’tanta’
-- Where st_address=’alex’;
CREATE VIEW V1
as 
SELECT *
FROM newschema.Student
WHERE St_Address in ('Alex', 'Cairo')
WITH CHECK OPTION
Go
------------------------------------------------------
-- Q4
-- Create a view that will display the Instructor name and the number of courses he/she teaches. Make an alias for the view's column names.
CREATE or alter VIEW instructor_dep(Instructor_Name,Count_of_courses_teached_by)
as 
SELECT i.Ins_Name, COUNT(c.Ins_Id)
FROM Instructor i, Course c
WHERE c.Ins_Id = i.Ins_Id 
GROUP BY i.Ins_Name
GO 
------------------------------------------------------
-- Q5
-- Create temporary table [Session based] on Company DB to save employee name and project name he works on.
CREATE TABLE #tempCompany (
    EmployeeName char(100),
    ProjectName char(100)
);
GO
INSERT INTO #tempCompany (EmployeeName, ProjectName)
SELECT 
    e.Emp_Name,
    p.Proj_Name
FROM Employee e
JOIN WorksOn w ON e.Emp_Id = w.Emp_Id
JOIN Project p ON w.Proj_Id = p.Proj_Id;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DQL Assignment -- USE World
------------------------------------------------------
-- Q1
-- Display all data for all the countries.
SELECT * 
FROM Country, CountryLanguage, City
WHERE Country.Code = CountryLanguage.CountryCode
AND Country.code = City.CountryCode
GO
------------------------------------------------------
-- Q2
-- Display all the languages you have. (Remove redundant data).
SELECT DISTINCT LANGUAGE
from CountryLanguage
GO
------------------------------------------------------
-- Q3
-- Display all countries that lie in Africa sorted Area.
SELECT Name
FROM Country 
WHERE Continent = 'Africa'
ORDER by SurfaceArea DESC
GO
------------------------------------------------------
-- Q4
-- Display all cities that have population more than 2 million.
SELECT Name, Population
FROM City
WHERE Population > 2000000
ORDER BY Population DESC
GO
------------------------------------------------------
-- Q5
-- Display all countries that became independent from 1920 t0 1990.
SELECT Name, IndepYear
FROM Country 
WHERE IndepYear BETWEEN 1920 and 1990
GO
------------------------------------------------------
-- Q6
-- Display all countries that have no independence year.
SELECT Name
FROM Country 
WHERE IndepYear IS NULL
GO
------------------------------------------------------
-- Q7
-- Display all countries that have any kind of ‘Republic’ government form.
SELECT Name, GovernmentForm
FROM Country
WHERE GovernmentForm LIKE '%Republic%'
GO
------------------------------------------------------
-- Q8
-- Display all countries that lie in Asia and have population more than 100 million.
SELECT Name
FROM Country
WHERE Continent = 'Asia' AND Population > 100000000
GO
------------------------------------------------------
-- Q9
-- Display country code for all those speak Spanish as an official language.
SELECT CountryCode
FROM CountryLanguage
WHERE [Language] = 'Spanish' AND IsOfficial = 1
GO
------------------------------------------------------
-- Q10
-- Display country code for all those speak more than 2 languages.
SELECT CountryCode, count(CountryCode) Languages_count
FROM CountryLanguage
GROUP BY CountryCode
Having count(CountryCode) > 2 
GO
------------------------------------------------------
-- Q11
-- Display the number of people on earth.
SELECT SUM(CAST(Population as bigint)) 'Number of people on earth'
FROM Country
------------------------------------------------------
-- Q12 
-- Display all Continents along with the number of countries and total population in each continent.
SELECT Continent, COUNT(Name) 'Number of Countries', SUM(CAST(Population as bigint)) 'Population of Continent' 
FROM Country
GROUP BY Continent
------------------------------------------------------
-- Q13
-- You have just discovered a new country, Add it to your database. (Of course, your country have some cities and languages)
INSERT INTO Country
VALUES ('EZT', 'mallawy', 'Oceania', 'Australia and New Zealand ', '500', '2025', '1000000', '70', '100', '101', 'meme', 'Autonomous Area', 'Saul II', 2, 'EZ')
GO

INSERT INTO City
  ( ID, Name, CountryCode, District, Population )
VALUES
  (4080, 'masaara', 'EZT', 'mallawy', 400000), 
  (4081, 'Jad', 'EZT', 'mallawy', 200000), 
  (4082, 'Tanouf', 'EZT', 'mallawy', 200000),
  (4083, 'Jalal', 'EZT', 'mallawy', 200000)
GO

INSERT INTO CountryLanguage
VALUES('EZT', 'Arabic', 1, 100)
GO


------------------------------------------------------
-- Q14
-- In your country, increase life expectation by 5 years.
UPDATE Country
SET LifeExpectancy+=5
------------------------------------------------------
-- Q15
-- Try to delete your country, what happens?
DELETE FROM Country
WHERE code = 'EZT'
-- ERROR
-- The confilict because it's on another table as FK
