<?php
	include 'conn.php';
	$id=$_POST['id'];
	$connect->query("DELETE FROM images WHERE id=".$id);

?>