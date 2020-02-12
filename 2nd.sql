C - CREATE
R - RETRIEVE
U - UPDATE
D - DROP


-- CREATE

-- INSERT to artists
INSERT INTO tableName (ColumnName1, ColumnName2...)
VALUES (valuOfColumnName1, valueOfColumnName2...)

INSERT INTO artists (name)
VALUES ("Rivermaya");

INSERT INTO artists (name)
VALUES ("Psy");

-- RETRIEVE
--SELECT * FROM

SELECT * FROM <tableName>

SELECT * FROM <tableName> WHERE <condition>;
SELECT * FROM artists WHERE id = 2;

SELECT * FROM <columnName> FROM <tableName> WHERE <condition>;

SELECT <columnName1>, <columnName2> FROM <tableName>;

-- UPDATE

UPDATE tableName SET columnName1 = newValue, columnName2 = newValue ...
WHERE columnName = value;

-- Update to songs

UPDATE songs SET length = 240 WHERE title = "Kundiman";

-- INSERT to albums
INSERT INTO albums(name, year, artist_id)
VALUES ("Psy 6", "2012", 2);

INSERT INTO albums(name, year, artist_id)
VALUES ("Trip", "1996", 1);

-- INSERT to songs
INSERT INTO songs(title, length, genre, album_id)
VALUES ("Gangnam Style", 253, "k-pop", 1),
("Kundiman", 234, "OPM", 2),
("Kisapmata", 279, "OPM", 2);

-- DELETE

DELETE FROM <tableName> WHERE column = value;

------------ JOINS

SELECT <column/s> FROM table1 JOIN table2 ON (joinCondition) WHERE condition;

SELECT name, title FROM albums JOIN songs ON (albums.id = songs.album_id);

SELECT artists.name AS artist, albums.name AS album FROM artists JOIN albums ON (artists.id = albums.artist_id);


--------to filter results,
1. LIKE
...
WHERE <columnName> LIKE <pattern>;
!!!!!!
_ -> 1 character;
% -> any number of characters;

1. ALL songs that start with letter K;

SELECT * FROM songs
WHERE title LIKE "_k%";

SELECT * FROM songs
WHERE title LIKE "__n%";

SELECT * FROM songs
WHERE title LIKE "%n";

SELECT * FROM songs
WHERE title LIKE "%d%";

SELECT * FROM songs
WHERE title NOT LIKE "%k%";

-- if case sensitive
BINARY

SELECT * FROM songs
WHERE title LIKE BINARY "%k%";

-- length
SELECT * FROM songs
WHERE title LIKE "________";

----------------------------------------------------------------------

create table starwars(
	id int not null auto_increment,
	title varchar(255) not null,
	year YEAR(4) not null,
	star varchar(255) not null,
	primary key (id)
);

insert into starwars(title,year,star)
values ("Star Wars", "1977", "Carrie Fisher"), ("Star Wars", "2015", "Carrie Fisher"), ("Star Wars", "2015", "Daisy Ridley"), ("Star Wars", "1977", "Harrison Ford"), ("Star Wars", "2015", "Harrison Ford");

--sorting
ORDER BY
-- asc and desc
select * from starwars order by year asc;
select * from starwars order by year desc;

select * from starwars order by year, star desc;
select * from starwars order by year desc, star desc;

-- unique
DISTINCT

SELECT DISTINCT star FROM starwars ORDER BY star DESC;
SELECT DISTINCT title FROM starwars;
SELECT DISTINCT year FROM starwars;
SELECT DISTINCT year, title FROM starwars;
SELECT DISTINCT year, title, star FROM starwars;
SELECT DISTINCT year FROM starwars WHERE year = 2015;
SELECT DISTINCT year FROM starwars WHERE year < 2015;