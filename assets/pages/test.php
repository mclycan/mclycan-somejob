<?php

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

<form name="form1" method="post" action="test.php">
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
        <td>ID</th>
        <td>E-Mail</th>
        <td>Upload Time</th>
        <td>Filename</th>
        <td>Progress</th>
      </tr>
    </thead>
    <tbody>
 

      <tr>
        <td>11</td>
        <td>22</td>
        <td>33</td>
        <td>44</td>
        <td>
            <div class="progress progress-striped">
              <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" 
                  aria-valuemin="0" aria-valuemax="100" style="width: 30%;">
              </div>
            </div>
        </td>
        </tr>
        <tr>
        <td>111</td>
        <td>222</td>
        <td>333</td>
        <td>444</td>
        <td>
            <div class="progress progress-striped">
              <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 40.99%;">
              </div>
            </div>
        </td>
      </tr>

    </tbody>
  </table>
</div>
</body>
</html>

END;

?>
