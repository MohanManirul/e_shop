<?php include "inc/header.php";?>
<?php
    $login = Session::get("cuslogin");
    if($login == false){
        header("Location:login.php");
    }
?>
<style>
	.psuccess{width: 500px;min-height: 200px; text-align: center; border:1px solid #ddd; margin:0 auto; padding: 20px; }
	.psuccess h2 {border-bottom: 1px solid #ddd ;color:green;  margin-bottom: 40px; padding-bottom: 10px; }
	.psuccess p{ font-size: 18px; line-height: 25px; text-align: left; }
</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
			<div class="psuccess">
				<h2>Success !</h2>
				<?php
					$cmrId = Session::get("cmrId");
					$amount =$ct->payebleAmount($cmrId);
					$sum = 0;
					if($amount){
						
						while ($result = $amount->fetch_assoc()) {
							$price = $result['price'];
							$sum = $sum + $price;

						}
					}
				?>
				<p>Total Payeble Amount(Including VAT) : ৳

				<?php 
					$vat = $sum * 0.1;
					$total = $sum + $vat;
					echo $total;
				?>

				</p>
				<p>Thanks for purchase . Receive Your Order Succesfull. We will contact You ASAP with delivery details . Here is your order details ...<a href="orderdetails.php">order Details</a></p>
			</div>
 		</div>
 	</div>
</div>
<?php include "inc/footer.php";?>