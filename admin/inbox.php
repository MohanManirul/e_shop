<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath."/../classes/Cart.php");
	$ct = new Cart();
	$fm = new Format();
?>
<?php
	if(isset($_GET['shiftid'])){
		$id 	= $_GET['shiftid'];
		$time 	= $_GET['time'];
		$price 	= $_GET['price'];
		$shift 	= $ct->productShifted($id,$time,$price);

	}
	if(isset($_GET['delshifted'])){
		$id 	= $_GET['delshifted'];
		$time 	= $_GET['time'];
		$price 	= $_GET['price'];
		$delshift = $ct->delShiftedProduct($id,$time,$price);

	}
?>

        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <?php
                	if(isset($shift)){
                		echo $shift;
                	}
                ?>
                <?php
                	if(isset($delshift)){
                		echo $delshift;
                	}
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Sl.</th>
							<th>P.Id</th>
							<th>C.Id</th>
							<th>Order Date</th>
							<th>Product</th>
							<th>Image</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Address</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							
							$getOrder = $ct->getAllorderProduct();
							if($getOrder){
								$i = 0;
								while($result = $getOrder->fetch_assoc()){
								$i++;
						?>
						<tr class="odd gradeX">
							<td><?php echo $i;?></td>
							<td><?php echo $result['productId'];?></td>
							<td><?php echo $result['cmrId'];?></td>
							<td><?php echo $fm->formatDate($result['date']);?></td>
							<td><?php echo $result['productName'];?></td>
							<td><img src = "<?php echo $result['image'];?>" height = "40px" width = "60px"/></td>
							<td><?php echo $result['quantity'];?> (Pcs)</td>
							<td>৳ <?php echo $result['price'];?></td>
							<td><a href="customer.php?custId=<?php echo $result['cmrId'];?>">View Details</a></td>
							<?php
							    if($result['status'] == '0'){?>
							    	<td><a href="?shiftid=<?php echo $result['cmrId'];?> & price=<?php echo $result['price'];?> & time=<?php echo $result['date'];?>">Shifted</a></td>
							    		
							    	<?php
							        
							    }elseif($result['status'] == '1'){?>
							    		<td>Pending</td>
							    	<?php }else{?>
							    		<td><a href="?delshifted=<?php echo $result['cmrId'];?> & price=<?php echo $result['price'];?> & time=<?php echo $result['date'];?>">Remove</a></td>
									<?php }?>
						</tr>
					<?php }}?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
