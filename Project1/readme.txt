Jonathan Liau

cs143 Project

 +- Folder 105182103
     |
     +- readme.txt
     |
     +- team.txt
     |
     +- create.sql
     |
     +- load.sql
     |
     +- queries.sql
     |
     +- query.php
     |
     +- violate.sql

readme.txt: Readme File
team.txt: A plain-text file (no word or PDF, please) that contains the UID(s) of every member of your team. If you work alone, just write your UID (e.g. 904200000).
If you work with a partner, write both UIDs separated by a comma (e.g. 904200000, 904200001). Do not include any other content in this file!
create.sql: The MySQL script that you used to generate the tables with the appropriate constraints. Please make sure the created tables follow the schema exactly as we specified. Be extra careful with case sensitivity. For each constraint, write an English description of the constraint that you are enforcing as comments in the script. Make sure your script runs without any error when you execute the command mysql CS143 < create.sql.
load.sql: The MySQL script that loads all tuples into the tables. Please make sure that the data files are loaded from ~/data/ directory, so that your script is able to access the files during our grading. Otherwise, your script is likely to generate error and you may get as low as zero point for this part. Also make sure that the script inserts appropriate tuples to MaxPersonID and MaxMovieID tables.
queries.sql: The MySQL script that contains five SELECT statements to issue queires to the dataset together with their English description as comments. Each SELECT statement should end with a semicolon(;).
query.php: Your PHP code that allows users to issue a SELECT statement to the MySQL database. Please make sure the all URLs in your file are relative. Make sure that you connect to MySQL with the username "cs143" and empty password and use the database CS143. Make sure your PHP code does not depend on any other files (e.g., images, css file, other html files, etc). Otherwise, you may get as low as zero point due to errors during grading. Furthermore, the query.php is more like a question-answering interface, and therefore you should use HTTP GET protocol to process the user input as suggested by W3C.
violate.sql: The list of SQL modification statements (INSERT/DELETE/UPDATE) that violate each constraint. For each statement, write a short explanation on which constraint it violates and why. Also, after each explanation of the 9 primary and foreign key constraints, "cut-and-paste" the output that you get from MySQL when the statement is executed.