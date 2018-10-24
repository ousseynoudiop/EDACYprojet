<?php
$page=$_GET["page"];
$page=str_replace('3','.',$page);
?>
<html>
<head>
<title> ==== Lycée d'Exellence de Dakar ====</title>
<link rel='stylesheet' type="text/css" href='../css/style.css'/>
</head>
<body>
	<div id='conterner'>
		<div id='banniere'>
			<?php include("banniere.php"); ?>
		</div>
		<div id='sub_banniere'>
		</div>
		<div id='navigation'>
			<?php include("nav.php");  ?>
		</div>
		<div id='contenue'>


  <center><?php include($page);?></center>
  </div>
		<div id='sub_footer'>
			
		</div>
		<div id='pied_de_page'>
			Lycee d'Exellence de Dakar
		</div>
		<div id='sup_footer'>
			
		</div>
	</div>
</body>
</body>
</html>