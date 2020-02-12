CREATE TABLE tableA (
	id INT NOT NULL AUTO_INCREMENT,
	a1 VARCHAR(255) NOT NULL,
	a2 INT,
	PRIMARY KEY (id)
);

CREATE TABLE tableB (
	id INT NOT NULL AUTO_INCREMENT,
	b1 VARCHAR(255),
	tableA_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (tableA_id)
		REFERENCES tableA(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

-- INSERT to tableA
INSERT INTO tableA (id, a1, a2)
VALUES (1, "A", 1);

INSERT INTO tableA (id, a1, a2)
VALUES(2, "B", 3),
(3, "C", 3),
(4, "D", 4),
(5, "E", 4);

-- INSERT to tableB
INSERT INTO tableB (id, b1, tableA_id)
VALUES (1, "V", 5);

INSERT INTO tableB (id, b1, tableA_id)
VALUES(2, "W", 4),
(3, "X", 3),
(4, "Y", 2),
(5, "Z", 1);

-- JOIN tableA and tableB
SELECT tableA.id AS A_id, a1, a2, tableB.id AS B_id, b1, tableA_id FROM tableA JOIN tableB ON (tableA.id = tableB.tableA_id);

----------------------------------------------------------
-- movies
CREATE TABLE movies (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	year DATE NOT NULL,
	length INT NOT NULL,
	genre VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

-- INSERT to movies
INSERT INTO movies(title, year, length, genre)
VALUES ("Hello, Love, Goodbye", "2019", 7020, "romance");

INSERT INTO movies(title, year, length, genre)
VALUES ("One More Chance", "2000", 8400, "drama"),
("Kakabakaba ka ba?", "1980", 6240, "thriller"),
("Barumbado", "1990", 7456, "action"),
("Sa 'Yo Lamang", "2010", 8345, "drama");


-- studios
CREATE TABLE studios (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	address VARCHAR(255),
	PRIMARY KEY (id)
);

-- INSERT to studios
INSERT INTO studios(name, address)
VALUES ("ABS-CBN", "Eugenio Lopez Dr. Diliman, Quezon City, Metro Manila");

INSERT INTO studios(name, address)
VALUES ("GMA", "GMA International, 10F GMA Network Center, EDSA cor, Timog Ave, Diliman, Quezon City, 1103 Metro Manila"),
("TV5", "Reliance St, Mandaluyong, Metro Manila"),
("RPN", "Broadcast City, 1119 Capitol Hills Dr. Diliman, Quezon City, Metro Manila");


-- producers
CREATE TABLE producers(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255),
	address VARCHAR(255),
	PRIMARY KEY (id)
);

-- INSERT to producers
INSERT INTO producers(name, address)
VALUES ("Erik Matti", "Ching Building 2345 Taft Avenue 1300, Pasay City, Philippines");

INSERT INTO producers(name, address)
VALUES ("Joyce Jimenez", "3 N. Fifth Ave. Fort Walton Beach, FL 32547"),
("Lily Monteverde", "9970 Newbridge Ave. Blackwood, NJ 08012"),
("Lav Diaz", "9325 Rockwell Ave. Memphis, TN 38106");


-- artists
CREATE TABLE artists(
	id INT NOT NULL AUTO_INCREMENT,
	screen_name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	gender VARCHAR(255) NOT NULL,
	birthday DATE NOT NULL,
	studio_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY(studio_id)
		REFERENCES studios(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

-- INSERT to artists
INSERT INTO artists (screen_name, address, gender, birthday, studio_id)
VALUES ("Alden Richards", "121 Thorne Ave. Petersburg, VA 23803", "bicurious", "1992-01-02", 2);

INSERT INTO artists (screen_name, address, gender, birthday, studio_id)
VALUES ("Bea Alonzo", "7142 E. Greystone Drive Johnson City, TN 37601", "asexual", "1987-10-17", 1),
("Christopher de Leon", "135 Sulphur Springs St. Nazareth, PA 18064", "heterosexual", "1956-10-31", 3),
("Robin Padilla", "94 Cedar Swamp Rd. Seymour, IN 47274", "heterosexual", "1969-11-23", 1);


-- movie_producer
CREATE TABLE movie_producer (
	id INT NOT NULL AUTO_INCREMENT,
	producer_id INT,
	movie_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY(producer_id)
		REFERENCES producers(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY(movie_id)
		REFERENCES movies(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

-- INSERT to movie_producer
INSERT INTO movie_producer(producer_id, movie_id)
VALUES (1, 1);

INSERT INTO movie_producer(producer_id, movie_id)
VALUES (1, 2), (2, 1), (3, 4), (3, 3), (4, 5);


-- artist_movie
CREATE TABLE artist_movie(
	id INT NOT NULL AUTO_INCREMENT,
	movie_id INT,
	artist_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (movie_id)
		REFERENCES movies(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY (artist_id)
		REFERENCES artists(id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

-- INSERT to artist_movie
INSERT INTO artist_movie(movie_id, artist_id)
VALUES (1, 1);

INSERT INTO artist_movie(movie_id, artist_id)
VALUES (2, 2), (3, 3), (4, 4), (5, 2), (5, 3);


-- 2)
SELECT * FROM movies WHERE year > 1990;

-- 3)
SELECT screen_name FROM artists WHERE gender = "heterosexual" AND studio_id = 1;

-- 4)
SELECT name FROM producers;

-- 5)
UPDATE producers SET address = "9510 Shirley St. Logansport, IN 46947" WHERE name = "Erik Matti";

-- 6)
UPDATE artists SET gender = "heterosexual";

-- 7)
DELETE FROM studios WHERE id = 4;

-- 8)
SELECT screen_name, name AS studioName, studios.address AS studioAddress FROM studios JOIN artists ON(studios.id = artists.studio_id);

-- 9)
SELECT title AS movieTitle, year, screen_name, address, birthday FROM artist_movie JOIN movies ON(artist_movie.movie_id = movies.id) JOIN artists ON(artists.id = artist_movie.artist_id);

-- 10)
SELECT name AS producerName, title AS movieTitle, genre FROM movie_producer RIGHT JOIN producers ON(movie_producer.producer_id = producers.id) JOIN movies ON(movies.id = movie_producer.movie_id);


-------------------------------------------------------

-- 11)
SELECT * FROM artists
WHERE screen_name NOT LIKE "%s" order by birthday desc;

