-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 15:42:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_perfumes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `origen` varchar(25) NOT NULL,
  `crueltyFree` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`, `origen`, `crueltyFree`) VALUES
(9, 'BLIND', 'Nacional', 1),
(13, 'BOSS', 'Nacional', 1),
(16, 'CALVIN KLEIN', 'Importado', 0),
(3, 'CAROLINA HERRERA', 'mi casa', 0),
(12, 'HUGO BOSS', 'Importado', 0),
(14, 'KENZO', 'Importado', 0),
(2, 'MICHAEL KORS', 'Importado', 0),
(11, 'NINA RICCI', 'Importado', 0),
(10, 'PACO RABANNE', 'Importado', 0),
(4, 'PAULA CAHEN D ANVERS', 'Nacional', 1),
(15, 'RALPH LAUREN', 'Importado', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfumes`
--

CREATE TABLE `perfumes` (
  `id_producto` int(6) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `tamanio` int(10) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `precio` decimal(45,0) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfumes`
--

INSERT INTO `perfumes` (`id_producto`, `nombre`, `marca`, `tipo`, `tamanio`, `genero`, `precio`, `imagen`) VALUES
(2, 'Wonderlust', 'MICHAEL KORS', 'EdT', 100, 'Femenino', '16500', 'imagenes/634ca3fea8f49.jpg'),
(10, '212 Vip Rosé  ', 'CAROLINA HERRERA', 'EdP', 80, 'Femenino', '28200', 'imagenes/634ca45c8783a.jpg'),
(18, 'Punto', 'BLIND', 'EdP', 50, 'Unisex', '19350', 'imagenes/634ca28e2559a.jpg'),
(19, 'Les Sorbets ', 'NINA RICCI', 'EdT', 80, 'Femenino', '13200', 'imagenes/634ca3402e67b.jpg'),
(20, 'Polo Red Rush EDT 75 Ml', 'RALPH LAUREN', 'EdT', 75, 'Masculino', '20000', 'imagenes/634ca561c6892.jpg'),
(21, 'CK All', 'CALVIN KLEIN', 'EdT', 200, 'Unisex', '23400', 'imagenes/634ca6ad10084.jpg'),
(22, 'Boss Bottled EDP 50 Ml', 'HUGO BOSS', 'EdP', 50, 'Masculino', '18050', 'imagenes/634ca77922f9f.jpg'),
(23, 'Flower By Kenzo', 'KENZO', 'EdT', 30, 'Femenino', '15000', 'imagenes/634caad0afaad.jpg'),
(24, 'Phantom', 'PACO RABANNE', 'EdT', 50, 'Masculino', '20350', 'imagenes/634cab5176dfe.jpg'),
(25, 'Paula Alegria', 'PAULA CAHEN D ANVERS', 'EdT', 100, 'Femenino', '4900', 'imagenes/634cabd9a65c2.jpg'),
(26, 'Amor', 'PAULA CAHEN D ANVERS', 'EdT', 100, 'Femenino', '3900', 'imagenes/634cac36b774c.jpg'),
(27, 'Bolero', 'BLIND', 'EdP', 50, 'Unisex', '18500', 'imagenes/634cad168dd49.jpg'),
(28, 'Boos Intense Night', 'BOSS', 'EdP', 90, 'Masculino', '5750', 'imagenes/634cadb7c7b4f.jpg'),
(29, 'Boos EDP Intense Rose', 'BOSS', 'EdP', 90, 'Femenino', '5750', 'imagenes/634cae07e3c8c.jpg'),
(30, 'Bad Boy', 'CAROLINA HERRERA', 'EdT', 50, 'Masculino', '17500', 'imagenes/634cae7d4709b.jpg'),
(31, '212 Heroes', 'CAROLINA HERRERA', 'EdT', 90, 'Masculino', '22400', 'imagenes/634caf18f2b47.jpg'),
(32, 'Ch Privée', 'CAROLINA HERRERA', 'EdP', 30, 'Femenino', '12829', 'imagenes/634caf7248b92.jpg'),
(33, 'World', 'KENZO', 'EdP', 75, 'Femenino', '27200', 'imagenes/634cafebf3469.jpg'),
(34, 'Club', 'RALPH LAUREN', 'EdP', 50, 'Masculino', '21590', 'imagenes/634cb0ed24589.jpg'),
(35, 'Luna', 'NINA RICCI', 'EdT', 50, 'Femenino', '10200', 'imagenes/634cb178dda4b.jpg'),
(36, 'Balla', 'NINA RICCI', 'EdT', 80, 'Femenino', '16000', 'imagenes/634cb1fe24cf8.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `contrasenia`) VALUES
(1, 'eladministrador@perfumes.com', '$2a$12$gCSatnPXmpSjd4kP8eBNO..tk6hZBZjqU24Eo0TEfK/vLIamPKi9i');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca`),
  ADD UNIQUE KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `marca` (`marca`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `perfumes`
--
ALTER TABLE `perfumes`
  MODIFY `id_producto` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfumes`
--
ALTER TABLE `perfumes`
  ADD CONSTRAINT `perfumes_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `marcas` (`marca`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
