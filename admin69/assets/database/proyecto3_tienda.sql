-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 29-01-2014 a las 16:54:43
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.6-1ubuntu1.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `proyecto3_tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(10) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'futbol'),
(2, 'baloncesto'),
(3, 'running'),
(4, 'camisetas'),
(10, 'servicio'),
(100, 'servicio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id_pedido` int(10) DEFAULT NULL,
  `id_producto` int(10) DEFAULT NULL,
  KEY `FK_detalle_pedidos_pedidos` (`id_pedido`),
  KEY `FK_detalle_pedidos_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id_pedido`, `id_producto`) VALUES
(1, 1),
(1, 2),
(2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(10) NOT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  `estado_envio` varchar(15) DEFAULT NULL,
  `precio_pedido` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK__usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `estado_envio`, `precio_pedido`) VALUES
(1, 1, 'enviado', 123),
(2, 1, 'pendiente', 134);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `id_categoria` int(10) DEFAULT NULL,
  `tipo_producto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK__categorias` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `id_categoria`, `tipo_producto`) VALUES
(1, 'pelota', 'pelota para jugar ', 10, 1, 'articulo'),
(2, 'Pelota Baloncesto', 'pelota Baloncesto', 12, 2, 'articulo'),
(3, 'Adiddas Yellow 2000', 'Zapatillas  adiddas de color  amarillo , con una e', 99, 3, 'zapatillas'),
(4, 'Adiddas Black and Yellow 2000', 'Zapatillas  adiddas de color negro y amarillo , co', 99, 3, 'zapatillas'),
(5, 'Nike Red & Black', 'Nike producto estrella con una suela dividida en 3', 150, 3, 'zapatillas'),
(6, 'Nike Blue with shadow', 'Nike blue', 120, 3, 'zapatillas'),
(7, 'Rebook Special Yellow', 'Nice to meet u ', 115, 3, 'zapatillas'),
(8, 'Rebook Special Blue 2014', 'Nice to meet u ', 135, 3, 'zapatillas'),
(9, 'Asics R23', 'Nice to meet u ', 100, 3, 'zapatillas'),
(10, 'consultoria', 'asesoria consultoria', 1500, 10, 'servicio'),
(11, 'Asics V2', 'Nice to meet u ', 76, 3, 'zapatillas'),
(12, 'Camiseta Nike Corta', 'Nice to meet u ', 20, 4, 'camisetas'),
(13, 'Camiseta Nike Corta 2', 'Nice to meet u ', 20, 4, 'camisetas'),
(14, 'Camiseta Nike Larga', 'Nice to meet u ', 25, 4, 'camisetas'),
(15, 'Camiseta Nike Corta 3', 'Nice to meet u ', 20, 4, 'camisetas'),
(16, 'Camiseta Adiddas Corta', 'Nice to meet u ', 20, 4, 'camisetas'),
(17, 'Camiseta Adiddas Corta 2', 'Nice to meet u ', 20, 4, 'camisetas'),
(18, 'Camiseta Adiddas Larga', 'Nice to meet u ', 25, 4, 'camisetas'),
(31, 'Camiseta Hombre', 'Camiseta sudadera hombre', 15, 2, 'camiseta'),
(32, 'Camiseta Mujer', 'Camiseta sudadera mujer', 15, 2, 'camiseta'),
(33, 'Pantalon Mujer', 'Pantalon mujer', 12, 2, 'pantalon'),
(34, 'Pantalon Hombre', 'Pantalon Hombre', 12, 2, 'pantalon'),
(35, 'Calcetines Hombre', 'Calcetines Hombre', 7, 2, 'calcetines '),
(36, 'Calcetines Mujer', 'Calcetines Mujer', 7, 2, 'calcetines '),
(37, 'Calcetines unisex blancos', 'Calcetines unisex blancos', 5, 2, 'calcetines '),
(38, 'Kit Accesorios NBA', 'Kit Accesorios NBA', 25, 2, 'cintas'),
(39, 'Cinta Pelo NBA', 'Cinta Pelo NBA', 17, 2, 'cintas'),
(40, 'Conjunto junior', 'Conjunto junior pantalon, sudadera, camiseta', 37, 2, 'conjunto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mail` varchar(25) DEFAULT NULL,
  `codigo_postal` varchar(6) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `ciudad` varchar(15) DEFAULT NULL,
  `provincia` varchar(15) DEFAULT NULL,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `apellidos`, `password`, `mail`, `codigo_postal`, `direccion`, `ciudad`, `provincia`, `nombre`) VALUES
(0, 'root', '65549415', 'mislata@gmail.com', '13456', 'mislata mislata', 'mislata', 'valencia', 'root'),
(1, 'garcia garcia', '12341234', 'yo@ya.com', '73813', 'c/falsa 123', 'valencia', 'valencia', 'ramon'),
(2, 'el de la moto', '23423', 'asdf@asf.com', '23452', 'calle falsa 123', 'valencia', 'teruel', 'Maroto');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `FK_detalle_pedidos_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `FK_detalle_pedidos_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK__usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK__categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
