<?php
 
 	$id = $_POST['id'];
    $image = $_POST['image'];
    $name = $_POST['name'];
    $description = $_POST['description'];

    //echo $description; exit();
 
    $realImage = base64_decode($image);
 
    file_put_contents('uploads/'.$name, $realImage);

    $connect = new mysqli("localhost","root","","api");

	if($connect){
		
		$imagePath = "uploads/".$name;

		//move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);


		$connect->query("UPDATE images SET name='".$name."', image='".$image."', description='".$description."' WHERE id=". $id);


	} else {

		echo 'Failed';
	}
 
    echo "Image Uploaded Successfully.";
 
?>