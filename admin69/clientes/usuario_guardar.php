<?php
$id_usuario = $_GET["id_usuario"];
$apellidos = $_GET["apellidos"];
$password = $_GET["password"];
$mail = $_GET["mail"];
$codpos = $_GET["codpos"];
$direccion = $_GET["direccion"];
$ciudad = $_GET["ciudad"];
$provincia = $_GET["provincia"];
$nombre = $_GET["nombre"];

mysql_connect("localhost", "root", "frodo2013") or die("Connection Error: " . mysql_error());
mysql_select_db("proyecto3_tienda") or die("Error conecting to db.");

$SQL = "UPDATE productos SET id_usuario=$id_usuario, nombre='$nombre', apellidos='$apellidos', password='$password', mail='$mail', codpos='$codpos', direccion='$direccion', ciudad='$ciudad', provincia='$provincia', nombre='$nombre' WHERE id_usuario=$id_usuario;";

mysql_query($SQL) or die("Couldn t execute query." . mysql_error());


//Construyo un objeto json que indica que todo va bien, tengo que indicar que recibo json en el archivo index
//$datos = array('codigo' => "OK, todo ha ido bien ACTUALIZADO");
header("Content-type: application/json");
echo json_encode($id_categoria);
?>