-- 12)
SELECT screen_name, name AS studios FROM artists JOIN studios ON(artists.studio_id = studios.id) ORDER BY screen_name DESC;

-- 13)
SELECT DISTINCT title FROM artist_movie JOIN movies ON(artist_movie.movie_id = movies.id) order by movie_id desc;

-- 14)
SELECT name AS producers, title AS movieTitle, genre, length FROM movie_producer JOIN producers ON(movie_producer.producer_id = producers.id) JOIN movies ON(movies.id = movie_producer.movie_id) WHERE name LIKE "%m%" ORDER BY length;

--15)
SELECT name FROM movie_producer JOIN producers ON(movie_producer.producer_id = producers.id) JOIN movies ON(movies.id = movie_producer.movie_id) WHERE name LIKE BINARY "P%";

--------------------------------------------------

-- 2)
select title from movies where id =
(select movie_id from movie_producer where producer_id = 4);


-- 3)
select name from producers where id =
(select producer_id from movie_producer where movie_id = 3);


-- 4)
select title from movies where id =
(select movie_id from artist_movie where artist_id = 1);


-- 5)
select birthday from artists where screen_name =
(select screen_name from artists where id =
(select artist_id from artist_movie where movie_id = 
(select id from movies where title = "Hello, Love, Goodbye")));

-- 6)
select name from studios where id =
(select studio_id from artists where id =
(select artist_id from artist_movie where movie_id = 
(select id from movies where title = "Barumbado")));

--------------------------------------------------

avg length of movies per studio


select avg(length), studios.name from artists
	join studios on (artists.studio_id = studios.id)
	join artist_movie on (artists.id = artist_movie.artist_id)
	join movies on (artist_movie.movie_id = movies.id)
	group by studios.name;
