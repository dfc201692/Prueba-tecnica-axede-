-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2024 a las 17:08:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `idHabitacion` int(11) NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  `Tipo` varchar(50) NOT NULL,
  `CupoMaximo` int(11) NOT NULL,
  `Disponibilidad` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`idHabitacion`, `idSede`, `Tipo`, `CupoMaximo`, `Disponibilidad`) VALUES
(1, 1, 'Estándar', 4, 1),
(2, 1, 'Estándar', 4, 1),
(31, 2, 'Premium', 6, 1),
(32, 2, 'Premium', 6, 1),
(41, 3, 'Estándar', 8, 1),
(42, 3, 'Estándar', 8, 1),
(61, 4, 'Estándar', 6, 1),
(62, 4, 'Estándar', 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(11) NOT NULL,
  `idHabitacion` int(11) DEFAULT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `NumeroPersonas` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `idSede` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Ubicacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`idSede`, `Nombre`, `Ubicacion`) VALUES
(1, 'Barranquilla', 'Ubicacion_Barranquilla'),
(2, 'Cali', 'Ubicacion_Cali'),
(3, 'Cartagena', 'Ubicacion_Cartagena'),
(4, 'Bogotá', 'Ubicacion_Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `idTarifa` int(11) NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  `TipoAlojamiento` varchar(50) NOT NULL,
  `Temporada` varchar(50) NOT NULL,
  `NumeroPersonas` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`idTarifa`, `idSede`, `TipoAlojamiento`, `Temporada`, `NumeroPersonas`, `Precio`) VALUES
(1, 1, 'Estándar', 'Alta', 4, 100000.00),
(2, 1, 'Estándar', 'Alta', 4, 120000.00),
(3, 2, 'Vip', 'Alta', 6, 200000.00),
(4, 2, 'Vip', 'Baja', 6, 250000.00),
(21, 2, 'Premium', 'Baja', 6, 150000.00),
(22, 2, 'Premium', 'Baja', 6, 180000.00),
(31, 3, 'Estándar', 'Alta', 8, 80000.00),
(32, 3, 'Estándar', 'Alta', 8, 100000.00),
(61, 4, 'Estándar', 'Baja', 6, 120000.00),
(62, 4, 'Estándar', 'Baja', 6, 140000.00),
(63, 4, 'Vip', 'Baja', 6, 200000.00),
(64, 4, 'Vip', 'Alta', 6, 250000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`idHabitacion`),
  ADD KEY `idSede` (`idSede`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `idHabitacion` (`idHabitacion`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`idSede`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`idTarifa`),
  ADD KEY `idSede` (`idSede`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idHabitacion`) REFERENCES `habitaciones` (`idHabitacion`);

--
-- Filtros para la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD CONSTRAINT `tarifas_ibfk_1` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
