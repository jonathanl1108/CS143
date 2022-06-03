
-- The names of all the actors in the movie 'Die Another Day'

 SELECT CONCAT(first, ' ', last)
 FROM Actor JOIN MovieActor ON Actor.id =  MovieActor.aid
 WHERE MovieActor.mid= (SELECT id 
			FROM Movie 
			WHERE title= 'Die Another Day');


-- The count of all the actors who acted in multiple movies

SELECT COUNT(DISTINCT Ma.aid)
FROM MovieActor AS Ma
GROUP BY Ma.aid
HAVING COUNT(DISTINCT Ma.mid) > 1 ;


   -- The title of movies that sell more than 1,000,000 tickets

SELECT title
FROM Movie JOIN Sales ON Movie.id = Sales.mid
WHERE ticketsSold > 1000000;

   -- The director(s)' names that direct(s) the largest number of movies.

SELECT CONCAT(first, ' ', last)
FROM Director 
JOIN MovieDirector ON Director.id = MovieDirector.did
GROUP BY MovieDirector.did
HAVING MAX (COUNT(mid));


   -- The count of all the actors who acted in only one movie.

SELECT COUNT(DISTINCT Ma.aid)
FROM MovieActor AS Ma
GROUP BY Ma.aid
HAVING COUNT(DISTINCT Ma.mid) = 1 ;






