<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>INSERIMENTO IN BASE DATI </title>

  </head>
  <body>
    <h1>Inserire dati Ciclista:</h1>

    <form action="response_ins.php" method="get" >


      <td>Codice Ciclista:</td><input type="text" name="CodC"><br>
      <td>Nome:</td><input type="text" name="Nome"><br>
      <td>Cognome:</td><input type="text" name="Cognome"><br>
      <td>Nazionalità:</td><input type="text" name="Nazionalita"><br>
      <td>Codice Squadra:</td>
      <td>
      <select name="CodS">

      <?php
        $con=mysqli_connect('localhost','root','','ciclismo');if (mysqli_connect_errno()){
          die ('Failed to connect to MySQL: ' . mysqli_connect_error());
        }

        $sql="SELECT DISTINCT CODS FROM SQUADRA";

        $result=mysqli_query($con,$sql);
        if( !$result )
          die('Query error: ' . mysqli_error($con));

        while ($row=mysqli_fetch_row($result)) {
          $cods=$row[0];
          echo"<option value =\"$cods\">$cods</option>";
        }

       ?>
      </select>
      </td>
      <br>
      <td>Anno di Nascita:</td><input type="text" name="AnnoNascita"><br>


      <input type="submit" value="Inserisci">
      <input type="reset" value="Reset">
    </form>

  </body>
</html>
