
-- Creating the library management system.

CREATE DATABASE lms;

-- Creating the tables needed for the library management system. 

CREATE TABLE lms_bookborrowers(
libcardNo int primary key not null,
name varchar(50) not null,
address varchar(200) not null,
phone varchar(20) not null
);

CREATE TABLE lms_branch(
branchId int primary key not null,
branchName varchar(50) not null,
branchAddress varchar(200)
);

CREATE TABLE lms_books(
bookId int primary key not null,
bookTitle varchar(200) not null,
bookPublisher varchar(200) not null
);

CREATE TABLE lms_bookloans(
loansId int primary key not null,
bookId int not null references lms_books(bookId),
branchId int not null references lms_branch(branchId),
libcardNo int not null references lms_bookborrowers(libcardNo),
dateOut date,
dueDate date
);

-- Inserting data into the tables in the library management system.
Insert into lms_bookborrowers(

)

values

