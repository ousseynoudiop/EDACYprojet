<?php 
  session_start();


session_unset(); // suppression des variables de sessions
session_destroy(); // destruction de la session

/*redirection vers l'espace de connexion */

header("Location:index.php");exit;
?>