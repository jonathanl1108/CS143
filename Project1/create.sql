CREATE TABLE Movie (
-- id can't be empty 
id      INT NOT NULL,
-- title of the movie
title   VARCHAR(100) NOT NULL,
-- year move is out 
year    INT NOT NULL,
-- rating of the movie
rating  VARCHAR(10),
-- comapany of the production 
company VARCHAR(50),
-- id must be unique 
PRIMARY KEY (id)

)ENGINE = INNODB;


CREATE TABLE Actor (
--  actor id that need to be unqie
id    INT NOT NULL,
-- last name and first name of the actor
last  VARCHAR(20) NOT NULL,
first VARCHAR(20) NOT NULL,
-- sex of the actor
sex   VARCHAR(6) NOT NULL,
-- day of brith or the day pass away
dob   DATE NOT NULL,
dod   DATE,
PRIMARY KEY (id),
-- day pass away cant be early than birthday 
CHECK(dob < dod or dod IS NULL)
)ENGINE = INNODB;




CREATE TABLE Sales
(
  -- mid movie id 
 mid         INT NOT NULL,
 -- ticket sold and the income 
 ticketsSold INT NOT NULL,
 totalIncome INT NOT NULL,
 -- refrence the movie id from Movie 
 FOREIGN KEY (mid) 
 REFERENCES  Movie(id)
)ENGINE = INNODB;


CREATE TABLE Director
(
  -- id of director that need to be unique
  id   INT NOT NULL,
  -- last and first naem of the director
  last VARCHAR(20) NOT NULL,
  first VARCHAR(20) NOT NULL,
  -- day of brith or the day pass away
  dob  DATE        NOT NULL,
  dod  DATE,
  PRIMARY KEY (id),
  -- day pass away cant be early than birthday 
  CHECK(dob < dod or dod IS NULL)

)ENGINE = INNODB;


CREATE TABLE MovieGenre
(
  mid   INT,
  -- a movie can have multiple genre 
  genre VARCHAR(20) NOT NULL,
  PRIMARY KEY (mid),
  -- refrence the movie id from Movie 
  -- a movie can have multiple genre so not unique
  FOREIGN KEY (mid) 
  REFERENCES  Movie(id)
)ENGINE = INNODB;


CREATE TABLE MovieDirector
(
  -- mid movie id 
  mid   INT NOT NULL,
  -- director id of the movie 
  did   INT NOT NULL,
  -- mid and did refrencing other tables Movie and Director 
  PRIMARY KEY (mid, did),
  FOREIGN KEY (mid) 
  REFERENCES  Movie(id),
  FOREIGN KEY (did) 
  REFERENCES  Director(id)
)ENGINE = INNODB;


CREATE TABLE MovieActor
(
  -- mid movie id 
  mid   INT NOT NULL,
  -- actor id of the movie 
  aid   INT NOT NULL,
  role  VARCHAR(50) NOT NULL,
  -- mid and aid refrencing other tables Movie and Director 
  PRIMARY KEY (mid, aid),
  FOREIGN KEY (mid) 
  REFERENCES  Movie(id),
  FOREIGN KEY (aid) 
  REFERENCES  Actor(id)
)ENGINE = INNODB;


CREATE TABLE MovieRating
(
  -- mid movie id 
  mid   INT NOT NULL,
  -- imdb and rot can be empty 
  imdb  INT,
  rot   INT,
  PRIMARY KEY (mid),
  FOREIGN KEY (mid) 
  REFERENCES  Movie(id),
  -- check if the input is valid 
  CHECK((imdb <= 100 AND imdb >=0) OR imdb IS NULL ),
  CHECK((rot  <= 100 AND imdb >= 0) OR rot IS NULL )
)ENGINE = INNODB;

CREATE TABLE Review
(
  -- name of 
  name VARCHAR(20) NOT NULL,
  -- comment tiem
  time TIMESTAMP,
  mid   INT NOT NULL,
  -- the rating of the movie
  rating  INT,
  comment VARCHAR(500),
  PRIMARY KEY (mid),
  FOREIGN KEY (mid) 
  REFERENCES  Movie(id),
  -- must have check reating IS NULL itherwise it could crash if rating is null
  CHECK((rating <= 5 AND rating >= 0)OR rating IS NULL)
)ENGINE = INNODB;

CREATE TABLE MaxPersonID
(
  -- inout of max person id assigned 
   id INT NOT NULL
)ENGINE = INNODB;

CREATE TABLE MaxMovieID
(
   -- inout of max movie id person id assigned 
   id INT NOT NULL
)ENGINE = INNODB;  



