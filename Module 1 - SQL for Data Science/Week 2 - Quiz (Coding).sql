--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram (https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png) in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

--Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.
Select
TrackID,
Name,
Milliseconds
From Tracks
Where Milliseconds > 5000000

--Run Query: Find all the invoices whose total is between $5 and $15 dollars.
Select
InvoiceID,
Total
From Invoices
Where Total > 5

--Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
Select
CustomerID,
FirstName,
LastName,
Company,
State
From Customers
Where State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')

--Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
Select
CustomerID,
InvoiceID,
InvoiceDate,
Total
From Invoices
Where (total BETWEEN 1 and 5) AND (CustomerID=56 OR CustomerID=58)

--Run Query: Find all the tracks whose name starts with 'All'.
Select
Name
From Tracks
Where Name LIKE 'All%' 

--Run Query: Find all the customer emails that start with "J" and are from gmail.com.
Select
CustomerID,
Email
From Customers
Where Email LIKE 'j%'

--Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
Select
InvoiceID,
BillingCity,
Total
From Invoices
Where BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
Order By InvoiceID Desc

--Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
Select
CustomerID,
COUNT (CustomerID) AS Number_of_Orders 
From Invoices
GROUP BY CustomerID
Order By Number_of_Orders DESC


--Run Query: Find the albums with 12 or more tracks.
Select
AlbumID,
COUNT (TrackID) AS Number_of_Tracks
From Tracks
GROUP BY AlbumID
HAVING Number_of_Tracks > 12