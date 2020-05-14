<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>Ricerca corso</h1>
    <form action="response.php" method="get">
      <select name="codc">
        <?php
        $con = mysqli_connect('localhost','root','','palestra');
        if (mysqli_connect_errno()){
          die ('Failed to connect to MySQL: ' . mysqli_connect_error());
        }

        $sql="SELECT DISTINCT CodC FROM corsi";

        $result=mysqli_query($con,$sql);
        if( !$result )
  		    die('Query error: ' . mysqli_error($con));

          while ($row = mysqli_fetch_row($result)) {
  		      $codc = $row[0];
  		      echo"<option value=\"$codc\"> $codc </option>";
  	      }
         ?>
      <input type="submit" value="Esegui">
    </form>
  </body>
</html>
