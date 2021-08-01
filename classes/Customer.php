<?php
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath."/../lib/Database.php");
	include_once ($filepath."/../helpers/Format.php");
?>
<?php

	class Customer{
	
		private $db;
		private $fm;
	
		public function __construct(){
			$this->db = new Database();
			$this->fm = new Format();
		}
		public function customerRegistration($data){
			$name 			= mysqli_real_escape_string($this->db->link,$data['name']);
			$address 		= mysqli_real_escape_string($this->db->link,$data['address']);
			$city 			= mysqli_real_escape_string($this->db->link,$data['city']);
			$country 		= mysqli_real_escape_string($this->db->link,$data['country']);
			$pcode 			= mysqli_real_escape_string($this->db->link,$data['pcode']);
			$phone 			= mysqli_real_escape_string($this->db->link,$data['phone']);
			$mobile 		= mysqli_real_escape_string($this->db->link,$data['mobile']);
			$password 		= md5($data['password']);


			 if($name == "" || $address == "" || $city == "" || $country == "" || $pcode == "" || $phone == "" || $mobile == "" || $password == ""){
			    	$msg = "<span class ='error'>Field Must Not be Empty !</span>";
						return $msg;

			    }
			    $mailquery 	= "SELECT* FROM tbl_customer WHERE mobile = '$mobile' LIMIT 1";
			    $mailchk 	= $this->db->select($mailquery);
			    if($mailchk != false){
			    	$msg = "<span class = 'error'>Mobile Number Already Exist !</span>";
			    	return $msg;
			    }else{
			    	$query = "INSERT INTO tbl_customer(name, address, city, country, pcode, phone, mobile,password) VALUES('$name', '$address', '$city', '$country', '$pcode', '$phone', '$mobile', '$password')";

								    $productInsert = $this->db->insert($query);
									if($productInsert){
										$msg = "<span class  = 'success'>Customer Added Successfully !</span>";
										return $msg;
									}else{
										$msg = "<span class  = 'error'>Customer Not Added !</span>";
										return $msg;
					}
			    }
		}
		public function customerLogin($data){

			$mobile 	= mysqli_real_escape_string($this->db->link,$data['mobile']);
			$password 	= mysqli_real_escape_string($this->db->link,md5($data['password']));
			if(empty($mobile) || empty($password) ){
				$msg = "<span class = 'error'>Field Must Not Be Empty !</span>";
				return $msg;
			}
			$query = "SELECT* FROM tbl_customer WHERE mobile = '$mobile' AND password = '$password' ";
			$result= $this->db->select($query);
			if($result !=false){
				$value = $result->fetch_assoc();
				Session::set("cuslogin",true);
				Session::set("cmrId",$value['id']);
				Session::set("cmrName",$value['name']);
				header("Location:cart.php");

			}else{
				$msg = "<span class = 'error'>Mobile Number or Password not matched !</span>";
				return $msg;
			}
		}
		public function getCustomerData($id){
			$query = "SELECT * FROM tbl_customer WHERE id = '$id' ";
			$result =$this->db->select($query);
			return $result;
		}
		public function customerUpdate($data,$cmrId){

			$name 			= mysqli_real_escape_string($this->db->link,$data['name']);
			$address 		= mysqli_real_escape_string($this->db->link,$data['address']);
			$city 			= mysqli_real_escape_string($this->db->link,$data['city']);
			$country 		= mysqli_real_escape_string($this->db->link,$data['country']);
			$pcode 			= mysqli_real_escape_string($this->db->link,$data['pcode']);
		
			 if($name == "" || $address == "" || $city == "" || $country == "" || $pcode == "" ){
			    	$msg = "<span class ='error'>Field Must Not be Empty !</span>";
						return $msg;

			    }else{
			    	$query = "UPDATE tbl_customer
						SET
						name 	= '$name',
						address = '$address',
						city 	= '$city',
						country = '$country',
						pcode 	= '$pcode'
						WHERE 
						id = '$cmrId' ";
						$updated_row = $this->db->update($query);
						if($updated_row){
							$msg = "<span class  = 'success'>Your Profile Updated Successfully !</span>";
							return $msg;
						}else{
							$msg = "<span class  = 'error'>Your Profile Not Updated !</span>";
							return $msg;
						}
			    }
		}
	}
