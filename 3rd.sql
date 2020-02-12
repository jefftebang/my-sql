--COUNT
select count(*) from artists where studio_id = 1;

-- SUM
select sum(length) from songs;

-- MIN
select min(length) from songs;

-- MAX
select max(length) from songs;

-- AVG
select avg(length) from songs;

---------------------------------------
-- GROUP BY
select length, genre from songs
group by genre

select avg(length), genre
from songs
group by genre;

select avg(length) as avg_length, genre
from songs
group by genre;

---------------------------------------
-- HAVING
select avg(length), genre from songs group by genre having avg(length) > 250;