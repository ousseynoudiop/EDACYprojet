<?php
/* connexion et selection de base de donne */
include('connect.php');
session_start();
if(isset($_POST['envoyer'])){
	$nomclasse=$_POST['nom'];
	$indice=$_POST['indice'];
	$id=$_SESSION['Email'];
	
	/* requete sql */
	$sql="INSERT INTO classe(NomClasse,IndiceClasse,id_user) VALUES('$nomclasse','$indice','$id')";
	
	/* execution requete */
	
	$result=mysqli_query($connect,$sql);
	
	if($result){
		//echo'succes ok';
		header("location:accueil.php?page=afficher_classe3php");
	}
}
?>
<!DOCTYPE html>
<html>
<head>
<title>Inscription</title>
</head>

<body>
</br>
</br>
</br>
<form id="form1" name="form1" method="post" action="<?php $_SERVER['PHP_SELF'];?>">
  <table width="500" border="0" align="center" cellpadding="5" bgcolor="#0066FF">
    <tr>
      <td>&nbsp;</td>
      <td><table width="400" border="0" align="center" bgcolor="#CCCCCC">
        <tr>
          <th colspan="3" scope="row">Formulaire pour Ajouter une Classe</th>
          </tr>
        <tr>
          <th scope="row">&nbsp;</th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
       
         <tr>
          <th scope="row"><label for='nom'>Nom de la classe</label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="nom" id="nom" />
          </td>
        </tr>
		 <tr>
          <th scope="row"><label for='indice'>Indice de la classe</label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="indice" id="indice" />
          </td>
       
        <tr>
          <th scope="row"><input type='submit' name='envoyer' value='Enregistrer'/></th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
      <td>&nbsp;</td>
    </tr>
  </table>
<p>

  </p>
</form>
</p>
</body>
</html>