<!DOCTYPE html>
<html lang=it dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
      $a1=$_GET["nome"];
      $a2=$_GET["cognome"];

      $con = mysqli_connect('localhost','root','','palestra');


      $sql= "SELECT CodFisc FROM istruttore WHERE nome='$a1'
              AND cognome='$a2'";

      $result=mysqli_query($con,$sql);
      if( !$result )
        die('Query error: ' . mysqli_error($con));

      if(mysqli_num_rows($result) > 0 ){
        echo "<h1>$a1 $a2 è un istruttore!</h1>";
      }else{
        echo "<h1>$a1 $a2 non è un istruttore!</h1>";
      }
     ?>
  </body>
</html>
