--#12 List the film title and the leading actor for all of the films 'Julie Andrews' played in.
--#   Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
--#   Title is not a unique field, create a table of IDs in your subquery
SELECT movie.title, actor.name
FROM movie 
JOIN casting ON (movie.id = casting.movieid AND casting.ord = 1)
JOIN actor ON actor.id = casting.actorid
WHERE casting.movieid IN (SELECT movieid
                          FROM casting 
                          JOIN movie ON casting.movieid = movie.id
                          JOIN actor ON casting.actorid = actor.id
                          WHERE actor.name = 'Julie Andrews')

