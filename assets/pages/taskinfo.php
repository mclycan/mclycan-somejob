<?php
include_once("../functions/database.php");

echo <<<END

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport"    content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author"      content="Mclycan">
  
  <title> Congratulation </title>

  <link rel="shortcut icon" href="../images/111.png">
  
  <!-- Bootstrap itself -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles -->
  <link rel="stylesheet" href="../css/magister.css">

  <!-- Fonts -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
</head>

  <body class="text-shadows">
  <div class="container">
    <div class="row">
      <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center"> 
        <br><br>  
        <h1 class="title">TASK INFO</h1>

<form name="form1" method="post" action="takinfo.php">
<input type="submit" name="submit" class="btn btn-default btn-lg" value="REFRESH"/>
</form>

      </div> 
    </div>
 </div>  
 <div class="col-md-1"> </div> 
   <div class="col-md-10">
   <table class="table">
    <thead>
      <tr>
        <th>User</th>
        <th>Upload-Time</th>
        <th>Start-Time</th>
        <th>Finish-Time</th>
        <th>Schedule</th>
      </tr>
    </thead>
    <tbody>
 
END;

  getConnection();

  $sqlstr1 = "select user.mail, user.uploadtime, task.createtime, task.finishtime from user ,task where user.userid = task.userid ORDER BY user.userid" ;
  $result1 = queryMysql($sqlstr1);


  $num = mysql_num_rows($result1);

  for ($j = 0 ; $j < $num ; ++$j)
  {
    $k = $j + 1;
    $row = mysql_fetch_row($result1);

    $sqlstr2 = "select count(*) from subtask where subtask.taskid = $k" ;
    $result2 = queryMysql($sqlstr2);
    $row2 = mysql_fetch_row($result2);

    $sqlstr3 = "select count(*) from subtask where subtask.taskid = $k and status = 2" ;
    $result3 = queryMysql($sqlstr3);
    $row3 = mysql_fetch_row($result3);

    $rate = round(($row3[0]/$row2[0])*100).'%';

echo <<<END

      <tr>
        <td>$row[0]</td>
        <td>$row[1]</td>
        <td>$row[2]</td>
        <td>$row[3]</td>
        <td>
            <div class="progress progress-striped">
              <div class="progress-bar progress-bar-warning" role="progressbar" 
                  aria-valuemin="0" aria-valuemax="100" style="width: $rate;">
              </div>
            </div>
        </td>
      </tr>
END;
    
  }

echo <<<END
    </tbody>
  </table>
 </div>
</body>
</html>

END;
  closeConnection();
?>
