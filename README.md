# Library Management System (LMS) Database Analysis

## Introduction

In this project, I delve into the analysis of a Library Management System (LMS) database. The LMS database encompasses several tables, each representing a distinct facet of library operations, such as books, borrowers, branches, and book loans.

## Goals and Objectives

The primary objective of this project is to showcase proficiency in SQL database management. By designing tables, inserting data, establishing relationships, and employing SQL queries and functions, I aim to demonstrate a comprehensive understanding of database design and manipulation.

## Relational Schema

The relational schema for the LMS database is as follows:

- **lms_books:**
  - bookId (Primary Key)
  - bookTitle
  - author
  - publisher

- **lms_branch:**
  - branchId (Primary Key)
  - branchName
  - branchAddress

- **lms_bookborrowers:**
  - libcardNo (Primary Key)
  - name
  - address
  - phone

- **lms_bookloans:**
  - loansId (Primary Key)
  - bookId (Foreign Key referencing lms_books)
  - branchId (Foreign Key referencing lms_branch)
  - libcardNo (Foreign Key referencing lms_bookborrowers)
  - dateOut
  - dueDate

## Queries/Scripts Used

The SQL queries and scripts used in this project can be found in the accompanying SQL file (e.g., `lms_queries.sql`).

## Conclusion

This project offers a comprehensive analysis of the Library Management System database, showcasing proficiency in SQL database management techniques. By utilizing SQL queries, functions, and scripts, valuable insights are extracted, aiding in effective library management strategies and decision-making processes.
