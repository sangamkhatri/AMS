<?php
	require_once 'db_connect.php';
	extract($_POST);
		$data = array();
		if(empty($id)){
			$chk = $conn->query("SELECT * FROM `employee` WHERE `employee_no` = '$employee_no'")->num_rows;
			if($chk > 0){
				$data ['status'] = 2;
				$data['msg'] = 'This employeeid already exist';
			}else{
				$save=$conn->query("INSERT INTO employee (employee_no,firstname,middlename,lastname,department,position) values ('$employee_no','$firstname','$middlename','$lastname','$department','$position')");
				if($save){
					$data ['status'] =1;
					$data['msg'] = 'Data successfully saved.';
				}
			}
		}else{
			$chk = $conn->query("SELECT * FROM `users` WHERE  `employee_no` = '$employee_no' and id != '$id' ");
			if($chk->num_rows > 0){
				$data ['status'] = 2;
				$data['msg'] = 'This employeeid already exist';
			}else{
				$save=$conn->query("UPDATE users set username = '$username',password = '$password',firstname = '$firstname',lastname = '$lastname' where id = $id ");
				if($save){
					$data ['status'] =1;
					$data['msg'] = 'Data successfully updated.';
				}
			}
		}

		echo json_encode($data);
	$conn->close()	;