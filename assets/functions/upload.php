<?php
#session_start ();
include_once("fileSystem.php");
include_once("database.php");
require("class.phpmailer.php");

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

		$string1 =  "Uploaded and Analysed Successfully". "<br />"; 
		$string2 =  "Filename: " . $_FILES["inputfile"]["name"] . "<br />";
		$string3 =  "Stored in Directory: " . $mail . "<br />"; 
    	$string4 =  "Type: " . $_FILES["inputfile"]["type"] . "<br />";
    	$string5 =  "Size: " . ($_FILES["inputfile"]["size"] / 1024) . " Kb<br />";

	}else{

echo <<<END
	<section class="section" id="head">
		<div class="container">

			<div class="row">
			 	<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">	

					<h2 class="subtitle">$message</h2>
	
			  	</div>  
			</div> 
	
		</div>
	</section>
	exit();	

END;

	}
	//断开数据库
	closeConnection();

	$time = "13";
	$string9 =  "Analyze Time" . $time . "S" . "<br />"; 

	$sendmail = new PHPMailer(); //建立邮件发送类
	$address ="mclycan@163.com";
	$sendmail->IsSMTP(); // 使用SMTP方式发送
	$sendmail->Host = "smtp.163.com"; // 您的企业邮局域名
	$sendmail->SMTPAuth = true; // 启用SMTP验证功能
	$sendmail->Username = "mclycan@163.com"; // 邮局用户名(请填写完整的email地址)
	$sendmail->Password = "w0shihc10"; // 邮局密码
	$sendmail->Port=25;
	$sendmail->From = "mclycan@163.com"; //邮件发送者email地址
	$sendmail->FromName = "mclycan";
	$sendmail->AddAddress("43596225@qq.com", "machao");//收件人地址，可以替换成任何想要接收邮件的email信箱,格式是AddAddress("收件人email","收件人姓名")

	$sendmail->Subject = "PHPMailer测试邮件"; //邮件标题
	$sendmail->Body = "Hello,这是测试邮件"; //邮件内容
	$sendmail->AltBody = "This is the body in plain text for non-HTML mail clients"; //附加信息，可以省略


echo <<<END

<section class="section" id="head">
	<div class="container">

		<div class="row">
			 <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">	

				<h2 class="subtitle">$string1</h2>
				<h3>$string2</h3>
				<h3>$string3</h3>
				<h3>$string4</h3>
				<h3>$string5</h3>
				<h3>$string9</h3>
END;
		if(!$sendmail->Send())
		{
			$string7 = "E-Mail error". "<br />";
			$string8 = "reason: " . $sendmail->ErrorInfo;
echo <<<END
			<h3>$string7</h3>
			<h3>$string8</h3>
END;
			exit;
		}

		$string6 =  "E-Mail Sended to Your Address". "<br />";

echo <<<END
			<h3>$string6</h3>
				<h4><a href="../pages/taskinfo.php" class="btn btn-default btn-lg">SEE MORE INFOMATION</a></h4>
	
			  </div>  
		</div> 
	
	</div>
</section>
</body>
</html>

END;

?>