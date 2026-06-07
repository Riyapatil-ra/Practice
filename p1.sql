CREATE DATABASE IF NOT EXISTS lms;
USE lms;

CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100) CHECK (genre IN ('Fiction', 'Non-Fiction', 'Science', 'History')),
    price DECIMAL(10, 2) CHECK (price > 0),
    publication_year YEAR,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(AuthorID) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    join_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS  Borrow(
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    CHECK (return_date IS NULL OR return_date >= borrow_date),
    FOREIGN KEY (member_id) REFERENCES Members(MemberID),
    FOREIGN KEY (book_id) REFERENCES Books(BookID)
);

ALTER TABLE Authors ADD COLUMN phone VARCHAR(20);
ALTER TABLE Books ADD COLUMN stock INT DEFAULT 0 CHECK (stock >= 0);

ALter  TABLE Authors Modify author_name VARCHAR(500) NOT NULL;
ALTER TABLE Members MODIFY phone VARCHAR(15);

ALTER TABLE Members RENAME COLUMN member_name TO full_name;

ALTER TABLE Borrow RENAME TO Borrowrecords;

ALTER TABLE Authors DROP COLUMN nationality;

SHOW CREATE TABLE books;

ALTER TABLE Books DROP CONSTRAINT books_chk_1;

ALTER TABLE Members MODIFY phone VARCHAR(15) NOT NULL;

ALTER TABLE borrowrecords ADD COLUMN fine DECIMAL(10, 2) DEFAULT 0 CHECK (fine >= 0);

DROP TABLE IF EXISTS borrowrecords;

SeLECT * FROM books;

TRUNCATE TABLE books;

