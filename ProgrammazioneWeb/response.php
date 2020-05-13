<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Risultati</title>
  </head>
  <body>
    <?php
    $a1=$_GET["anno1"];
    $a2=$_GET["anno2"];
    $c=$_GET["citta"];

    $con = mysqli_connect('localhost','root','','opere');


    $sql  = "SELECT autore.cognome AS autore, opera.nome AS opera, categoria
    FROM autore, opera
    WHERE autore.coda = opera.autore
    AND anno >= $a1 AND anno <= $a2 AND opera.citta =  '$c'
    ORDER BY cognome, opera";

    $result = mysqli_query($con,$sql);

    echo "<h1> Opere a $c degli autori nati tra il $a1 e il $a2 </h1>";

    if( mysqli_num_rows($result) > 0 ){
      echo "<table border=1 cellpadding=10>";
      echo "<tr>";
      for ($i = 0; $i < mysqli_num_fields($result); $i++){
        $title  =  mysqli_fetch_field($result);
        $name = $title->name;
        echo "<th> $name </th>";
      }
      echo "</tr>";

      while ($row = mysqli_fetch_row($result)) {
        $id = $row[2];

        echo "<tr id=$id>";
        foreach ($row as $cell) {
            echo "<td>$cell</td>";
        }
        echo "</tr>";
      }
      echo "</table>";
    }else{
      echo "<h4> Nessun risultato</h4>";
    }
     ?>

  </body>
</html>
