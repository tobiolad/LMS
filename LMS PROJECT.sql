-- Creating the library management system database
CREATE DATABASE lms;

-- Creating the tables needed for the library management system
CREATE TABLE lms_bookborrowers (
    libcardNo INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE lms_branch (
    branchId INT PRIMARY KEY NOT NULL,
    branchName VARCHAR(50) NOT NULL,
    branchAddress VARCHAR(200)
);

CREATE TABLE lms_books (
    bookId INT PRIMARY KEY NOT NULL,
    bookTitle VARCHAR(200) NOT NULL,
    author VARCHAR(200),
    publisher VARCHAR(200) NOT NULL
);

CREATE TABLE lms_bookloans (
    loansId INT PRIMARY KEY NOT NULL,
    bookId INT NOT NULL REFERENCES lms_books(bookId),
    branchId INT NOT NULL REFERENCES lms_branch(branchId),
    libcardNo INT NOT NULL REFERENCES lms_bookborrowers(libcardNo),
    dateOut DATE,
    dueDate DATE
);

-- Inserting data into the tables in the library management system
INSERT INTO lms_books (bookId, bookTitle, author, publisher)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner'),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott'),
    (3, '1984', 'George Orwell', 'Secker & Warburg'),
    (4, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton'),
    (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company'),
    (6, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin'),
    (7, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Bloomsbury'),
    (8, 'Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin'),
    (9, 'To the Lighthouse', 'Virginia Woolf', 'Hogarth Press'),
    (10, 'The Adventures of Huckleberry Finn', 'Mark Twain', 'Charles L. Webster and Company');

INSERT INTO lms_branch (branchId, branchName, branchAddress)
VALUES
    (1, 'Central', '123 Main Street, Toronto, ON'),
    (2, 'Eastside', '456 Elm Street, Vancouver, BC'),
    (3, 'Westside', '789 Oak Street, Montreal, QC'),
    (4, 'Northside', '101 Pine Street, Calgary, AB');

INSERT INTO lms_bookborrowers (libcardNo, name, address, phone)
VALUES
    (1001, 'John Smith', '123 Maple Avenue, Toronto, ON', '416-123-4567'),
    (1002, 'Emily Johnson', '456 Oak Street, Vancouver, BC', '604-987-6543'),
    (1003, 'David Lee', '789 Elm Street, Montreal, QC', '514-234-5678'),
    (1004, 'Sarah Brown', '101 Pine Avenue, Calgary, AB', '403-345-6789');

INSERT INTO lms_bookloans (loansId, bookId, branchId, libcardNo, dateOut, dueDate)
VALUES
    (1, 1, 1, 1001, '2023-01-01', '2023-01-15'),
    (2, 2, 1, 1002, '2023-01-02', '2023-01-16'),
    (3, 3, 2, 1003, '2023-01-03', '2023-01-17'),
    (4, 4, 2, 1004, '2023-01-04', '2023-01-18'),
    (5, 5, 3, 1001, '2023-01-05', '2023-01-19'),
    (6, 6, 3, 1002, '2023-01-06', '2023-01-20'),
    (7, 7, 4, 1003, '2023-01-07', '2023-01-21'),
    (8, 8, 4, 1004, '2023-01-08', '2023-01-22'),
    (9, 9, 1, 1001, '2023-01-09', '2023-01-23'),
    (10, 10, 1, 1002, '2023-01-10', '2023-01-24'),
    (11, 1, 2, 1003, '2023-01-11', '2023-01-25'),
    (12, 2, 2, 1004, '2023-01-12', '2023-01-26'),
    (13, 3, 3, 1001, '2023-01-13', '2023-01-27'),
    (14, 4, 3, 1002, '2023-01-14', '2023-01-28'),
    (15, 5, 4, 1003, '2023-01-15', '2023-01-29'),
    (16, 6, 4, 1004, '2023-01-16', '2023-01-30'),
    (17, 7, 1, 1001, '2023-01-17', '2023-01-31'),
    (18, 8, 1, 1002, '2023-01-18', '2023-02-01'),
    (19, 9, 2, 1003, '2023-01-19', '2023-02-02'),
    (20, 10, 2, 1004, '2023-01-20', '2023-02-03'),
    (21, 1, 3, 1001, '2023-01-21', '2023-02-04'),
    (22, 2, 3, 1002, '2023-01-22', '2023-02-05'),
    (23, 3, 4, 1003, '2023-01-23', '2023-02-06'),
    (24, 4, 4, 1004, '2023-01-24', '2023-02-07'),
    (25, 5, 1, 1001, '2023-01-25', '2023-02-08'),
    (26, 6, 1, 1002, '2023-01-26', '2023-02-09'),
    (27, 7, 2, 1003, '2023-01-27', '2023-02-10'),
    (28, 8, 2, 1004, '2023-01-28', '2023-02-11'),
    (29, 9, 3, 1001, '2023-01-29', '2023-02-12'),
    (30, 10, 3, 1002, '2023-01-30', '2023-02-13');

-- Checking the database (Database preview)
SELECT * FROM lms_bookloans;
SELECT * FROM lms_books;
SELECT * FROM lms_branch;
SELECT * FROM lms_bookborrowers;

-- Creating views
-- Books Available View: This view lists the books available in each branch.
CREATE VIEW books_available AS
SELECT b.bookTitle, b.author, b.publisher, br.branchName
FROM lms_books b
JOIN lms_bookloans bl ON b.bookId = bl.bookId
JOIN lms_branch br ON bl.branchId = br.branchId
WHERE bl.returnDate IS NULL;

-- Overdue Loans View: This view displays details of overdue loans.
CREATE VIEW overdue_loans AS
SELECT bl.*, bb.name, bb.address, bb.phone
FROM lms_bookloans bl
JOIN lms_bookborrowers bb ON bl.libcardNo = bb.libcardNo
WHERE bl.dueDate < CURRENT_DATE AND bl.returnDate IS NULL;

-- Applying SQL functions
-- 1. Aggregate Function (COUNT)
SELECT branchId, COUNT(*) AS total_loans
FROM lms_bookloans
GROUP BY branchId;

-- 2. String Function (CONCAT)
SELECT CONCAT(name, ', ', address) AS borrower_info
FROM lms_bookborrowers;

-- 3. Date Function (DATE_DIFF)
SELECT loansId, DATEDIFF(returnDate, dueDate) AS days_overdue
FROM lms_bookloans
WHERE returnDate IS NOT NULL;

-- 4. Subquery
SELECT branchId, branchName
FROM lms_branch
WHERE branchId = (
    SELECT branchId
    FROM (
        SELECT branchId, COUNT(*) AS total_loans
        FROM lms_bookloans
        GROUP BY branchId
        ORDER BY total_loans DESC
        LIMIT 1
    ) AS subquery
);

-- 5. Join
SELECT bl.*, lb.bookTitle, lb.author, lb.publisher
FROM lms_bookloans bl
JOIN lms_books lb ON bl.bookId = lb.bookId
WHERE bl.libcardNo = 1001;

-- 6. Common Table Expression (CTE)
WITH overdue_cte AS (
    SELECT *
    FROM lms_bookloans
    WHERE dueDate < CURRENT_DATE AND returnDate IS NULL
)
SELECT COUNT(*) AS total_overdue_loans
FROM overdue_cte;

-- 7. Window Function (ROW_NUMBER)
SELECT loansId, libcardNo, dueDate,
       ROW_NUMBER() OVER (ORDER BY dueDate) AS row_num
FROM lms_bookloans;

-- 8. CASE Statement
SELECT loansId, libcardNo, dueDate,
       ROW_NUMBER() OVER (ORDER BY dueDate) AS row_num
FROM lms_bookloans;

-- 9. Union
SELECT loansId, CASE
                    WHEN returnDate IS NULL AND dueDate < CURRENT_DATE THEN 'Overdue'
                    ELSE 'Not Overdue'
                 END AS loan_status
FROM lms_bookloans;

-- 10. Mathematical Function (ROUND)
SELECT loansId, libcardNo, dueDate,
       ROUND(EXTRACT(MONTH FROM dueDate)) AS due_month
FROM lms_bookloans;
