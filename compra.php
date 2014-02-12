<?php
$carritoJSON = $_POST["datos"];

$carrito = new stdClass();

$carrito = json_decode($carritoJSON);

$precio = $carrito->totalPrecio;
$fecha = $carrito->fecha;
$cliente = $carrito->idCliente;


mysql_connect("localhost","root","frodo2013") or die("Connection Error: " . mysql_error());
mysql_select_db("proyecto3_tienda") or die ("Error conectinh to db");

$sql = "INSERT INTO pedidos (id_usuario, estado_envio, precio_pedido, fecha_pedido) VALUES ('$cliente', 'pendiente',$precio, '$fecha');";

mysql_query($sql) or die ("Couldn t execute query.".mysql_error());

$sql = "SELECT MAX(id_pedido) as maximo from pedidos where id_usuario=$cliente;";

$result =mysql_query($sql) or die ("Couldn t execute query.".mysql_error());

$fila= mysql_fetch_array($result,MYSQL_ASSOC);
//$datos=array('id'=>$fila["maximo"]);
//echo $datos['id'];
$idPedido = $fila["maximo"];



foreach ($carrito->listaProductos as $producto) {
    
    $sql = "INSERT INTO detalle_pedidos (id_pedido, id_producto, unidades, precio_unidad,total_linea) VALUES ($idPedido,$producto->id,$producto->unidades,$producto->precio,$producto->total);";

    mysql_query($sql) or die ("Couldn t execute query.".mysql_error());
    
}



?>
