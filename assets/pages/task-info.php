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
	
	<title> Info </title>

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
END;
	getConnection();

	$sqlstr = "select * from user order by userid";
	$query = mysql_query($sqlstr) or die(mysql_error());
	$result = array();
	while($thread=mysql_fetch_assoc($query)){
		$result[] = $thread;
	}

echo <<<END	
<div class="container">
		<div class="row">
			<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">	
				<br><br>	
				<h1 class="title">TASK INFO</h1>

<form name="form1" method="post" action="task-info.php">
<input type="submit" name="submit" class="btn btn-default btn-lg" value="REFRESH"/>
</form>

			</div> 
		</div>
END;

	if($result){
echo <<<END	
	<table class="table">
   			<thead>
      			<tr>
         			<th>ID</th>
         			<th>E-Mail</th>
         			<th>Upload Time</th>
         			<th>Filename</th>
      			</tr>
   			</thead>
   			<tbody>
      			<tr>
         			<td>$row['userid']</td>
         			<td>$row['mail']</td>
         			<td>$row['uploadtime']</td>
         			<td>$row['filename']</td>
      			</tr>
   			</tbody>
		</table>
END;
	}
	else{
echo <<<END
		<h1>Some Thing Wrong</h1>
END;
	}
	closeConnection();

echo <<<END
</div>
</body>
</html>
END; 

?>