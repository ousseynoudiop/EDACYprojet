<?php 
include("connect.php");
if(isset($_GET['indice'])){
	$page=$_GET['page'];
	$indice=$_GET['indice'];
	$classe=$_GET['classe'];
	
	$del="DELETE FROM classe WHERE NomClasse='$classe' AND IndiceClasse='$indice'";
	if(mysqli_query($connect,$del)){
		header("location:accueil.php?page=afficher_classe3php");
	}
	}
?>