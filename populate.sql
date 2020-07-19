-- Do not change the order of execution
-- Other values may be added
INSERT INTO ReaderInterest(ReaderInterestName, ReaderInterestDescription)
VALUES ('Science fiction', 'science that is fiction'),
       ('Fiction', 'fiction that is not science'),
       ('Romance', 'people in love'),
       ('Comedy', 'makes you laugh');

INSERT INTO Author(Name)
VALUES ('Leo Jr Silao'),
       ('Gordon Pham-Nguyen'),
       ('Tiffany Zeng'),
       ('Arunraj Adlee');

INSERT INTO Location(Address, PostalCode, City, Province)
VALUES ('1500 McGill College Ave', 'H3A 3J5', 'Montreal', 'Quebec'),
       ('116 Bond St', 'M5B 1X8', 'Toronto', 'Ontario'),
       ('1198 Commercial Dr', 'V5L 3X2', 'Vancouver', 'British Columbia'),
       ('12 E 49th St', '10017', 'New York', 'New York');

INSERT INTO Representative(Name)
VALUES ('Leo Jr Silao'),
       ('Gordon Pham-Nguyen'),
       ('Tiffany Zeng'),
       ('Arunraj Adlee');

INSERT INTO HeadOffice(Location)
VALUES (1),
       (2),
       (3),
       (4);

INSERT INTO Publisher(PublisherName, CompanyName, HeadOffice)
VALUES ('Gordon', 'Gordon', 1),
       ('Leo', 'Leo', 2),
       ('Tiffany', 'Tiffany', 3),
       ('Arunraj', 'Arunraj', 4);

INSERT INTO Branch(Location, Representative, Publisher)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3),
       (4, 4, 4);

INSERT INTO Customer(CompanyName, Location)
VALUES ('Gordon', 1),
       ('Leo', 2),
       ('Tiffany', 3),
       ('Arunraj', 4);

INSERT INTO Bookstore(ReaderInterest)
VALUES (1),
       (2),
       (3),
       (4);

INSERT INTO Orders(Bookstore, PublisherID, totalPrice)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);

INSERT INTO Books(Author, Title, SellingPrice, CostPrice)
VALUES (1, 'ayylmao', 50, 2),
       (2, 'hydrapeak', 30, 25),
       (3, 'MEC', 10, 20),
       (4, 'Water', 30, 5);

INSERT INTO OrderDetails(OrderNumber, ISBN, Quantity)
VALUES (1, 1, 50),
       (2, 1, 40),
       (3, 3, 2),
       (4, 4, 10);

INSERT INTO Inventory(Bookstore, ISBN, Quantity)
VALUES (1, 1, 40),
       (2, 2, 40),
       (3, 3, 10),
       (4, 4, 20);
