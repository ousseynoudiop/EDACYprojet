<?php
/* connexion et selection de base de donne */
include('connect.php');
?>
<?php
$sql="select * from classe";

$result=mysqli_query($connect,$sql);


?>
<script type='text/javascript'>
	function confirmer_sup(){
		if(!confirm('Vous voulez vraiment supprimer l\'enristrement ?')){
			return false;
		}
	}
</script>
<br/>
<h1 class='titre_text'> Liste des classes </h1>
<table align='center' width='70%' border='1' cellspacing="3" cellpadding="0">
<tr class='th_tab'>
	<th>Nom de la classe</th><th>Indice de la classe</th><th>Administrer</th>
</tr>
	<?php
	
	$i=0;
	while($rows=mysqli_fetch_array($result)){
		if($i%2){
			echo "<tr bgcolor='gray'>";
		}else{
				echo "<tr bgcolor='yellow'>";
		}
	?>
	        
		    <td><?php echo $rows['NomClasse'];?></td>
			<td><?php echo $rows['IndiceClasse'];?></td>
			<td align='center'><a href='accueil.php?page=delete3php&classe=<?php echo $rows['NomClasse'];?>&indice=<?php echo $rows['IndiceClasse'];?>' onclick='return confirmer_sup()'><img src='del.gif'></a>
			<a href='accueil.php?page=modifier3php&classe=<?php echo $rows['NomClasse'];?>&indice=<?php echo $rows['IndiceClasse'];?>&id=<?php echo $rows['id_classe'];?>'> <img src='modif.gif' title='Pour modifier' width='20'/></a></td>
		</tr>
	<?php
	$i++;
	}
	?>
</table>
<p>&nbsp;</p>