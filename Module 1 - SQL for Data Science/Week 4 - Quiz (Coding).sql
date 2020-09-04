--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram (https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png) in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

--Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
Select CustomerID, FirstName||' '||LastName AS FullName,
Address,
UPPER(City)||' '||UPPER(Country) AS Location
From Customers

--Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
Select
FirstName,
LastName,
LOWER(SUBSTR(FirstName,1,4)||SUBSTR(LastName,1,2))
From Employees

--Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
Select EmployeeID,FirstName, LastName, HireDate, DATE('now')-HireDate AS CompanyAge
From Employees
order by LastName ASC

--Profiling the Customers table, answer the following question.
Select
SUM(CASE 
WHEN Address IS NULL THEN 1 ELSE 0 END) AS  Address,
SUM(CASE 
WHEN Company IS NULL THEN 1 ELSE 0 END) AS Company,
SUM(CASE 
WHEN FirstName IS NULL THEN 1 ELSE 0 END) AS FirstName,
SUM(CASE 
WHEN PostalCode IS NULL THEN 1 ELSE 0 END) AS PostalCode,
SUM(CASE 
WHEN Fax IS NULL THEN 1 ELSE 0 END) AS Fax,
SUM(CASE 
WHEN Phone IS NULL THEN 1 ELSE 0 END) AS Phone
From Customers

--Find the cities with the most customers and rank in descending order.
Select City, Count(CustomerID)
From Customers
Group by City
Order by Count(CustomerID) DESC

--Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
Select c.FirstName, c.LastName, i.InvoiceID, c.FirstName||c.LastName||i.InvoiceID Combined
From Customers c Left Join Invoices i
on c.CustomerId=i.CustomerId
Order By c.FirstName, c.LastName, i.InvoiceID