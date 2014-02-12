<?php

$email = $_POST["email"];
$pass = $_POST["pass"];

mysql_connect("localhost","root","frodo2013") or die("Connection Error: " . mysql_error());
mysql_select_db("proyecto3_tienda") or die ("Error conectinh to db");

$sql = "INSERT INTO pedidos (id_usuario, estado_envio, precio_pedido, fecha_pedido) VALUES ('$cliente', 'pendiente',$precio, '$fecha');";

mysql_query($sql) or die ("Couldn t execute query.".mysql_error());


?>
