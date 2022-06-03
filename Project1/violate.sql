-- primary  constrians 

-- The id input is a primary key, and an error will occured when
-- inserting a movie id entry that is alreay being added  
INSERT INTO Movie VALUES(1, 'newmovie1', 1997,'fake', 'phony');
--ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- The id input is a primary key in Actor, and an error will occured when
-- inserting a actor id entry that is alreay being added 
INSERT INTO Actor VALUES(1, 'fake', 'master', 'F', '11-08-1997', NULL);*/
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- The id input is a primary key in Director, and an error will occured when
-- inserting a director id entry that is alreay being inputed 
INSERT INTO Director VALUES(1, 'fake', 'master', '11-08-1997', NULL);
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- The mid input is a primary key in MovieGenre, and an error will occured when
-- inserting a movie id entry that is alreay being inputed 
INSERT INTO MovieGenre VALUES (1, 'duplicate');
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- The mid and did input are the primary keys in MovieDirector, an error will occured when
-- inserting a mid and did entry that is alreay being inputed 
INSERT INTO MovieDirector VALUES (111,222 );
-- ERROR 1062 (23000): Duplicate entry '111-222' for key 'PRIMARY'

-- The mid and aid input are primary keys in MovieActor, and an error will occured when
-- inserting a mid and aid entry that is alreay being inputed 
INSERT INTO MovieActor VALUES (1,2,'Rose' );
-- ERROR 1062 (23000): Duplicate entry '1-2' for key 'PRIMARY'

-- The mid input is a primary key in MovieRating, and an error will occured when
-- inserting a movie id entry that is alreay being inputed 
INSERT INTO MovieRating VALUES (1, 101, 6);
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- foreign key test

-- The mid and aid input are the foreign keys in MovieActor refrence from Movie and Actor, and an error will occured when
-- inserting a mid and aid entry that does not exsit in Movie and Actor 
INSERT INTO MovieActor VALUES (111,222,'Rose' );
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))

-- The mid input is the foreign keys in Sales refrence from Movie, and an error will occured when
-- inserting a mid entry that does not exsit in Movie
INSERT INTO Sales VALUES ((SELECT MAX(id) +1 FROM Movie), 0, 0);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- The mid input is the foreign keys in MovieGenre refrence from Movie, and an error will occured when
-- inserting a mid entry that does not exsit in Movie
INSERT INTO MovieGenre VALUES ((SELECT MAX(id) +1 FROM Movie), 'bad');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- The mid and did input are the foreign keys in Values refrence from Movie and Director, and an error will occured when
-- inserting a mid and did entry that does not exsit in Movie and Director
INSERT INTO MovieDirector VALUES ((SELECT MAX(id) +1 FROM Movie),(SELECT MAX(id) +1 FROM Director) );
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- The mid input is the foreign keys in Review refrence from Movie, and an error will occured when
-- inserting a mid entry that does not exsit in Movie
INSERT INTO Review Values ('name', 2007, (SELECT MAX(id) +1 FROM Movie), 10, 'Worst ever');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- check 
-- Inerting a death date earlier than the birthdate should be prevented by the check 
INSERT INTO Director VALUES(3, 'future', 'Mr', '1997-11-08', '1996-11-07');

-- Inerting a rating out of the rnage of 0`-100 should be prevented by the check 
INSERT INTO MovieRating  VALUES (1, 101, 101);

-- Updating a rot rating out of the rnage of 0`-5 should be prevented by the check 
UPDATE MovieRating SET rot=6 WHERE mid=3;



