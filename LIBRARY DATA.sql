create database Library;
use Library;
CREATE TABLE Authors (
    AuthorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    Genre VARCHAR(100),
    Status VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Patrons (
    PatronID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT PRIMARY KEY,
    PatronID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE NULL,
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
Insert into authors (AuthorId,Name,Country)
values
(1, 'J.K. Rowling', 'UK'),
(2,'George Orwell',"UK"),
(3, 'J.R.R. Tolkien', 'UK'),
(4, 'Mark Twain', 'USA'),
(5, 'F. Scott Fitzgerald', 'USA');
select * from authors;


INSERT INTO Books (BookID, Title, AuthorID, Genre, Status) VALUES
(1, 'Harry Potter and Sorcerer’s Stone', 1, 'Fantasy', 'Available'),
(2, '1984', 2, 'Dystopian', 'Borrowed'),
(3, 'The Hobbit', 3, 'Fantasy', 'Available'),
(4, 'The Adventures of Huckleberry Finn', 4, 'Adventure', 'Available'),
(5, 'The Great Gatsby', 5, 'Classic', 'Available');

INSERT INTO Patrons (PatronID, Name, Address, Phone) VALUES
(1, 'John Doe', '123 Main St, Springfield', '555-1234'),
(2, 'Alice Smith', '456 Elm St, Springfield', '555-5678'),
(3, 'Bob Johnson', '789 Oak St, Springfield', '555-9876');

INSERT INTO Borrowing (BorrowID, PatronID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, 2, '2024-12-01', '2024-12-10'),
(2, 2, 1, '2024-11-15', '2024-11-25'),
(3, 3, 3, '2024-11-20', NULL);

## question 02
Insert into authors (AuthorId,Name,Country) Values
(6,"Sumit","India");

## question 01

INSERT INTO Books (BookID, Title, AuthorID, Genre, Status) VALUES
(6,"SQL",6,"Business Analysis","Available");

## Question 03
INSERT INTO Patrons (PatronID, Name, Address, Phone) VALUES
(4,"Souvik","kolkata","100-001");

## question 04
INSERT INTO Borrowing (BorrowID, PatronID, BookID, BorrowDate, ReturnDate) VALUES
(4,4,6,'2024-12-05', NULL);

update books
set Status = "Borrowed"
where BookId = 6;
select * from books;

## Question 05 - 

update borrowing
set ReturnDate = "2024-12-04"
where BookID = 6;
select * from borrowing;

update books
set Status = "Available"
where BookID = 6;
# Question 06

select * from books
where status = "Available";

## Questio 07 View Borrowed Books by Patron: Query the Borrowing table to display the list of books borrowed by a specific patron.



SELECT b.BorrowID, b.PatronID, b.BookID, v.Title, v.Status,p.Name
FROM Borrowing AS b
LEFT JOIN Books AS v
ON b.BookID = v.BookID
join patrons as p
on b.PatronID = p.PatronID
where b.PatronID = 1;

## Question no. 08 .	Find Books by Author: Query the Books table to find all books by a specific author.

select b.BookID,b.Title,b.AuthorID, a.Name
from books as b 
left join authors as a
on b.AuthorID = a.AuthorID
where a.Name = "J.K. Rowling";


### Question 09	Find Most Borrowed Books: Query to find the top 5 most borrowed books based on the number of borrowings.


SELECT b.BookID, v.Title, COUNT(b.BookID) AS BorrowCount
FROM Borrowing AS b
JOIN Books AS v
ON b.BookID = v.BookID
GROUP BY b.BookID
ORDER BY BorrowCount DESC
LIMIT 5;




