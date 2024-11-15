-- 1
CREATE TABLE IF NOT EXISTS authors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
------------------------------------------------------------------------
-- 2
CREATE TABLE IF NOT EXISTS books (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(100) NOT NULL,
    summary TEXT,
    published_date DATE,
    metadata JSON,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--------------------------------------------------------------------------
-- 3
CREATE TABLE IF NOT EXISTS publishers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    country CHAR(2) NOT NULL,  -- ISO 3166-1 alpha-2 format
    founded_year INTEGER,
    details JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
------------------------------------------------------------------------------
-- 4
CREATE TABLE IF NOT EXISTS libraries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    location TEXT,
    open_time TIME,
    close_time TIME,
    facilities JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
---------------------------------------------------------------------------------
-- 5.1
CREATE TABLE author_book (
    author_id UUID REFERENCES authors(id) ON DELETE CASCADE,
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    PRIMARY KEY (author_id, book_id)
);
---------------------------------------------------------------------------------------
-- 5.2
CREATE TABLE book_publisher (
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    publisher_id UUID REFERENCES publishers(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, publisher_id)
);
-----------------------------------------------------------------------------------------
-- 5.3
CREATE TABLE library_book (
    library_id UUID REFERENCES libraries(id) ON DELETE CASCADE,
    book_id UUID REFERENCES books(id) ON DELETE CASCADE,
    PRIMARY KEY (library_id, book_id)
);
-------------------------------------------------------------------------------------



