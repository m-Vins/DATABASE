<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
      if(!isset($_GET["CodC"]) or !isset($_GET["Nome"]) or !isset($_GET["Cognome"]) or
      !isset($_GET["Nazionalita"]) or !isset($_GET["AnnoNascita"]) or !isset($_GET["CodS"]))
      {
        die("ERRORE DATI MANCANTI");
      }


      if(!is_numeric($_GET["AnnoNascita"])){
        die("ERRORE ANNO DI NASCITA");
      }




      $codc=$_GET["CodC"];
      $nome=$_GET["Nome"];
      $cognome=$_GET["Cognome"];
      $nazionalita=$_GET["Nazionalita"];
      $anno=$_GET["AnnoNascita"];
      $cods=$_GET["CodS"];


      $con=mysqli_connect('localhost','root','','ciclismo');
      if (mysqli_connect_errno()){
        die ('Failed to connect to MySQL: ' . mysqli_connect_error());
      }

      /*controllo che esista la squadra selezionata*/
      $sql="SELECT * FROM SQUADRA WHERE CODS='$cods'";
      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }
      if(!mysqli_fetch_row($result)){
        die("ERRORE CODICE SQUADRA");
      }


      /*controllo che non ci siano ciclisti con lo stesso codice*/
      $sql="SELECT * FROM CICLISTA WHERE CODC='$codc'";
      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }

      if(mysqli_fetch_row($result)){
        die("ERRORE CODICE CICLISTA");
      }


      $sql="INSERT INTO Ciclista VALUES ('$codc','$nome','$cognome','$nazionalita','$cods',$anno)";

      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }else{
        echo"<h1>Inserimento ciclista avvenuto correttamente</h1>";
      }

      mysqli_close($con);
      ?>
  </body>
</html>
