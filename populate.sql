-- Do not change the order of execution
-- Other values may be added
INSERT INTO ReaderInterests(ReaderInterestName, ReaderInterestDescription)
VALUES ('Science fiction', 'science that is fiction'),
       ('Fiction', 'fiction that is not science'),
       ('Romance', 'people in love'),
       ('Comedy', 'makes you laugh'),
       ('Mystery', 'some sort of crime'),
       ('Fantasy', 'imagination'),
       ('Classics', 'assigned in English class'),
       ('Adventure', 'Amos Daragon'),
       ('Horror', 'paranormal stuff'),
       ('Cookbooks', 'makes you hungry');

INSERT INTO Authors(Name)
VALUES ('Leo Jr Silao'),
       ('Gordon Pham-Nguyen'),
       ('Tiffany Zeng'),
       ('Arunraj Adlee'),
       ('Malcolm Gladwell'),
       ('Yuval Noah Harari'),
       ('Daniel Kahneman'),
       ('Khaled Jababo'),
       ('Robert Bourassa'),
       ('Donald Trump');

INSERT INTO Locations(Address, PostalCode, City, Province)
VALUES ('1500 McGill College Ave', 'H3A 3J5', 'Montreal', 'Quebec'),
       ('116 Bond St', 'M5B 1X8', 'Toronto', 'Ontario'),
       ('1198 Commercial Dr', 'V5L 3X2', 'Vancouver', 'British Columbia'),
       ('12 E 49th St', '10017', 'Manhattan', 'New York'),
       ('2131 Timber Ridge Road', '95814', 'Sacramento', 'California'),
       ('3010 Jarvisville Road', '10016', 'Manhattan', 'New York'),
       ('2114 Goldleaf Lane', '07662', 'Rochelle Park', 'New Jersey'),
       ('4489 Pine Street', '15219', 'Pittsburgh', 'Pennsylvania'),
       ('3788 Lowland Drive', '61081', 'Sterling', 'Illinois'),
       ('1300 Goodwin Avenue', '99206', 'Spokane Valley', 'Washington');

INSERT INTO Representatives(Name)
VALUES ('Laura J Bell'),
       ('Violet J Hazelip'),
       ('Gladys C Clay'),
       ('Tyrell M Barret'),
       ('James R Hadsell'),
       ('Karen D Damon'),
       ('Frances A Kitson'),
       ('Thomas R Stevenson'),
       ('Janet E Fields'),
       ('Marissa J Poindexter')
;

INSERT INTO HeadOffices(LocationID)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

INSERT INTO Publishers(PublisherName, CompanyName, HeadOfficeID)
VALUES ('Sound Advice', 'Sound Advice', 1),
       ('Parade of Shoes', 'Parade of Shoes', 2),
       ('Jacob Reed and Sons', 'Jacob Reed and Sons', 3),
       ('Body Toning', 'Body Toning', 4),
       ('Copeland Sports', 'Copeland Sports', 5),
       ('Xray Eye & Vision Clinics', 'Xray Eye & Vision Clinics', 6),
       ('Pomeroy', 'Pomeroy', 7),
       ('Silverwoods', 'Silverwoods', 8),
       ('Boston Sea Party', 'Boston Sea Party', 9),
       ('Rolling Thunder', 'Rolling Thunder', 10);

INSERT INTO Branches(LocationID, RepresentativeID, PublisherID)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3),
       (4, 4, 4),
       (5, 5, 5),
       (6, 6, 6),
       (7, 7, 7),
       (8, 8, 8),
       (9, 9, 9),
       (10, 10, 10);

INSERT INTO Customers(CompanyName, LocationID)
VALUES ('Mistimba', 1),
       ('Cervor', 2),
       ('Peric', 3),
       ('Geotri', 4),
       ('Fronter', 5),
       ('Cynize', 6),
       ('Metatude', 7),
       ('Aurous', 8),
       ('Capive', 9),
       ('Camimbee', 10);

INSERT INTO Bookstores(ReaderInterestID)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

INSERT INTO Orders(CustomerID, BookstoreID, IsSpecial)
VALUES (NULL, 4, FALSE),
       (NULL, 2, TRUE),
       (5, NULL, TRUE),
       (1, NULL, TRUE),
       (NULL, 5, FALSE),
       (5, NULL, FALSE),
       (4, NULL, FALSE),
       (NULL, 6, FALSE),
       (NULL, 8, FALSE),
       (NULL, 7, FALSE),
       (8, NULL, FALSE),
       (5, NULL, FALSE);

INSERT INTO Books(AuthorID, PublisherID, Title, SellingPrice, CostPrice)
VALUES (1, 1, 'Clue of the Split Creek', 54.97, 19.22),
       (2, 2, 'Sign of the Ghostly Amulet', 58.38, 99.88),
       (3, 3, 'The Ebony Window', 10.84, 19.54),
       (4, 4, 'Death of the Shrieking Shih Tzu', 18.74, 40.29),
       (5, 5, 'The Cobalt Curtain', 55.11, 85.04),
       (6, 6, 'The Crown in the Abyss', 60.81, 59.54),
       (7, 7, 'Zenith of Polaris', 80.64, 1.51),
       (8, 8, 'The Stranger in the Painting', 20.91, 43.47),
       (9, 9, 'Crime of the Pock-Marked Poet', 82.07, 32.20),
       (10, 10, 'Fatal Gun', 72.93, 22.25);

INSERT INTO OrderDetails(OrderID, ISBN, Quantity, BranchID, PublisherID)
VALUES (1, 1, 50, 1, 1),
       (2, 2, 40, 2, 2),
       (3, 3, 2, 3, 3),
       (4, 4, 10, 4, 4),
       (5, 5, 30, 5, 5),
       (6, 6, 30, 6, 6),
       (7, 7, 20, 7, 7),
       (8, 8, 10, 8, 8),
       (9, 9, 90, 9, 9),
       (10, 10, 5, 10, 10);

INSERT INTO Inventories(BookstoreID, ISBN, Quantity)
VALUES (1, 10, 10),
       (1, 2, 45),
       (1, 3, 20),
       (1, 4, 30),
       (1, 2, 10),
       (2, 8, 10),
       (4, 9, 20),
       (3, 6, 20),
       (8, 10, 10),
       (3, 4, 20),
       (8, 3, 40),
       (7, 3, 5),
       (6, 7, 5),
       (6, 2, 4),
       (5, 10, 1),
       (4, 1, 2),
       (9, 2, 4),
       (10, 1, 100),
       (3, 4, 50);

