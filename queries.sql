-- question 3.1 Get details of all books in stock ordered by year-to-date-qty-sold in descending order.
SELECT b.ISBN, b.Subject, a.Name, b.SellingPrice, b.CostPrice, b.Title, SUM(od.Quantity) AS Quantity, o.OrderDate from Books AS b, Inventory AS i, Orders AS o, OrderDetails AS od, Author as a
WHERE o.OrderNumber = od.OrderNumber AND od.ISBN = b.ISBN AND b.ISBN = i.ISBN AND b.Author = a.AuthorID
AND i.Quantity > 0
GROUP BY b.ISBN
ORDER BY o.OrderDate, od.Quantity DESC;

-- question 3.2 Get details of all back orders for a given publisher.
SELECT od.OrderDetailsID, od.OrderNumber, od.ISBN, od.Quantity 
from OrderDetails AS od, Publisher AS p, Orders AS o, Books AS b, Inventory as i
WHERE p.publisherID = o.publisherID  AND o.OrderNumber = od.OrderNumber 
AND b.ISBN = od.ISBN AND i.ISBN = b.ISBN AND i.Quantity < 1; 

-- question 3.3 For a given customer, get details of all his/her special orders
SELECT od.OrderDetailsID, od.OrderNumber, od.ISBN, od.QuantityOrdered 
from OrderDetails AS od, Orders AS o, Customer c
WHERE od.OrderNumber = o.OrderNumber AND c.CustomerID = o.customerID AND c.CustomerID = 1;

-- question 3.4 For a given customer, get details of all his/her purchases made during a specific period of time from a given branch.
SELECT od.OrderDetailsID, od.OrderNumber, od.ISBN, od.Quantity, b.title AS Title 
from OrderDetails AS od, Orders AS o, Customer AS c, Books as b 
WHERE od.OrderNumber = o.OrderNumber AND c.CustomerID = o.customer AND od.ISBN = b.ISBN AND o.Branch = [GIVEN BRANCHID] AND o.Customer = [GIVEN ID] AND Date(o.OrderDate) BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';

-- question 3.5 Give a report of sales during a specific period of time for a given branch.
SELECT o.OrderNumber, c.CompanyName, c.FirstName, c.LastName, b.Name, p.PublisherName, o.Bookstore, od.orderDetailPrice as Total, o.OrderDate, b.BranchID
from Orders AS o, Customer AS c, Branch AS b, Publisher as p, OrderDetails as od
WHERE o.orderNumber = od.orderNumber AND c.CustomerID = o.Customer AND b.BranchID = od.Branch AND b.BranchID = 1 AND p.PublisherID = od.Publisher AND
Date(o.OrderDate) BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'; 



-- question 3.6 Find the title and name of publisher of book(s) that have the highest backorder



-- question 3.7 Give details of books that are supplied by a given publisher ordered by their sale price in increasing order.
SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName 
FROM Books as b, Author as a, Publisher as p 
WHERE b.Publisher = p.PublisherID AND b.Author = a.AuthorID AND b.Publisher = [GIVEN PUBLISHER ID]
Order By b.SellingPrice ASC;

-- question 3.8 For all publishers who have at least three branches, get details of the head office and all the branches for those publishers.
SELECT p.PublisherID, b.Name AS 'Branch Name', r.Name AS 'Representative Name', l.TelephoneNumber as 'Head Office Telephone Number', l.City as 'Head Office City', l.Province as 'Head Office Province', l.Address as 'Head Office Address'
FROM Branch as b, Representative as r, Publisher as p, Location as l, HeadOffice as h
WHERE b.Representative = r.RepresentativeID AND b.Publisher = p.PublisherID AND p.HeadOffice = h.HeadOfficeID AND (h.Location = l.LocationID ) 
AND
b.Publisher IN (
	SELECT Publisher FROM Branch
	Group By Publisher
	Having Count(*) >= 3)


-- question 3.9 Get details of books that are in the inventory for at least one year but there have never been a purchase for that specific book.

SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName 
FROM Books as b, Author as a, Publisher as p, Inventory as i
WHERE b.Publisher = p.PublisherID AND b.Author = a.AuthorID AND i.ISBN = b.ISBN AND b.ISBN NOT IN (SELECT od.ISBN from OrderDetails as od) AND DATEDIFF(NOW(), i.stockDate) >= 1


-- question 3.10 Get details of all books that are in the inventory for a given author. 

SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName 
FROM Books as b, Author AS a, Publisher as p, Inventory as i
WHERE  b.Publisher = p.PublisherID AND b.Author = a.AuthorID AND i.ISBN = b.ISBN AND i.Quantity > 0 AND a.Name = [GIVEN AUTHOR NAME]
