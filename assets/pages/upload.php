<?php
include_once("../functions/fileSystem.php");
include_once("../functions/database.php");
	if (empty($_POST)){
		exit("error 1");
	}

	// 连接数据库  
	getConnection();
	
	//采集信息
	$filename = $_POST['inputfile'];
	$mail = $_POST['usermail'];
	$time=date("Y-m-d h:i:s");
	//插入数据进入数据库的查询语句
	$sqlstr = "insert into user(mail, uploadtime, filename) values('$mail','$time','$filename')";

	$message = upload($_FILES['inputfile'],"$filename");
	if($message=="文件上传成功"){
		mysql_query($sqlstr) or die(mysql_error());
	}else{
		exit($message);	
	}
	//断开数据库
	closeConnection();
?>