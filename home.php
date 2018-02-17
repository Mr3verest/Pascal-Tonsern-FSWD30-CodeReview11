<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';
	// if session is not set this will redirect to login page
	if( !isset($_SESSION['email']) ) {
		header("Location: index.php");
		exit;
	}
	// select logged-in users detail
	$userEmail = $_SESSION['email'];
	$query = "SELECT * FROM customers WHERE email= '$userEmail'";
	$res = mysqli_query($conn, $query);
	$userRow = mysqli_fetch_assoc($res);
 	
	//  display all orders for user
	$queryOrders = "SELECT start_date, return_date, car_name FROM orders INNER JOIN customers ON orders.fk_email = customers.email INNER JOIN cars ON orders.fk_car_id = cars.car_id WHERE email = '$userEmail' ";
	$resultOrders = mysqli_query($conn, $queryOrders);


?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
  	<meta charset="UTF-8">
  	<title>Home</title>
	
</head>

<body>
	<?php include "navbar.php"; ?>
	<div class="row mx-auto">
		<div class="px-5 py-3 col-md-5 col-xs-12">	
			<p class="h2">Logged In As - <?php echo $userRow['email']; ?></p>
			<a href="logout.php?logout">Sign Out</a>
		</div>
		<div class="col-md-7 col-xs-5 py-5">
			<p>Welcome to your Dashboard!</p>

		</div>
		<div class="col-md-4 col-xs-12">
	<!-- Show reservations-->
			<p class="h3">Your orders: <hr></p>
			<table class="table table-dark">
				<tr>
					<th> Rent Date: </th>
					<th> Return Date: </th>
					<th> Car: </th>
				</tr>
				<?php
					;
					while ($rowOrders = mysqli_fetch_assoc($resultOrders)) {

				?>
				<tr>
					<td><?php echo $rowOrders['start_date']; ?></td>
					<td><?php echo $rowOrders['return_date']; ?></td>
					<td><?php echo $rowOrders['car_name']; ?></td>
				</tr>
				<?php
					}
				?>
				
			</table>

		</div>
		
		<div class="col-md-7 col-xs-12 offset-md-1">
			
    </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
</body>
</html>

<?php ob_end_flush(); ?>