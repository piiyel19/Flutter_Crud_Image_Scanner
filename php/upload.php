<?php 

	$connect = new mysqli("localhost","root","","api");

	if($connect){

		$image = $_FILES['image']['name'];
		$title = $_POST['title'];
		$imagePath = "uploads/".$image;

		move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);

		$connect->query("INSERT INTO images(title,image) VALUES ('".$title."','".$image."')");

	} else {

		echo 'Failed';
	}
?>