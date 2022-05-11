<!DOCTYPE html>
<html>
<head>
  <title>Company Staff </title>
</head>
<body>
<ul>
<?php
  $servername = "localhost";
  $username = "root";
  $password = "root";
  $dbname = "webdata";
  $connect = new mysqli($servername, $username, $password, $dbname);

  $sql = "SELECT * FROM staff";
  $result = $connect->query($sql);
?>







<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>

        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even) {
        background-color: #dddddd;
        }
        .title-header .title{
        background-color: #f1f1f1;
        }
        .title-header .title h3{
        padding: 20px 0px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 10px;
        text-align: center;
        }
        .table-container{
            width: 50%;
            margin: 0 auto;
            margin-top: 100px;
        }
    </style>
</head>
<body>

    <div class="table-container">
        <div class="title-header">
            <div class="title"><h3>LIMCO COMPANY</h3></div>
        </div>
        <table>
            <tr>
                <th>NAME</th>
                <th>JOBTITLE</th>
                <th>ACTION</th>
            </tr>
            <?php
              if($result->num_rows > 0):
                while($user = $result->fetch_assoc()):
              ?>
              <tr>
                  <td><?= $user["name"]?></td>
                  <td><?= $user["job_title"]?></td>
                  <td></td>
              </tr>
              <?php endwhile; ?>
            <?php endif; ?>
        </table>
    </div>

</body>
</html>



<?php
 $conn->close();
?>