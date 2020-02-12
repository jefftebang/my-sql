JOINS
SELECT <column/s> FROM table1 JOIN table2 ON (joinCondition) WHERE condition;

SELECT name, title FROM albums JOIN songs ON (albums.id = songs.album_id);

SELECT artists.name AS artist, albums.name AS album FROM artists JOIN albums ON (artists.id = albums.artist_id);