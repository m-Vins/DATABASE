<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
    if(!isset($_GET["CodC"]) or !isset($_GET["CodT"])){
      die("ERRORE DATI MANCANTI");
    }

    if( !is_numeric($_GET["CodC"]) or !is_numeric($_GET["CodT"])){
      die("ERRORE DATI NON NUMERICI");
    }

    $a1=$_GET["CodC"];
    $a2=$_GET["CodT"];

    $con=mysqli_connect('localhost','root','','ciclismo');
    if(mysqli_connect_errno()){
      die('ERRORE CONNESSIONE' . mysqli_connect_error());
    }

    $sql="SELECT C.Nome, C.Cognome, S.NomeS
    FROM CICLISTA C, SQUADRA S
    WHERE C.CodC='$a1' AND S.CodS=C.CodS";

    $result=mysqli_query($con,$sql);
    if(!$result){
      die('QUERY ERROR' . mysqli_error($con));
    }

    if(mysqli_num_rows($result)>0){
      echo"<h1>Dati ciclista:</h1>";
      $row=mysqli_fetch_row($result);
      for($i=0;$i<mysqli_num_fields($result);$i++){
        $title=mysqli_fetch_field($result);
        $name=$title->name;
        $data=$row[$i];
        echo "<h3> $name: $data";
      }
    }

    $sql="SELECT *
    FROM TAPPA
    WHERE CodT='$a2'";

    $result=mysqli_query($con,$sql);
    if(!$result){
      die('QUERY ERROR' . mysqli_error($con));
    }

    if(mysqli_num_rows($result)>0){
      echo"<h1>Dati Tappa:</h1>";
      $row=mysqli_fetch_row($result);
      for($i=0;$i<mysqli_num_fields($result);$i++){
        $title=mysqli_fetch_field($result);
        $name=$title->name;
        $data=$row[$i];
        echo "<h3> $name: $data";
      }
    }

    echo"<h2>Risultati:</h2>";

    $sql="SELECT Edizione, Posizione
    FROM CLASSIFICA_INDIVIDUALE
    WHERE CodC='$a1' AND CodT='$a2'
    ORDER BY Edizione";

    $result=mysqli_query($con,$sql);
    if(!$result){
      die('QUERY ERROR' . mysqli_error($con));
    }

    if(mysqli_num_rows($result)>0){
      echo "<table border=1 cellpadding=10>";
      echo "<tr>";

      for ($i = 0; $i < mysqli_num_fields($result); $i++){
        $title  =  mysqli_fetch_field($result);
        $name = $title->name;
        echo "<th> $name </th>";
      }
      echo "</tr>";

      while ($row = mysqli_fetch_row($result)) {

        echo "<tr>";
        foreach ($row as $cell) {
            echo "<td>$cell</td>";
        }
        echo "</tr>";
      }
      echo "</table>";
    }else{
      echo "<h4> Nessun risultato</h4>";
    }


    mysqli_close($con);
     ?>
  </body>
</html>
