<?php 
session_start();
include("content/connect.php");
if(isset($_POST['envoyer'])){
	$login  = $_POST['login'];
	$passe= $_POST['passe'];
	
	/* verication dans la base de donnee */
	$search="select * from user where Username='$login' and Password ='$passe'";
	$result=mysqli_query($connect,$search);
	$nb_result=mysqli_num_rows($result);
	if($nb_result){
		$donnee=mysql_fetch_array($result);
			$_SESSION['Username']=$donnee['Username'];
			$_SESSION['Password']=$donnee['Password'];
			$_SESSION['Prenom']=$donnee['Prenom'];	
			$_SESSION['Nom']=$donnee['Nom'];
			$_SESSION['Email']=$donnee['Email'];
			
		/* fin enregistrement */
		
		header("Location:content/accueil.php?page=accueil23php");
	}else{
		header("Location:index.php?e=0");
	}
}
?><!DOCTYPE html>
<html>
<head>
<title> Lycee d'Exellence</title>
<link rel='stylesheet' type="text/css" href='css/style.css'/>
<script language='javascript'>
	function _(e){
		return document.getElementById(e); 
	}
	function verifier(){
		
		if(_('login').value==''){
			alert('Vous devez saisir le login');
			  _('login').focus();
			return false;
		}
		if(_('mot_pass').value==''){
			alert('Vous devez saisir le mot de passe');
			return false;
		}
	}
</script>
</head>
<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form name='frm' action='index.php' method='post'>
	<table width='300' bgcolor='orange' align='center'>
		<tr>
			<td colspan='3'> Espace de Connexion</td>
			
		</tr>
		<?php
			if(isset($_GET['e'])&&($_GET['e']=='0')){ ?>
			<tr>
			<td colspan='3' class='error'>Couple Login mot passe inncorrect !!</td>
			
		</tr>	
			<?php
			}
		?>
		<?php
			if(isset($_GET['e'])&&($_GET['e']=='con')){ ?>
			<tr>
			<td colspan='3' class='error'>Vous devez vous identifier avant de continuer !!</td>
			
		</tr>	
			<?php
			}
		?>
		<tr>
			<td > Username : </td>
			<td>&nbsp;</td>
			<td><input type='text' name='login' id='login' value=''/>*</td>
		</tr>
		<tr>
			<td> Password : </td>
			<td>&nbsp;</td>
			<td><input type='password' name='passe' value='' id='passe'/>*</td>
		</tr>
		</br>
		</br>
		</br>
		<tr>
			<td> <input type='submit' name='envoyer' value='Connexion' onClick="return verifier()"/></td>
			<td>&nbsp;</td>
			<td><input type='reset' name='effacer' value='Annuler'/></td>
		</tr>
	</table>
</form>
</body>
</html>