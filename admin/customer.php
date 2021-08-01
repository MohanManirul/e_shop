<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath."/../classes/Customer.php");
?>
<?php
if(!isset($_GET['custId']) || $_GET['custId'] == NULL ){
    echo "<script>window.location = 'inbox.php';</script>";
    }else{
        $id = preg_replace('/[^-a-zA-Z0-9_]/', '', $_GET['custId']);
    }
?>
<?php 
        $cus = new Customer();
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
 		echo "<script>window.location = 'inbox.php';</script>";
    }

?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Customer Details</h2>
               <div class="block copyblock"> 
               
                <?php 
                    $getCustomer = $cus->getCustomerData($id);
                    if($getCustomer){
                        while($result = $getCustomer->fetch_assoc()){

                ?>
       <form action = "" method = "POST">
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
			<tr> <td></td>
				<td></td>
	            <td>
	                <input type="submit" name="submit" Value="Ok" />
	            </td>
        	</tr>

		</table>
      </form>
      <?php }}else{ echo "Customer Address Not available";}?>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>