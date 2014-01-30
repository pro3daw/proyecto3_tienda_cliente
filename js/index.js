// Js de productos Modifica para Productos

//cargamos categorias y el modal del insert product
$(document).ready(function() {

    categorias();

});

function categorias() {
    $.ajax({
        dataType: 'json',
        url: 'categorias.php',
        success: function(data) {
            datos = '';
            $.each(data, function(index) {
                datos += '<li><a class="list-group-item" href="javascript:articulos(\'' + data[index].id_categoria + '\', \'' + data[index].nombre + '\')">' + data[index].nombre + '</a></li>';
            });
            datos += '</ul>';
            $('#panel-element-305610').html(datos);
        }
    });
}

function todos_articulos() {
    //carga todos los productos en datatable
    $.ajax({
        dataType: 'json',
        url: 'articulos.php',
        success: function(data) {
            datos = '<thead><tr><th>ID_Producto</th><th>Nombre</th><th>Precio</th><th>Vista Previa</th></tr></thead><tbody>';
            $.each(data, function(index) {
                datos += '<tr><td>' + data[index].id_producto + '</td><td>' + data[index].nombre + '</td><td>' + data[index].precio + '</td><td><img src=./assets/img/' + data[index].id_producto + '.jpg' + '></td><td><a href="javascript:button_modify(' + data[index].id_producto + ')" id="form_insert2"><i class="icon-edit"></i></a></td><td><a href="javascript:articulo_borrar(' + data[index].id_producto + ',' + data[index].id_categoria + ')"><i class="icon-remove"></i></a></td></tr>';
            });
            datos += '</tbody></table></div>';
            $('#container').html(datos);
        }
    });
}
//load products
function articulos(id_categoria, nombre) {

    $.ajax({
        dataType: 'json',
        type: 'GET',
        url: 'articulos_categorias.php?id_categoria=' + id_categoria,
        success: function(data) {

            datos = '';
            $.each(data, function(index) {

                datos += '<div class="col-sm-4 col-lg-4 col-md-4"><div class="thumbnail"><img src="img/' + data[index].id_producto + '.jpg" alt=""><div class="caption"><h4 class="pull-right">' + data[index].precio + '</h4> <h4><a href="#">' + data[index].nombre + '</a></h4><p>' + data[index].descripcion + '</p></div><div class="ratings"><p class="pull-right">12 reviews</p><p><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></p></div></div></div>';

            });
            datos += '';

            $('#container_productos.row').html(datos);
        }
    });
}    