<?php
include_once("fileSystem.php");
include_once("database.php");
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
		echo "Upload: " . $_FILES["inputfile"]["name"] . "<br />";
    	echo "Type: " . $_FILES["inputfile"]["type"] . "<br />";
    	echo "Size: " . ($_FILES["inputfile"]["size"] / 1024) . " Kb<br />";
   		echo "Temp file: " . $_FILES["inputfile"]["tmp_name"] . "<br />";
		echo "Stored in: " . $mail . $_FILES["inputfile"]["name"] . "<br />"; 
		echo "success! ". "<br />"; 
	}else{
		exit($message);	
	}
	//断开数据库
	closeConnection();
?>