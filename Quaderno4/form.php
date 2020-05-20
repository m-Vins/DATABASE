<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>Posizione Ciclista in Tappa</h1>

    <form action="response.php" method="get">
      <table>
        <tr>
          <td>Codice Ciclista</td>
          <td>
          <select name="CodC">
           <?php
           $con = mysqli_connect('localhost','root','','ciclismo');
           if (mysqli_connect_errno()){
             die ('Failed to connect to MySQL: ' . mysqli_connect_error());
           }


            $sql  = "SELECT CodC FROM ciclista";


           $result = mysqli_query($con,$sql);

           if( !$result )
             die('Query error: ' . mysqli_error($con));

             while ($row = mysqli_fetch_row($result)) {
               $codice = $row[0];
               echo"<option value=\"$codice\"> $codice </option>";
             }

             mysqli_close($con);
            ?>
          </select>
          </td>
          <tr>
            <td>Codice Tappa:</td><td><input type="text" name="CodT"></td>
          </tr>
      </table>
      <input type="submit" value="Cerca">
    </form>
  </body>
</html>
