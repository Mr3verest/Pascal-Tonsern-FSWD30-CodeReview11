<?php 
	// select logged-in users detail
	ob_start();
	session_start();
	require_once 'dbconnect.php';

	if( !isset($_SESSION['email']) ) {
		header("Location: index.php");
		exit;
	}
	// select logged-in users detail
	$userEmail = $_SESSION['email'];
	
	$query = "SELECT * FROM customers WHERE email= '$userEmail'";
	$res = mysqli_query($conn, $query);
	$userRow = mysqli_fetch_assoc($res);
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mt-0" style="margin:24px 0;">
  <li class="navbar-brand disabled" href="javascript:void(0)"><?php if(isset($_POST['btn-update'])) {
        	echo "From now on you will be: " . ucwords($_POST['first_name']) . " " . ucwords($_POST['last_name']);
        } else {
        	echo "Welcome, " . ucwords($userRow['first_name']) . " " . ucwords($userRow['last_name']);
        	
        }
        ?></li>
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navb">
    <ul class="navbar-nav mr-auto offset-lg-1">
      <li class="nav-item">
	  	<a class="nav-link" href="home.php">Home</a>
      </li>
      <li class="nav-item ml-lg-4">
      <a class="nav-link" href="cars_list.php">Cars</a>
      </li>
      <li class="nav-item ml-lg-4">
	  	<a class="nav-link" href="office_list.php">Our Offices</a>
      </li>
      <li class="nav-item ml-lg-4">
	  	<a class="nav-link" href="cars_locations.php">Rent a Car</a>
      </li>
      

    </ul>

    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
      <a class="nav-link" href="account.php">Account</a>
      </li> 
      <li class="nav-item">
      <a class="nav-link" href="logout.php?logout">Log Out</a>
      </li>
  	</ul>
   
  </div>
</nav>
