-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2020 a las 14:45:59
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db-rainbow`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_funcion`
--

CREATE TABLE `id_funcion` (
  `id_funcion` int(11) NOT NULL,
  `funcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `id_funcion`
--

INSERT INTO `id_funcion` (`id_funcion`, `funcion`) VALUES
(1, 'defensa'),
(2, 'ataque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_grupo_fuerza`
--

CREATE TABLE `id_grupo_fuerza` (
  `id_grupo_fuerza` int(11) NOT NULL,
  `grupo_fuerza` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `id_grupo_fuerza`
--

INSERT INTO `id_grupo_fuerza` (`id_grupo_fuerza`, `grupo_fuerza`, `pais`) VALUES
(1, 'SAS', 'Gean Bretaña'),
(2, 'SWAT', 'EEUU'),
(3, 'GIGN', 'Francia'),
(4, 'GSG9', 'Alemania'),
(5, 'Spetsnaz', 'Rusia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_resistencia`
--

CREATE TABLE `id_resistencia` (
  `id_resistencia` int(11) NOT NULL,
  `resistencia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `id_resistencia`
--

INSERT INTO `id_resistencia` (`id_resistencia`, `resistencia`) VALUES
(1, 'baja'),
(2, 'media'),
(3, 'alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operadores`
--

CREATE TABLE `operadores` (
  `id_operador` int(11) NOT NULL,
  `apodo` varchar(20) NOT NULL,
  `id_grupo_fuerza` int(11) NOT NULL,
  `id_velocidad` int(11) NOT NULL,
  `id_resistencia` int(11) NOT NULL,
  `id_funcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `operadores`
--

INSERT INTO `operadores` (`id_operador`, `apodo`, `id_grupo_fuerza`, `id_velocidad`, `id_resistencia`, `id_funcion`) VALUES
(1, 'THERMITE', 2, 2, 2, 2),
(2, 'THATCHER', 1, 2, 2, 2),
(3, ' TWITCH', 3, 3, 2, 2),
(4, 'SLEDGE', 1, 2, 2, 2),
(5, 'MONTAGNE', 3, 1, 3, 2),
(6, 'FUZE', 5, 1, 3, 2),
(7, 'BLITZ', 4, 2, 2, 2),
(8, 'ASH', 2, 3, 1, 2),
(9, 'IQ', 4, 3, 1, 2),
(10, 'GLAZ', 5, 2, 2, 2),
(11, 'MUTE', 1, 2, 2, 1),
(12, 'JAGGER', 4, 2, 2, 1),
(13, 'ROOK', 3, 1, 3, 1),
(14, 'BANDIT', 4, 3, 1, 1),
(15, 'SMOKE', 1, 2, 2, 1),
(16, 'CASTLE', 2, 2, 2, 1),
(17, 'KAPKAN', 5, 2, 2, 1),
(18, 'DOC', 3, 1, 3, 1),
(19, 'PULSE', 2, 3, 1, 1),
(20, ' TACHANKA', 5, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `velocidad`
--

CREATE TABLE `velocidad` (
  `id_velocidad` int(11) NOT NULL,
  `velocidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `velocidad`
--

INSERT INTO `velocidad` (`id_velocidad`, `velocidad`) VALUES
(1, 'baja'),
(2, 'media'),
(3, 'alta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `id_funcion`
--
ALTER TABLE `id_funcion`
  ADD PRIMARY KEY (`id_funcion`);

--
-- Indices de la tabla `id_grupo_fuerza`
--
ALTER TABLE `id_grupo_fuerza`
  ADD PRIMARY KEY (`id_grupo_fuerza`);

--
-- Indices de la tabla `id_resistencia`
--
ALTER TABLE `id_resistencia`
  ADD PRIMARY KEY (`id_resistencia`);

--
-- Indices de la tabla `operadores`
--
ALTER TABLE `operadores`
  ADD PRIMARY KEY (`id_operador`),
  ADD KEY `id_grupo_fuerza` (`id_grupo_fuerza`),
  ADD KEY `velocidad` (`id_velocidad`),
  ADD KEY `resistencia` (`id_resistencia`),
  ADD KEY `funcion` (`id_funcion`);

--
-- Indices de la tabla `velocidad`
--
ALTER TABLE `velocidad`
  ADD PRIMARY KEY (`id_velocidad`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `operadores`
--
ALTER TABLE `operadores`
  ADD CONSTRAINT `operadores_ibfk_1` FOREIGN KEY (`id_grupo_fuerza`) REFERENCES `id_grupo_fuerza` (`id_grupo_fuerza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operadores_ibfk_2` FOREIGN KEY (`id_resistencia`) REFERENCES `id_resistencia` (`id_resistencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operadores_ibfk_3` FOREIGN KEY (`id_velocidad`) REFERENCES `velocidad` (`id_velocidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operadores_ibfk_4` FOREIGN KEY (`id_funcion`) REFERENCES `id_funcion` (`id_funcion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
