-- question 3.1 Get details of all books in stock ordered by year-to-date-qty-sold in descending order.
SELECT b.ISBN, b.Subject, b.Author, b.Title, SUM(od.Quantity) AS Quantity from Books AS b, Inventory AS i, Orders AS o, OrderDetails AS od
WHERE o.OrderNumber = od.OrderNumber AND od.ISBN = b.ISBN AND b.ISBN = i.ISBN
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
WHERE od.OrderNumber = o.OrderNumber AND c.CustomerID = o.customer AND od.ISBN = b.ISBN AND o.Branch = [GIVEN BRANCH] AND o.Customer = [GIVEN ID] AND Date(o.OrderDate) BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';

-- question 3.5 Give a report of sales during a specific period of time for a given branch.
SELECT o.OrderNumber, o.Customer, o.Branch, o.Publisher, o.Bookstore
from Orders AS o, Customer AS c, Branch AS b
WHERE c.CustomerID = o.Customer AND b.BranchID = o.Branch AND b.BranchID = 1 AND
Date(o.OrderDate) BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';

-- question 3.6 Find the title and name of publisher of book(s) that have the highest backorder
