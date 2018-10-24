<?php
/* connexion et selection de base de donne */
include('connect.php');
$sql="select * from eleves";

$result=mysqli_query($connect,$sql);


?>
<script type='text/javascript'>
	function confirmer_sup(){
		if(!confirm('Vous voulez vraiment supprimer l\'enristrement ?')){
			return false,
		}
	}
</script>
<br/>
<h1 class='titre_text'> Liste des eleves</h1>
<table align='center' width='80%' border='1' cellspacing="3" cellpadding="0">
<tr class='th_tab'>
	<th>Prenom</th><th>Nom</th><th>Date de Naissane</th><th>Lieu de Naissance</th><th>Classe</th><th>Administrer</th>
</tr>
	<?php
	$i=0;
	while($rows=mysqli_fetch_array($result)){
		$sqlclasse="select * from classe WHERE id_classe=".$rows['classe'];
        $resultclasse=mysqli_query($connect,$sqlclasse);
		$rowsclasse=mysqli_fetch_array($resultclasse);
		if($i%2){
			echo "<tr bgcolor='gray'>";
		}else{
				echo "<tr bgcolor='yellow'>";
		}
	?>
		    <td><?php echo $rows['Prenom'];?></td>
			<td><?php echo $rows['Nom'];?></td>
			<td><?php echo $rows['DateNaissance'];?></td>
			<td><?php echo $rows['LieuNaissance'];?></td>
			<td><?php echo $rowsclasse['NomClasse'].' '.$rowsclasse['IndiceClasse'];?></td>
			
			
			<td align='center'><a href='accueil.php?page=delete23php&prenom=<?php echo $rows['Prenom'];?>&nom=<?php echo $rows['Nom'];?>&date=<?php echo $rows['DateNaissance'];?>&lieu=<?php echo $rows['LieuNaissance'];?>&classe=<?php echo $rows['classe'];?>' onclick='return confirmer_sup()'><img src='del.gif'></a>
			</td>
		</tr>
	<?php
	$i++;
	}
	?>
</table>
<p>&nbsp,</p>