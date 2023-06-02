--# 11
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--# 12 
SELECT movie.title, actor.name
FROM movie 
JOIN casting ON (movie.id = casting.movieid AND casting.ord = 1)
JOIN actor ON actor.id = casting.actorid
WHERE casting.movieid IN (SELECT movieid
                          FROM casting 
                          JOIN movie ON casting.movieid = movie.id
                          JOIN actor ON casting.actorid = actor.id
                          WHERE actor.name = 'Julie Andrews')
                          
-- #13
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15
ORDER BY actor.name

-- #14
SELECT movie.title, COUNT(*)
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP by movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title

-- #14
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN (SELECT casting.movieid
                          FROM actor
                          JOIN casting ON actor.id = casting.actorid
                          WHERE actor.name = 'Art Garfunkel')
      AND actor.name <> 'Art Garfunkel'

