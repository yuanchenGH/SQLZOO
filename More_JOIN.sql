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

