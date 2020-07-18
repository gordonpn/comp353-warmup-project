-- Do not change the order of execution
CREATE TABLE ReaderInterest
(
    ReaderInterestID          int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ReaderInterestName        varchar(255),
    ReaderInterestDescription varchar(255)
);

CREATE TABLE Author
(
    AuthorID int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name     varchar(255) NOT NULL
);

CREATE TABLE Location
(
    LocationID      int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TelephoneNumber int,
    Address         varchar(255) NOT NULL,
    PostalCode      varchar(255) NOT NULL,
    City            varchar(255) NOT NULL,
    Province        varchar(255) NOT NULL
);

CREATE TABLE Representative
(
    RepresentativeID int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    EmailAddress     varchar(255),
    Name             varchar(255) NOT NULL
);

CREATE TABLE HeadOffice
(
    HeadOfficeID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Location     int NOT NULL,
    FOREIGN KEY (Location) REFERENCES Location (LocationID)
);

CREATE TABLE Publisher
(
    PublisherID   int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PublisherName varchar(255) NOT NULL,
    CompanyName   varchar(255) NOT NULL,
    EmailAddress  varchar(255),
    Website       varchar(255),
    HeadOffice    int          NOT NULL,
    FOREIGN KEY (HeadOffice) REFERENCES HeadOffice (HeadOfficeID)
);

CREATE TABLE Branch
(
    BranchID       int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name           varchar(255),
    Location       int NOT NULL,
    Representative int NOT NULL,
    Publisher      int NOT NULL,
    FOREIGN KEY (Location) REFERENCES Location (LocationID),
    FOREIGN KEY (Representative) REFERENCES Representative (RepresentativeID),
    FOREIGN KEY (Publisher) REFERENCES Publisher (PublisherID)
);


CREATE TABLE Customer
(
    CustomerID   int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CompanyName  varchar(255) NOT NULL,
    FirstName    varchar(255),
    LastName     varchar(255),
    EmailAddress varchar(255),
    Location     int          NOT NULL,
    FOREIGN KEY (Location) REFERENCES Location (LocationID)
);

CREATE TABLE Bookstore
(
    BookstoreID    int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ReaderInterest int NOT NULL,
    FOREIGN KEY (ReaderInterest) REFERENCES ReaderInterest (ReaderInterestID)
);

SET time_zone = '-04:00';

CREATE TABLE Orders
(
    OrderNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderDate   timestamp DEFAULT CURRENT_TIMESTAMP,
    Customer    int,
    Branch      int NOT NULL,
    Publisher   int NOT NULL,
    Bookstore   int,
    totalPrice  int NOT NULL,
    FOREIGN KEY (Customer) REFERENCES Customer (CustomerID),
    FOREIGN KEY (Branch) REFERENCES Branch (BranchID),
    FOREIGN KEY (Publisher) REFERENCES Publisher (PublisherID),
    FOREIGN KEY (Bookstore) REFERENCES Bookstore (BookstoreID)
);

CREATE TABLE Books
(
    ISBN         int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Subject      varchar(255),
    Author       int          NOT NULL,
    Title        varchar(255) NOT NULL,
    SellingPrice int          NOT NULL,
    CostPrice    int          NOT NULL,
    FOREIGN KEY (Author) REFERENCES Author (AuthorID)
);

CREATE TABLE OrderDetails
(
    OrderDetailsID 	 int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OrderNumber    	 int NOT NULL,
    ISBN           	 int NOT NULL,
    Quantity       	 int NOT NULL,
    orderDetailPrice int NOT NULL,
    FOREIGN KEY (OrderNumber) REFERENCES Orders (OrderNumber),
    FOREIGN KEY (ISBN) REFERENCES Books (ISBN)
);

CREATE TABLE Inventory
(
    InventoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Bookstore   int NOT NULL,
    ISBN        int NOT NULL,
    Quantity    int NOT NULL,
    stockDate   timestamp DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Bookstore) REFERENCES Bookstore (BookstoreID),
    FOREIGN KEY (ISBN) REFERENCES Books (ISBN)
);

