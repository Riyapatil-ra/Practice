USE lms;
SHOW TABLES;

DESCRIBE Authors;
DESCRIBE Books;
DESCRIBE Members;
DESCRIBE Borrowrecords;

INSERT INTO Authors (author_name, phone) 
VALUES ('J.K. Rowling', '123-456-7890'),
       ('George R.R. Martin', '987-654-3210'),
       ('Agatha Christie', '555-555-5555');

INSERT INTO Books (title, genre, price, publication_year, author_id, stock) 
VALUES ('Harry Potter and the Sorcerer''s Stone', 'Fiction', 19.99, 1997, 1, 10),
       ('A Game of Thrones', 'Fiction', 29.99, 1996, 2, 5),
       ('Murder on the Orient Express', 'Fiction', 14.99, 1934, 3, 7);

INSERT INTO Members (full_name,email,phone,join_date)
VALUES ('John Doe', 'john.doe@example.com', '555-1234', '2023-01-01'),
       ('Jane Smith', 'jane.smith@example.com', '555-5678', '2023-01-02'),
       ('Bob Johnson', 'bob.johnson@example.com', '555-9012', '2023-01-03');

INSERT INTO Borrowrecords (member_id, book_id, borrow_date,return_date,fine) 
VALUES (1, 1, '2023-01-15', NULL, 0.00),
       (2, 2, '2023-01-16', NULL, 0.00),
       (3, 3, '2023-01-17', NULL, 0.00);

INSERT INTO Borrowrecords (member_id, book_id, borrow_date,return_date,fine) 
VALUES (1, 1, '2024-05-20', '2024-05-22', 0.00),
       (2, 2, '2025-09-28', '2025-09-30', 0.00),
       (3, 3, '2022-02-17', '2022-02-20', 0.00);

INSERT INTO Books(title, genre, price, author_id) 
VALUES ('The Hobbit', 'Fiction', 12.99, 1);

INSERT INTO members (full_name, email)
VALUES ('Alice Brown', 'alice.brown@example.com'); 

INSERT INTO Books (title, genre, price, publication_year, author_id, stock) 
VALUES ('The Foundation', 'Science Fiction', -5.00, 1951, 2, 8);

INSERT INTO Books (title, genre, price, publication_year, author_id, stock) 
VALUES ('The Foundation', 'Comics', 5.00, 1951, 2, 8);

INSERT INTO members (full_name, email,phone)
VALUES ('Charlie Green', 'charlie.green@example.com', '555-555-5555'),
('John Doe', 'charlie.green@example.com', '555-1234');

UPDATE Authors SET phone='111-111-1111' WHERE author_name='J.K. Rowling';
UPDATE Books SET price=price * 1.10 WHERE genre='Fiction';
UPDATE Borrowrecords SET return_date = '2024-07-25' WHERE member_id = 3;
UPDATE Books SET stock=5 WHERE price > 300;
UPDATE members SET phone='909-090-9090', email='janesmith@gmail.com' WHERE full_name='Jane Smith';

DELETE FROM borrowrecords WHERE member_id=1;
DELETE FROM borrowrecords WHERE return_date=NULL;
DELETE FROM Books WHERE stock=0;
DELETE FROM Members WHERE email='bob.johnson@example.com';

DELETE FROM Authors WHERE author_name='Agatha Christie';

SELECT * FROM Books;
SELECT * FROM Authors;
SELECT * FROM Members;
SELECT * FROM Borrowrecords;

