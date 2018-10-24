<?php
	$host='localhost';
	$user='root';
	$pwd='passer';
	$base='ecole';
	$port='3306';
	
	if(!$connect=mysqli_connect($host,$user,$pwd,$base,$port)){
			echo"connexion impossible";
			exit;
	}

?>