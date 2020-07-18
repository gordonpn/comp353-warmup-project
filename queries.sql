-- question 3.1
SELECT * from Books AS b, Inventory AS i, Orders AS o, OrderDetails AS od
WHERE o.OrderNumber = od.OrderNumber AND od.ISBN = b.ISBN AND b.ISBN = i.ISBN
AND i.Quantity > 0
ORDER BY o.OrderDate, od.QuantityOrdered DESC;

