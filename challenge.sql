-- Very Easy: Create a table with your top three cars and include make, model, year.
-- Create a query to add in two more cars

CREATE TABLE cars(
id INT PRIMARY KEY AUTO_INCREMENT,
make VARCHAR (100),
model VARCHAR (100),
year INT)
;

-- adding cars 
INSERT INTO cars(make, model, year)
VALUES(
"Ford",
"Mustang",
2013
),(
"Honda",
"s2000",
2003
);

-- Easy: Create a table with your top five favorite books with Title, Publish Date, and
-- Author First/Last Name Create a query to add in two new books Remove the oldest book
-- Provide an additional query giving the sum of all books.

CREATE TABLE top_books(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR (100),
author_first_name VARCHAR(100),
author_last_name VARCHAR(100),
publish_date DATE
);

-- adding two books
INSERT INTO top_books(title, author_first_name, author_last_name, publish_date)
VALUES(
"Bananas",
"George",
"Cu",
"1990-11-15"
),(
"I love you to the moon and back",
"Julia",
"Chang",
"2008-10-15"
);
-- delting the oldest 
DELETE FROM top_books 
WHERE publish_date IS NOT NULL
ORDER BY publish_date ASC
LIMIT 1;
-- sum of all books 
SELECT * FROM books;

-- Medium: Create a table with your top 10 movies. Include title, release date, and
-- rating Create a query that pulls all movies, in order of release date, where the
-- title includes the letter “s”.

CREATE TABLE fav_movies(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR (100),
release_date DATE,
rating INT
);

INSERT INTO fav_movies(title, release_date,rating)
VALUES(
'Skyfall',
'2012-11-09',
1
),(
'Spiderman',
'2003-05-03',
2
),(
'Shrek',
'2001-04-22',
3
),(
'House of wax',
'2005-04-26',
4
),(
'Soul',
'2020-10-11',
5
),(
'Cars',
'2006-06-09',
6
),(
'Titanic',
'1997-12-19',
7
),(
'Dr. Strange',
'2016-11-04',
8
),(
'Marley and Me',
'2008-12-25',
9
),(
'Legally Blonde',
'2001-07-13',
10
);

--  query that pulls all movies, in order of release date, where the title includes the letter “s”.
SELECT * FROM fav_movies
WHERE title LIKE '%s%'
ORDER BY release_date ASC;

-- Hard: Make a copy of your Medium Challenge Write out the queries that would add
-- the director’s First Name and Last Name into two separate columns. Create a query that
-- puts the names together. Create a query to put the list in alphabetical order by the 
-- last name from A-Z After you order the list, remove the Movies where the Last Name ends
-- with ”R-Z” Write a query where the first three appear

ALTER TABLE fav_movies
ADD COLUMN directors_First_Name VARCHAR (20); 
ALTER TABLE fav_movies
ADD COLUMN directors_Last_Name VARCHAR (20); 

-- adding directors 
UPDATE fav_movies
SET directors_First_Name = "Regan"
WHERE id = 10;

UPDATE fav_movies
SET directors_Last_Name = "Stamos"
WHERE id = 10;

SELECT CONCAT(directors_First_Name," ",directors_Last_Name)
AS full_name
FROM fav_movies; --  " " space


SELECT * FROM fav_movies
ORDER BY directors_Last_Name ;

DELETE FROM fav_movies WHERE  director’s_Last_Name >= "r" AND director’s_Last_Name <= "z";

SELECT * FROM fav_movies
ORDER BY directors_Last_Name
LIMIT 3;

-- Very Hard: Copy the table from your Very Easy Challenge Write a query to add in three cars
-- at once Write a query to add in prices and colors for each of these cars Write a query to
-- put the Make and Model together in one column Create a new query that adds an additional
-- column to the results to show how many cars have the same Make.



CREATE TABLE carInventory(
id INT PRIMARY KEY AUTO_INCREMENT,
make VARCHAR (100),
model VARCHAR (100),
year INT,
Price DECIMAL(7,2),
color VARCHAR(100)
);

INSERT INTO carInventory (make, model, year, Price, color)
VALUES
('Acura',
'MDX',
'2022',
75000.00,
'Navy Blue'),
('Ford',
'Explore',
'2019',
55000.00,
'Black'),
('Mitsubishi',
'Evo',
'2012',
90000.00,
'White');

SELECT CONCAT(make," ",model)
AS Make_and_model
FROM carInventory; 

SELECT make, COUNT(make)
AS sameMake
FROM carInventory
GROUP BY make;