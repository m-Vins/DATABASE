<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php
      if(!isset($_GET["CodC"]) or
      !isset($_GET["CodT"]) or !isset($_GET["Edizione"])
      or !isset($_GET["Posizione"]))
      {
        die("ERRORE DATI MANCANTI");
      }

      $flag=0;
      if(!is_numeric($_GET["CodT"])){
        echo"<p>ERRORE CodT</p>";
        $flag=1;
      }
      if(!is_numeric($_GET["Posizione"])){
        echo"<p>ERRORE POSIZIONE</p>";
        $flag=1;
      }
      if(!is_numeric($_GET["Edizione"])){
        echo"<p>ERRORE EDIZIONE</p>";
        $flag=1;
      }

      if($flag==1){
        die;
      }



      $codc=$_GET["CodC"];
      $codt=$_GET["CodT"];
      $edizione=$_GET["Edizione"];
      $pos=$_GET["Posizione"];


      $con=mysqli_connect('localhost','root','','ciclismo');
      if (mysqli_connect_errno()){
        die ('Failed to connect to MySQL: ' . mysqli_connect_error());
      }

      /*verifico che esista quell'edizione di quella tappa*/
      $sql="SELECT * FROM TAPPA WHERE CodT=$codt AND Edizione=$edizione";
      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }
      if(!mysqli_fetch_row($result)){
        die("ERRORE EDIZIONE TAPPA");
      }



      /*verifico che non esiste già una posizione di quel ciclista in quella tappa*/
      $sql="SELECT * FROM CLASSIFICA_INDIVIDUALE WHERE CodC='$codc' and CodT=$codt
      AND Edizione=$edizione";
      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }
      if(mysqli_fetch_row($result)){
        die("ERRORE EDIZIONE TAPPA");
      }



      $sql="INSERT INTO CLASSIFICA_INDIVIDUALE VALUES ('$codc',$codt,$edizione,$pos)";

      $result=mysqli_query($con,$sql);
      if( !$result ){
        die('Query error: ' . mysqli_error($con));
      }else{
        echo"<h1>Inserimento posizione in tappa avvenuto correttamente</h1>";
      }


      ?>
  </body>
</html>
