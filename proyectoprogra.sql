-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-03-2020 a las 18:10:25
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoprogra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `contrasena` varchar(20) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `empleadoid_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`idadmin`, `contrasena`, `usuario`, `empleadoid_empleado`) VALUES
(32, '123', 'Ignacio', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre_cl` varchar(50) DEFAULT NULL,
  `rut_cl` varchar(25) DEFAULT NULL,
  `telefonocl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `correo`, `direccion`, `nombre_cl`, `rut_cl`, `telefonocl`) VALUES
(4, 'email@email.com', 'Avenida Siempre Viva 123', 'ignacio', 'xx.xxx.xxx-x', 123456789),
(5, 'email@email.com', '2025 NW 102ND AVE', 'Sebastian', 'xx.xxx.xxx-x', 123456789),
(6, 'email@email.com', 'Calle Falsa 0213', 'Beatriz', 'xx.xxx.xxx-x', 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_venta`
--

CREATE TABLE `cliente_venta` (
  `clienteid_cliente` int(11) NOT NULL,
  `ventaid_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre_emp` varchar(50) DEFAULT NULL,
  `rango` smallint(6) DEFAULT NULL,
  `rut_emp` varchar(255) DEFAULT NULL,
  `telefono_emp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre_emp`, `rango`, `rut_emp`, `telefono_emp`) VALUES
(12, 'Ignacio', 0, '20.078.180-5', 953748834),
(13, 'Sebastian', 1, 'xx.xxx.xxx-x', 11111111),
(14, 'Beatriz', 1, 'xx.xxx.xxx-x', 222222222);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_venta`
--

CREATE TABLE `empleado_venta` (
  `ventaid_venta` int(11) NOT NULL,
  `empleadoid_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_prod` varchar(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_prod`, `precio`, `stock`) VALUES
(6, 'Impresora Generica', 100000, 100),
(7, 'Playstation 2', 50000, 50),
(8, 'Seguro de Vida', 99000, 1),
(9, 'Sofa Cama', 10, 100),
(10, 'Chihuahua', 2000, 99999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_venta`
--

CREATE TABLE `producto_venta` (
  `productoid_producto` int(11) NOT NULL,
  `ventaid_venta` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_venta`
--

INSERT INTO `producto_venta` (`productoid_producto`, `ventaid_venta`, `cantidad`) VALUES
(6, 60, 5),
(7, 60, 5),
(7, 62, 3),
(8, 60, 5),
(9, 62, 3),
(10, 61, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `detalle`, `fecha`, `monto`, `total`) VALUES
(60, NULL, '2012-12-12', NULL, NULL),
(61, NULL, '2013-12-12', NULL, NULL),
(62, NULL, '2020-02-28', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`),
  ADD KEY `FKr6f5bt975mnwacsl9b25gbrs2` (`empleadoid_empleado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente_venta`
--
ALTER TABLE `cliente_venta`
  ADD KEY `FKi54ntbv4yhppi1abadpkgcmvo` (`ventaid_venta`),
  ADD KEY `FKtak368ku7dyy5s2mvuotytyuy` (`clienteid_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleado_venta`
--
ALTER TABLE `empleado_venta`
  ADD KEY `FK4xcx2nnnif1whwhdfsfrk9cvt` (`empleadoid_empleado`),
  ADD KEY `FK5rchboykkxhx9vx3jqdud1wdr` (`ventaid_venta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD PRIMARY KEY (`productoid_producto`,`ventaid_venta`),
  ADD KEY `FK1k6i45ewamago8brxcv1ei4n1` (`ventaid_venta`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FKr6f5bt975mnwacsl9b25gbrs2` FOREIGN KEY (`empleadoid_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Filtros para la tabla `cliente_venta`
--
ALTER TABLE `cliente_venta`
  ADD CONSTRAINT `FKi54ntbv4yhppi1abadpkgcmvo` FOREIGN KEY (`ventaid_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `FKtak368ku7dyy5s2mvuotytyuy` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `empleado_venta`
--
ALTER TABLE `empleado_venta`
  ADD CONSTRAINT `FK4xcx2nnnif1whwhdfsfrk9cvt` FOREIGN KEY (`empleadoid_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `FK5rchboykkxhx9vx3jqdud1wdr` FOREIGN KEY (`ventaid_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `producto_venta`
--
ALTER TABLE `producto_venta`
  ADD CONSTRAINT `FK1k6i45ewamago8brxcv1ei4n1` FOREIGN KEY (`ventaid_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `FKfs8hegnv68u2w8ackdpntses0` FOREIGN KEY (`productoid_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
