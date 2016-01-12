<?php
include_once("../functions/fileSystem.php");
include_once("../functions/database.php");
	if (empty($_POST)){
		exit("error 1");
	}

	// 连接数据库  
	getConnection();
	
	//采集信息
	$filename = $_POST['inputfile']['name'];
	$mail = $_POST['usermail'];
	$time=date("Y-m-d h:i:s");
	//插入数据进入数据库的查询语句
	$sqlstr = "insert into user(mail, uploadtime, filename) values('$mail','$time','$filename')";

	$message = upload($_FILES['inputfile'],$mail);
	if($message=="文件上传成功"){
		mysql_query($sqlstr) or die(mysql_error());
		echo "Upload: " . $_FILES["myPicture"]["name"] . "<br />";
    	echo "Type: " . $_FILES["myPicture"]["type"] . "<br />";
    	echo "Size: " . ($_FILES["myPicture"]["size"] / 1024) . " Kb<br />";
   		echo "Temp file: " . $_FILES["myPicture"]["tmp_name"] . "<br />";
		echo "Stored in: " . "uploads/" . $_FILES["myPicture"]["name"] . "<br />"; 
		echo "success! ". "<br />"; 
	}else{
		exit($message);	
	}
	//断开数据库
	closeConnection();
?>