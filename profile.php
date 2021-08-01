<?php include "inc/header.php";?>
<?php
    $login = Session::get("cuslogin");
    if($login == false){
        header("Location:login.php");
    }
?>
<style>
	.tblone{width :550px; margin:0 auto; border:2px solid #ddd;}
	.tblone tr td{text-align: justify;}

</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
    		<?php
    			$id = Session::get("cmrId");
    			$getData = $cmr->getCustomerData($id);
    			if($getData){
    				while($result = $getData->fetch_assoc()){

    		?>
		<table class="tblone">
			<tr>
				<td width ="20%">Customer Id</td>
				<td width ="5%">:</td>
				<td><?php echo $result['id'];?></td>
			</tr>
			<tr>
				<td width ="20%">Name</td>
				<td width ="5%">:</td>
				<td><?php echo $result['name'];?></td>
			</tr>

			<tr>
				<td>Mobile</td>
				<td>:</td>
				<td><?php echo $result['mobile'];?></td>
			</tr>

			<tr>
				<td>Address</td>
				<td>:</td>
				<td><?php echo $result['address'];?></td>
			</tr>

			<tr>
				<td>City</td>
				<td>:</td>
				<td><?php echo $result['city'];?></td>
			</tr>
				<tr>
				<td>Post Code</td>
				<td>:</td>
				<td><?php echo $result['pcode'];?></td>
			</tr>

			<tr>
				<td>Country</td>
				<td>:</td>
				<td><?php echo $result['country'];?></td>
			</tr>

			<tr>
				<td></td>
				<td></td>
				<td><a href = "editprofile.php">Update Profile</a></td>
			</tr>

		</table>
	<?php } } ?>
 		</div>
 	</div>
	</div>
<?php include "inc/footer.php";?>