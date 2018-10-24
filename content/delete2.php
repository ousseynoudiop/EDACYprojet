<?php 
include("connect.php");
if(isset($_GET['classe'])){
	$prenom=$_GET['prenom'];
	$nom=$_GET['nom'];
	$date=$_GET['date'];
	$lieu=$_GET['lieu'];
	$classe=$_GET['classe'];
	
	$del="DELETE FROM eleves WHERE Prenom='$prenom' AND Nom='$nom' AND DateNaissance='$date' AND LieuNaissance='$lieu' AND classe='$classe'";
	if(mysqli_query($connect,$del)){
		header("location:accueil.php?page=afficher_eleve3php");
	}
	}