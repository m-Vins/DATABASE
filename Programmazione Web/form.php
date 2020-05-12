<!DOCTYPE html>
<html lang="it" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>impostare anno di nascita autore e città</h1>

    <form action="response.php" method="get">
    <p>data di nascita compresa tra:</p>
    <table>
      <tr>
        <td>anno</td> <td><input type="text" name="anno1"></td>
        <td>e anno</td> <td> <input type="text" name="anno2"></td>
      </tr>
      <tr>
        <td>città</td>
      <td>
      <select name="citta">
        <?php
        $con = mysqli_connect('localhost','root','','opere');

         $sql  = "SELECT DISTINCT citta
         FROM opera";

        $result = mysqli_query($con,$sql);


          while ($row = mysqli_fetch_row($result)) {
            $citta = $row[0];
            echo"<option value=\"$citta\"> $citta </option>";
          }

         ?>
      </select>
      </td>
    </tr>
    </table>

    <input type="submit" value="Esegui">
    <input type="reset"  value="Cancella">
  </form>
  </body>
</html>
