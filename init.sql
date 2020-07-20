-- Do not change the order of execution
CREATE TABLE ReaderInterests
(
    ReaderInterestID          int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ReaderInterestName        varchar(255),
    ReaderInterestDescription varchar(255)
);

CREATE TABLE Authors
(
    AuthorID int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name     varchar(255) NOT NULL
);

CREATE TABLE Locations
(
    LocationID      int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TelephoneNumber int,
    Address         varchar(255) NOT NULL,
    PostalCode      varchar(255) NOT NULL,
    City            varchar(255) NOT NULL,
    Province        varchar(255) NOT NULL
);

CREATE TABLE Representatives
(
    RepresentativeID int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    EmailAddress     varchar(255),
    Name             varchar(255) NOT NULL
);

CREATE TABLE HeadOffices
(
    HeadOfficeID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LocationID   int NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Locations (LocationID)
);

CREATE TABLE Publishers
(
    PublisherID   int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PublisherName varchar(255) NOT NULL,
    CompanyName   varchar(255) NOT NULL,
    EmailAddress  varchar(255),
    Website       varchar(255),
    HeadOfficeID  int          NOT NULL,
    FOREIGN KEY (HeadOfficeID) REFERENCES HeadOffices (HeadOfficeID)
);

CREATE TABLE Branches
(
    BranchID         int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name             varchar(255),
    LocationID       int NOT NULL,
    RepresentativeID int NOT NULL,
    PublisherID      int NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Locations (LocationID),
    FOREIGN KEY (RepresentativeID) REFERENCES Representatives (RepresentativeID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers (PublisherID)
);


CREATE TABLE Customers
(
    CustomerID   int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CompanyName  varchar(255) NOT NULL,
    FirstName    varchar(255),
    LastName     varchar(255),
    EmailAddress varchar(255),
    LocationID   int          NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Locations (LocationID)
);

CREATE TABLE Bookstores
(
    BookstoreID      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ReaderInterestID int NOT NULL,
    FOREIGN KEY (ReaderInterestID) REFERENCES ReaderInterests (ReaderInterestID)
);

SET time_zone = '-04:00';

CREATE TABLE Orders
(
    OrderID     int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderDate   timestamp DEFAULT CURRENT_TIMESTAMP,
    CustomerID  int,
    BookstoreID int,
    PublisherID int,
    IsSpecial   boolean DEFAULT false,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (BookstoreID) REFERENCES Bookstores (BookstoreID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers (PublisherID)
);

CREATE TABLE Books
(
    ISBN         int           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Subject      varchar(255),
    AuthorID     int           NOT NULL,
    PublisherID  int           NOT NULL,
    Title        varchar(255)  NOT NULL,
    SellingPrice decimal(5, 2) NOT NULL,
    CostPrice    decimal(5, 2) NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors (AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers (PublisherID)
);

CREATE TABLE OrderDetails
(
    OrderDetailsID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderID        int NOT NULL,
    ISBN           int NOT NULL,
    Quantity       int NOT NULL,
    BranchID       int NOT NULL,
    PublisherID    int NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ISBN) REFERENCES Books (ISBN),
    FOREIGN KEY (BranchID) REFERENCES Branches (BranchID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers (PublisherID)
);

CREATE TABLE Inventories
(
    InventoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BookstoreID int NOT NULL,
    ISBN        int NOT NULL,
    Quantity    int NOT NULL,
    StockDate   timestamp DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookstoreID) REFERENCES Bookstores (BookstoreID),
    FOREIGN KEY (ISBN) REFERENCES Books (ISBN)
);

