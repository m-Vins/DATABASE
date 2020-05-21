<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>INSERIMENTO IN BASE DATI </title>

  </head>
  <body>

    <form action="response_class.php" method="get" >

      <h1>Inserire dati Classifica Individuale</h1>
      <td>Codice Ciclista:</td>
      <td>
        <select name="CodC">
            <?php
            $con=mysqli_connect('localhost','root','','ciclismo');
            if (mysqli_connect_errno()){
              die ('Failed to connect to MySQL: ' . mysqli_connect_error());
            }

            $sql="SELECT DISTINCT CodC FROM ciclista";

            $result=mysqli_query($con,$sql);
            if( !$result )
              die('Query error: ' . mysqli_error($con));

            while ($row=mysqli_fetch_row($result)) {
              $Codc=$row[0];
              echo"<option value=\"$Codc\"> $Codc </option>";
            }
            mysqli_close($con);


             ?>
        </select>
      </td>
      <br>
      <td>Codice Tappa:</td>
      <td>
      <select name="CodT">
      <?php
        $con=mysqli_connect('localhost','root','','ciclismo');
        if (mysqli_connect_errno()){
          die ('Failed to connect to MySQL: ' . mysqli_connect_error());
        }

        $sql="SELECT DISTINCT CodT FROM TAPPA";

        $result=mysqli_query($con,$sql);
        if( !$result )
          die('Query error: ' . mysqli_error($con));

        while ($row=mysqli_fetch_row($result)) {
          $CodT=$row[0];
          echo"<option value=\"$CodT\"> $CodT </option>";
        }
        mysqli_close($con);

       ?>
       </select>
     </td>
     <br>

    <td>Edizione:</td>
    <td>
      <select name="Edizione">

    <?php
    $con=mysqli_connect('localhost','root','','ciclismo');
    if (mysqli_connect_errno()){
      die ('Failed to connect to MySQL: ' . mysqli_connect_error());
    }

    $sql="SELECT Edizione FROM TAPPA";

    $result=mysqli_query($con,$sql);
    if( !$result )
      die('Query error: ' . mysqli_error($con));

    while ($row=mysqli_fetch_row($result)) {
      $Edizione=$row[0];
      echo"<option value=\"$Edizione\"> $Edizione </option>";
    }
    mysqli_close($con);
     ?>
     </select>
     </td>
     <br>

    <td>Posizone:</td><input type="text" name="Posizione">
     <br>

      <input type="submit" value="Inserisci">
      <input type="reset" value="Reset">
    </form>

  </body>
</html>
