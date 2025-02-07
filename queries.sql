-- question 3.1 Get details of all books in stock ordered by year-to-date-qty-sold in descending order.
SELECT b.ISBN,
       b.Subject,
       a.Name,
       b.SellingPrice,
       b.CostPrice,
       b.Title,
       SUM(od.Quantity) AS Quantity,
       o.OrderDate
FROM Books AS b,
     Inventories AS i,
     Orders AS o,
     OrderDetails AS od,
     Authors AS a
WHERE o.OrderID = od.OrderID
  AND od.ISBN = b.ISBN
  AND b.ISBN = i.ISBN
  AND b.AuthorID = a.AuthorID
  AND i.Quantity > 0
GROUP BY b.ISBN
ORDER BY o.OrderDate DESC, SUM(od.Quantity) DESC;

-- question 3.2 Get details of all back orders for a given publisher.
SELECT od.OrderDetailsID, od.OrderID, od.ISBN, od.Quantity
FROM OrderDetails AS od,
     Publishers AS p,
     Orders AS o,
     Books AS b,
     Inventories AS i
WHERE p.PublisherID = o.PublisherID
  AND b.PublisherID = [GIVEN PublisherID]
  AND o.OrderID = od.OrderID
  AND b.ISBN = od.ISBN
  AND i.ISBN = b.ISBN
  AND i.Quantity
    < 1;

-- question 3.3 For a given customer, get details of all his/her special orders
SELECT od.OrderDetailsID, od.OrderID, od.ISBN, od.Quantity
FROM OrderDetails AS od,
     Orders AS o,
     Customers c
WHERE od.OrderID = o.OrderID
  AND c.CustomerID = o.CustomerID
  AND c.CustomerID = [GIVEN CustomerID]
  AND o.IsSpecial = TRUE;

-- question 3.4 For a given customer, get details of all his/her purchases made during a specific period of time from a given branch.
SELECT od.OrderDetailsID, od.OrderID, od.ISBN, od.Quantity, b.title AS Title
FROM OrderDetails AS od,
     Orders AS o,
     Customers AS c,
     Books AS b
WHERE od.OrderID = o.OrderID
  AND c.CustomerID = o.CustomerID
  AND od.ISBN = b.ISBN
  AND od.BranchID = [GIVEN BranchID]
  AND o.CustomerID = [GIVEN CustomerID]
  AND DATE (o.OrderDate) BETWEEN 'YYYY-MM-DD'
  AND 'YYYY-MM-DD';

-- question 3.5 Give a report of sales during a specific period of time for a given branch.
SELECT o.OrderID,
       bo.Title,
       b.Name,
       p.PublisherName,
       o.BookstoreID,
       (SELECT DISTINCT boo.SellingPrice
        FROM Books AS boo
        WHERE od.ISBN = boo.ISBN) * od.Quantity AS Total,
       o.OrderDate,
       b.BranchID
FROM Orders AS o,
     Customers AS c,
     Branches AS b,
     Books AS bo,
     Publishers AS p,
     OrderDetails AS od
WHERE o.OrderID = od.OrderID
  AND b.BranchID = od.BranchID
  AND b.BranchID = 1
  AND bo.ISBN = od.ISBN
  AND p.PublisherID = od.PublisherID
  AND Date(o.OrderDate) BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'
GROUP BY od.OrderDetailsID;


-- question 3.6 Find the title and name of publisher of book(s) that have the highest backorder
SELECT b.Title,
       p.PublisherName,
       SUM(od.Quantity) AS Total_Sold
FROM Books AS b,
     Publishers AS p,
     OrderDetails AS od
WHERE b.ISBN = od.ISBN
  AND p.PublisherID = od.PublisherID
  AND b.PublisherID = p.PublisherID
  AND od.PublisherID = b.PublisherID
GROUP BY b.ISBN
HAVING Total_Sold = (SELECT MAX(q2.Quantity)
                     FROM (
                              SELECT od.ISBN,
                                     SUM(od.Quantity) AS Quantity
                              FROM OrderDetails AS od
                              GROUP BY od.ISBN
                          ) AS q2);


-- question 3.7 Give details of books that are supplied by a given publisher ordered by their sale price in increasing order.
SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName
FROM Books AS b,
     Authors AS a,
     Publishers AS p
WHERE b.PublisherID = p.PublisherID
  AND b.AuthorID = a.AuthorID
  AND b.PublisherID = [GIVEN PUBLISHER ID]
ORDER BY b.SellingPrice ASC;

-- question 3.8 For all publishers who have at least three branches, get details of the head office and all the branches for those publishers.
SELECT p.PublisherID,
       b.Name            AS 'Branch Name',
       r.Name            AS 'Representative Name',
       l.TelephoneNumber AS 'Head Office Telephone Number',
       l.City            AS 'Head Office City',
       l.Province        AS 'Head Office Province',
       l.Address         AS 'Head Office Address'
FROM Branches AS b,
     Representatives AS r,
     Publishers AS p,
     Locations AS l,
     HeadOffices AS h
WHERE b.RepresentativeID = r.RepresentativeID
  AND b.PublisherID = p.PublisherID
  AND p.HeadOfficeID = h.HeadOfficeID
  AND (h.LocationID = l.LocationID)
  AND b.PublisherID IN (
    SELECT PublisherID
    FROM Branches
    GROUP BY PublisherID
    HAVING Count(*) >= 3)
ORDER BY p.PublisherID ASC;

-- question 3.9 Get details of books that are in the inventory for at least one year but there have never been a purchase for that specific book.
SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName
FROM Books AS b,
     Authors AS a,
     Publishers AS p,
     Inventories AS i
WHERE b.PublisherID = p.PublisherID
  AND b.AuthorID = a.AuthorID
  AND i.ISBN = b.ISBN
  AND b.ISBN NOT IN (SELECT od.ISBN FROM OrderDetails AS od)
  AND DATEDIFF(NOW(), i.StockDate) >= 1;

-- question 3.10 Get details of all books that are in the inventory for a given author. 
SELECT b.ISBN, a.Name, b.Title, b.SellingPrice, b.CostPrice, p.PublisherName
FROM Books AS b,
     Authors AS a,
     Publishers AS p,
     Inventories AS i
WHERE b.PublisherID = p.PublisherID
  AND b.AuthorID = a.AuthorID
  AND i.ISBN = b.ISBN
  AND i.Quantity > 0
  AND a.Name = [GIVEN AUTHOR NAME]
