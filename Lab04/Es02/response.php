<!DOCTYPE html>
<html lang=it dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
      $a1=$_GET["codc"];

      $con = mysqli_connect('localhost','root','','palestra');


      $sql= "SELECT * FROM corsi WHERE CodC='$a1'";

      $result=mysqli_query($con,$sql);
      if( !$result )
        die('Query error: ' . mysqli_error($con));

      echo "<h1>Risultato della ricerca:</h1>";

      if(mysqli_num_rows($result)>0){
        echo "<table border=1 cellpadding=10>";
        echo "<tr>";
        for ($i = 0; $i < mysqli_num_fields($result); $i++){
          $title  =  mysqli_fetch_field($result);
          $name = $title->name;
          echo "<th> $name </th>";
        }
          echo "</tr>";

          while($row=mysqli_fetch_row($result)){
            echo "<tr>";
            foreach($row as $cell){
              echo "<td>$cell</td>";
            }
            echo "</tr>";
          }
        echo "</table>";
      }else{
        echo "<h4>nessuno risultato</h4>";
      }

      mysqli_close($con);
     ?>
  </body>
</html>
