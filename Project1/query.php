<!DOCTYPE html>
<html>
<head>
<title>Movie INFO Queries</title>
</head>
<body>
<h1>CS143 Project-1 DEMO </h1>
<strong>Jonathan Liau<br/> </strong>
<strong>105182103<br/> </strong>
<strong>CS 143 Winter 2020<br/> </strong>

<hr/>
<h4> Movie Information Tables </h4>
<ul>
<table  style="width:95%">
  
  <tr>
    <td><li>Movie(<u>id</u>, title, year, rating, company)</li></td>
  </tr>
  <tr>
    <td><li>Actor(<u>id</u>, last, first, sex, dob, dod)</li></td>
  </tr>
  <tr>
    <td><li>Sales(<u>mid</u>, ticketsSold, totalIncome)</li></td>
  </tr>
  <tr>
   <td><li>Director(<u>id</u>, last, first, dob, dod)</li></td>
  </tr>
  <tr>
   <td><li>MovieGenre(<u>mid</u>, genre)</li></td>
  </tr>
  <tr>
   <td><li>MovieDirector(<u>mid</u>, <u>did</u>)</li></td>
  </tr>
  <tr>
   <td><li>MovieActor(<u>mid</u>, <u>aid</u>, role)</li></td>
  </tr>
  <tr>
   <td><li>MovieRating(<u>mid</u>, imdb, rot)</li></td>
  </tr>
  <tr>
   <td><li>Review(name, time,<u> mid</u>, rating, comment)</li></td>
  </tr>
  <tr>
   <td><li>MaxPersonID(<u>id</u>)</li></td>
  </tr>
  <tr>
   <td><li>MaxMovieID(<u>id</u>)</li></td>
  </tr>
</table>
</ul>
<hr/>
<h3> Enter A <em>SELECT</em> Query Out of The Tables </h3>

<!-- <form method="GET" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
  <textarea name="query" rows="5" cols="50">
  </textarea>
  <br>
  <input type="submit" name="submit" value="Done">  
</form> -->

<form action="query.php" method="GET">
      <textarea name="query" cols="60" rows="8"><?php print "$query" ?></textarea><br />
      <input type="submit" value="Submit" />
   </form>
</body>

<?php


// make connection for mysql in php 

$db_connection = mysql_connect("localhost", "cs143", "");
$result = '';

function makeHeader($result, $fieldcount)
{
  for ($i=0; $i < $fieldcount; $i++)
    echo "<th>".mysql_fetch_field($result)->name."</th>";
  echo "<br></tr>";
}

if(!$db_connection) {
    $errmsg = mysql_error($db_connection);
    print "Connection failed: $errmsg <br>";
    exit(1);
}

// select data base 
if (!mysql_select_db("CS143", $db_connection)){
   echo mysql_errno($db_connection) . ": " . mysql_error($db_connection) . "\n";
   exit(1);
}

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $queries= $_GET['query'];
    if (empty($queries)) {
        echo "queries is empty";
    } else {
        //do the magic
        $result = mysql_query( mysql_real_escape_string($queries, $db_connection), $db_connection);
        mysql_close($db_connection);
        echo "<h3> Result From MySQL<br> </h3>";
        $fieldcount = mysql_num_fields($result);
        if($fieldcount > 0)
          echo "Field in Table: ".$fieldcount."<br>";
        else
          echo "Field in Table:  No Result Found<br>";

        $rowcount = mysql_num_rows($result);
        if($rowcount > 0 )
          echo "Total Row   : ".$rowcount."<br>";
        else
          echo "Total Row   :  No Result Found <br>";


        if ($rowcount > 0) {

            echo "<table border=1 cellspacing=2 cellpadding=2><tr>";
            makeHeader($result, $fieldcount);

            while ($row = mysql_fetch_row($result)) 
            {
                echo "<tr>";

                for ( $i=0 ; $i < $fieldcount; $i++ ) 
                {
                  if (!is_null($row[$i]))
                    echo "<td>".$row[$i]."</td>";
                  else
                    echo "<td>NULL</td>";      
                } // end for 
                echo "</tr>";
            }// end while
            echo "</table>";
          }
        mysql_free_result($result);
    }
}


?>

</html>