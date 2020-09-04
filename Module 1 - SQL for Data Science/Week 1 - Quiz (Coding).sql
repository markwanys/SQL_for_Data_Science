--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram (https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png) in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

--Retrieve all the records from the Employees table.
Select *
From Employees

--Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
Select 
FirstName,
LastName,
Birthdate,
Address,
City,
State
From 
Employees
Order By
BirthDate

--Retrieve all the columns from the Tracks table, but only return 20 rows.
Select *
From Tracks
Limit 20