<?php
print_r($_POST);
if (isset($_POST['name']) && !empty($_POST['name']))
{
	$name = $_POST['name'];
	$email = $_POST['email'];
	$pass = $_POST['password'];
	
	$q = "UPDATE users SET name='$name',email='$email',password='$pass' WHERE name='$name'";
	$conn = mysqli_connect("localhost","root","","web_db");
	mysqli_query($conn,$q);

	echo "<script>alert('Data Updated');</script>";
	
	unset($_POST);
}
?>

<body>

<style>
body{
	background-color:aqua;
}

#wrapper{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 20vh;
	}

input{
	width:20vw;	
	height:6vh;
	border-radius:5px;
	margin:5pt;
	font-size:20px;
}

button{
	width:8vw;	
	height:5vh;
	border-radius:5px;
	margin:5pt;
	font-size:20px;
	background-color: #2196F3;
}
</style>

<div id="wrapper">
<form method="post" action="update.php">
<h1>PHP DB UPDATE VAL</h1>
<label>Name</label>
<input name="name" type="text">
<br>
<label>Email</label>
<input name="email" type="email">
<br>
<label>Pass&nbsp;&nbsp;&nbsp;</label>
<input name="password" type="password">
<br><br>
<button>Update</button>
</form>
</div>

</body>