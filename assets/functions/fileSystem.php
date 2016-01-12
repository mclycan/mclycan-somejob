<?php
	function upload($file,$filePath){
		$error = $file['error'];
		switch ($error){
			case 0:
				$filename = $file['name'];
				$fileTemp = $file['tmp_name'];
				$destination = $filePath."/".$filename;
				system("cd ../files/");
				$newdir = mkdir($filePath);

				if($newdir){
					system("chmod 777 $filePath");
					move_uploaded_file($fileTemp,$destination);
					return "upload_success";
				}
				
				return "upload_not_success";
			case 1:
				return "php.ini_upload_max_filesize";
			case 2:
				return "form_MAX_FILE_SIZE";
			case 3:
				return "part_upload";
			case 4:
				return "no_file";
				}
		}

?> 