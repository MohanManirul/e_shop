
<?php include "inc/header.php";?>
 <!-----receiving id from sidebar page-------->
	<?php
		if(!isset($_POST['search']) || $_POST['search'] == NULL ){
		header("Location:index.php");
	}else{
		$search = $_POST['search'];

	} 
	?>
<!-----receiving id from sidebar page-------->

 	<div class="section group">
	      	
				<?php  
					$query = "SELECT * FROM tbl_product WHERE productName LIKE '%$search%' OR body LIKE '%$search%'";
					$post = $db->select($query);
					if($post){
							while($result = $post->fetch_assoc()){

				?>
		<div class="grid_1_of_4 images_1_of_4">
			 <a href="details.php?proid=<?php echo $result['productId'];?>"><img src="admin/<?php echo $result['image'];?>" alt="" /></a>
			 <h2><?php echo $result['productName'];?></h2>
			 <p><?php echo $fm->textShorten($result['body'],60);?></p>
			 <p><span class="price">৳<?php echo $result['price'];?></span></p>
		     <div class="button"><span><a href="details.php?proid=<?php echo $result['productId'];?>" class="details">Details</a></span></div>
		</div>
		<?php } }else{
					?><p>Your Search Product Not Found !!..Please Search Again With Related Keywords</p><?php
			}?>

	</div>

<?php include "inc/footer.php";?>