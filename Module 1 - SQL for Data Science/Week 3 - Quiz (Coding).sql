--All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram (https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png) in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

--Using a subquery, find the names of all the tracks for the album "Californication".
Select Name
From Tracks
Where AlbumID in
  (Select AlbumID
  From Albums
  Where Title="Californication")
  
  --Find the total number of invoices for each customer along with the customer's full name, city and email.
Select c.FirstName, c.LastName, c.City, c.Email,Count(c.Email) AS Count
From Customers c Left Join Invoices i
ON c.CustomerID=i.CustomerID
Where c.FirstName LIKE 'Franti%'
GROUP BY c.Email

--Retrieve the track name, album, artistID, and trackID for all the albums.
Select t.Name, a.Title, art.ArtistId, t.Trackid
From ((albums a left join artists art on art.ArtistID=a.ArtistID) left join tracks t on t.AlbumID=a.AlbumID)
where t.TrackID=12

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
Select e.LastName as Manager, m.LastName as Employee
From Employees m left join Employees e
On e.EmployeeID=m.ReportsTo

--Find the name and ID of the artists who do not have albums.
Select art.Name, art.ArtistID, a.AlbumID
From artists art left join albums a on art.artistid=a.artistid
where a.AlbumID is Null

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
Select FirstName, LastName
From Employees
UNION
Select FirstName, LastName
From Customers
Order BY LastName DESC

--See if there are any customers who have a different city listed in their billing city versus their customer city.
Select c.City, i.BillingCity
From Customers c inner join Invoices i on c.Customerid=i.customerid
Where c.City != i.BillingCity