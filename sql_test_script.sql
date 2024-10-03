                                       Insert Data:

-- Insert data into Authors
INSERT INTO Authors (AuthorsID, FirstName, LastName, DateOfBirth)
VALUES (1, 'Jane', 'Doe', TO_DATE('1980-04-12', 'YYYY-MM-DD'));

INSERT INTO Authors (AuthorsID, FirstName, LastName, DateOfBirth)
VALUES (2, 'John', 'Smith', TO_DATE('1975-10-10', 'YYYY-MM-DD'));

-- Insert data into Books
INSERT INTO Books (BookID, Title, PublicationDate, AuthorsID)
VALUES (1, 'Book Title One', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 1);

INSERT INTO Books (BookID, Title, PublicationDate, AuthorsID)
VALUES (2, 'Book Title Two', TO_DATE('2021-07-15', 'YYYY-MM-DD'), 2);

-- Insert data into Users
INSERT INTO Users (UsersID, FirstName, LastName, Email, Phone)
VALUES (1, 'Alice', 'Johnson', 'alice@example.com', '123-456-7890');

INSERT INTO Users (UsersID, FirstName, LastName, Email, Phone)
VALUES (2, 'Bob', 'Williams', 'bob@example.com', '234-567-8901');

-- Insert data into Loans
INSERT INTO Loans (LoanID, BookID, UsersID, LoanDate, ReturnDate)
VALUES (1, 1, 1, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'));

INSERT INTO Loans (LoanID, BookID, UsersID, LoanDate, ReturnDate)
VALUES (2, 2, 2, TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'));


                              Update Data:


-- Update a Book title
UPDATE Books
SET Title = 'Updated Book Title One'
WHERE BookID = 1;

-- Update a User's email
UPDATE Users
SET Email = 'newalice@example.com'
WHERE UsersID = 1;


                                Delete Data:


-- Delete a loan record
DELETE FROM Loans
WHERE LoanID = 1;

-- Delete a user
DELETE FROM Users
WHERE UsersID = 1;


                                   Joins:


-- Retrieve book titles along with their authors' first and last names
SELECT Books.Title, Authors.FirstName, Authors.LastName
FROM Books
JOIN Authors ON Books.AuthorsID = Authors.AuthorsID;

-- Retrieve users who have borrowed books and their loan details
SELECT Users.FirstName, Users.LastName, Books.Title, Loans.LoanDate, Loans.ReturnDate
FROM Users
JOIN Loans ON Users.UsersID = Loans.UsersID
JOIN Books ON Books.BookID = Loans.BookID;


                                           Subqueries:


-- Find all books that were borrowed by a specific user (e.g., user ID 1)
SELECT Title
FROM Books
WHERE BookID IN (SELECT BookID FROM Loans WHERE UsersID = 1);



                           DCL (Data Control Language):

-- Grant privileges to a user (example)
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO some_user;

-- Revoke privileges from a user (example)
REVOKE SELECT, INSERT ON Books FROM some_user;


                 TCL (Transaction Control Language):



COMMIT;


ROLLBACK;