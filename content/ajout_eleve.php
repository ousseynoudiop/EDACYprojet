<?php
/* connexion et selection de base de donne */
include("connect.php");

/* charger liste deroulante */

if(isset($_POST['envoyer'])){
	$prenom=$_POST['prenom'];
	$nom=$_POST['nom'];
	$lieunaissance=$_POST['lieunaissance'];
	$adresse=$_POST['adresse'];
	$nomparent=$_POST['nomparent'];
	$datenaissance=$_POST['datenaissance'];
		$prenomparent=$_POST['prenomparent'];
		$classe=$_POST['classe'];
	
	/* requete sql */
	$sql="INSERT INTO eleves(Prenom,Nom,DateNaissance,LieuNaissance,Adresse,PrenomParent,NomParent,classe) 
	VALUES ('$prenom','$nom','$datenaissance','$lieunaissance','$adresse','$prenomparent','$nomparent','$classe')";
	
	/* execution requete */
	
	$result=mysqli_query($connect,$sql);
	
	if($result){
		//echo'succes ok';
		header("location:accueil.php?page=afficher_eleve3php");
	}
}
$sqlclasse="select * from classe";
$resultclasse=mysqli_query($connect,$sqlclasse);

?>
<br/>
<p>
<form id="form1" name="form1" method="post" action="<?php $_SERVER['PHP_SELF'];?>">
  <table width="500" border="0" align="center" cellpadding="5" bgcolor="#0066FF">
    <tr>
      <td>&nbsp;</td>
      <td><table width="400" border="0" align="center" bgcolor="#CCCCCC">
        <tr>
          <th colspan="3" scope="row">Formulaire ajout des eleves</th>
          </tr>
        <tr>
          <th scope="row">&nbsp;</th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
		<tr>
          <th scope="row"><label for='prenom'>Prenom </label></th>
          <td>&nbsp;</td>
          <td>
		   <input type="text" name="prenom" id="prenom" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='nom'>Nom</label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="nom" id="nom" />
          </td>
        </tr>
        
		<tr>
          <th scope="row"><label for='datenaissance'>Date de Naissance </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="date" name="datenaissance" id="datenaissance" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='lieunaissance'>Lieu de Naissance </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="lieunaissance" id="datenaissance" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='adresse'>Adresse </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="adresse" id="adresse" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='prenomparent'>Prenom du parent </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="prenomparent" id="prenomparent" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='nomparent'>Nom du parent </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="nomparent" id="nomparent" />
          </td>
        </tr>
		<tr>
          <th scope="row"><label for='classe'>Classe </label></th>
          <td>&nbsp;</td>
          <td>
             <select name="classe" id="classe" class="form-control" >
			<?php while($rows=mysqli_fetch_array($resultclasse))
				echo '
               <option value="'.$rows["id_classe"].'">'.$rows["NomClasse"].' '.$rows["IndiceClasse"].'</option>
                     '; 
				?>	
             </select>
          </td>
        </tr>
        <tr>
          <th scope="row"><input type='submit' name='envoyer' value='Enregistrer'/></th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</p>
</body>
</html>