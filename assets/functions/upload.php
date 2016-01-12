<?php
session_start ();
include_once("fileSystem.php");
include_once("database.php");

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
END;

	if (empty($_POST)){
		exit("error 1");
	}

	// 连接数据库  
	getConnection();
	
	//采集信息
	$filename = $_FILES["inputfile"]["name"];
	$mail = $_POST['usermail'];
	$time=date("Y-m-d H:i:s");
	//插入数据进入数据库的查询语句
	$sqlstr = "insert into user(mail, uploadtime, filename) values('$mail','$time','$filename')";

	$message = upload($_FILES['inputfile'],$mail);
	if($message=="upload_success"){
		mysql_query($sqlstr) or die(mysql_error());

		$string1 =  "Uploaded Successfully". "<br />"; 
		$string2 =  "Filename: " . $_FILES["inputfile"]["name"] . "<br />";
		$string3 =  "Stored in: " . $mail . "<br />"; 
    	$string4 =  "Type: " . $_FILES["inputfile"]["type"] . "<br />";
    	$string5 =  "Size: " . ($_FILES["inputfile"]["size"] / 1024) . " Kb<br />";
		

	}else{
		exit($message);	
	}
	//断开数据库
	closeConnection();



echo <<<END

<section class="section" id="head">
	<div class="container">

		<div class="row">
			<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">	

				<h2 class="subtitle">$string1</h2>
				<h3 class="tagline">$string2</h3>
				<h3 class="tagline">$string3</h3>
				<h3 class="tagline">$string4</h3>
				<h3 class="tagline">$string5</h3>
				
				<h4><a href="../pages/task-info.html" class="btn btn-default btn-lg">SEE MORE INFOMATION</a></h4>
	
			</div> 
		</div> 
	
	</div>
</section>
</body>
</html>

END;

?>