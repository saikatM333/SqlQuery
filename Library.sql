CREATE DATABASE LibraryDB;



USE LibraryDB;



CREATE TABLE Authors (
    author_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    nationality NVARCHAR(100)
);



CREATE TABLE Books (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);



INSERT INTO Authors (name, nationality) VALUES ('J.K. Rowling', 'British');
INSERT INTO Authors (name, nationality) VALUES ('J.R.R. Tolkien', 'British');



INSERT INTO Books (title, author_id) VALUES ('Harry Potter and the Philosopher''s Stone', 1);
INSERT INTO Books (title, author_id) VALUES ('The Hobbit', 2);
INSERT INTO Books (title, author_id) VALUES ('The Lord of the Rings', 2);

select * from Books ;
select * from Authors;

use employeeDB;
