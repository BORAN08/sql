--Single-Row Subqueries:
--Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
SELECT TrackId,Name,Milliseconds FROM tracks WHERE Milliseconds=(SELECT MAX( Milliseconds)FROM tracks);

--Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.
SELECT TrackId,Name,Milliseconds FROM tracks WHERE Milliseconds=(SELECT MIN( Milliseconds)FROM tracks);

-- /**Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. 
-- Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. 
-- General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)**/
SELECT TrackId,Name,Bytes ,(SELECT AVG(Bytes)FROM tracks) AS 'avg_bytes' FROM tracks 
WHERE Bytes >(SELECT AVG(Bytes) FROM tracks) ORDER BY Bytes DESC;
--Multiple-Row Subqueries:
--Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. 
--Your query should include CustomerID, First Name and Last Name of the customers.

SELECT CustomerId,FirstName,LastName FROM customers 
WHERE SupportRepId IN (SELECT EmployeeId FROM employees WHERE FirstName='Jane' OR FirstName='Margaret');

--Rewrite the subquery above using the JOIN.
SELECT customers.CustomerId, customers.FirstName,customers.LastName, employees.EmployeeId,employees.FirstName,employees.LastName
FROM customers INNER JOIN employees ON customers.SupportRepId==employees.EmployeeId
WHERE employees.EmployeeId IN (3,4);
--Create a table inside the chinook database. This table tracks the employees’ courses inside the organization.
-- Your table should have the followings features:

CREATE TABLE courses(CourseId INT ,CourseName TEXT NOT NULL ,EmployeeId INT , CoursePrice INT,PRIMARY KEY(CourseId),FOREIGN KEY(EmployeeId) REFERENCES employees(EmployeeId));

--Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. 
--You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)
INSERT INTO courses (CourseId, CourseName,EmployeeId,CoursePrice) 
VALUES(1,'Python',3,15.00),
	  (2,'HTML/CSS',3,10.00),
	  (3,'SQL/JİRA',1,8.00),
	  (4,'Java Script',2,12.00),
	  (5,'Learn Franch',5,20.00);
	  
SELECT typeof(CourseId) FROM courses;
--Delete the last row of your courses table.
DELETE FROM courses WHERE CourseId=5;

--Add a new column to your courses table named StartDate. The new column cannot be null.
ALTER TABLE courses ADD COLUMN StartDate date ;

--Delete the CoursePrice column.
ALTER TABLE courses DROP COLUMN CoursePrice;

--Delete the courses table.
DROP TABLE courses;



