<?php
/* connexion et selection de base de donne */
include("connect.php");
if(isset($_GET['id'])){
	$page=$_GET['page'];
	$indice=$_GET['indice'];
	$id=$_GET['id'];
	$classe=$_GET['classe'];
$info="select * from classe where NomClasse ='$classe' AND IndiceClasse='$indice' AND id_classe='$id'";
$rows_info=mysqli_query($connect,$info);
$rows_data=mysqli_fetch_array($rows_info);
if(isset($_POST['envoyer'])){
	$nom = $_POST['nom'];
	$indice=$_POST['indice'];

	$update="UPDATE classe SET  NomClasse='$nom',IndiceClasse='$indice' WHERE id_classe='$id'";
		if(mysqli_query($connect,$update)){
			header("location:accueil.php?page=afficher_classe3php");exit;
		}else{
			header("location:afficher_caissier.php?p=1&m=0");exit;
		}
}

?>

<form id="form1" name="form1" method="post" action="<?php $_SERVER['PHP_SELF'];?>">
  <table width="500" border="0" align="center" cellpadding="5" bgcolor="#0066FF">
    <tr>
      <td>&nbsp;</td>
      <td><table width="400" border="0" align="center" bgcolor="#CCCCCC">
        <tr>
          <th colspan="3" scope="row">Modification de Classe</th>
          </tr>
        <tr>
          <th scope="row">&nbsp;</th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th scope="row"><label for='nom'>Nom de la Classe</label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="nom" id="nom" value='<?php echo $rows_data['NomClasse'];?>'/>
          </td>
        </tr>
        
		<tr>
          <th scope="row"><label for='indice'>Indice de la Classe </label></th>
          <td>&nbsp;</td>
          <td>
            <input type="text" name="indice" id="indice" value='<?php echo $rows_data['IndiceClasse'];?>'/>
          </td>
        </tr>
		
        <tr>
          <th scope="row"><input type='submit' name='envoyer' value='Modifier'/></th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <?php } ?>
</form>

</body>
</html>
