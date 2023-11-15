-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2023 a las 10:56:56
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seguintra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `prueba` varchar(45) DEFAULT NULL,
  `pregunta` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `prueba`, `pregunta`) VALUES
(1, 'NOM 17', 'La NOM 17 aplica únicamente a empresas grandes con más de 500 empleados.'),
(2, 'NOM 17', 'La NOM 17 establece los requisitos para la capacitación de las brigadas de emergencia en el lugar de trabajo.'),
(3, 'NOM 17', 'Los empleadores no tienen responsabilidad en la implementación de medidas de protección civil según la NOM 17.'),
(4, 'NOM 17', 'La NOM 17 solo se enfoca en la prevención de incendios.'),
(5, 'NOM 17', 'La NOM 17 establece requisitos específicos para la evacuación de personas con discapacidades.'),
(6, 'NOM 17', 'Las brigadas de emergencia deben ser formadas por voluntarios que no tienen otra función en la empresa.'),
(7, 'NOM 35', 'La NOM-035 aplica solo a empresas con más de 500 empleados.'),
(8, 'NOM 35', 'La NOM-035 se enfoca exclusivamente en los riesgos físicos en el lugar de trabajo.'),
(9, 'NOM 35', 'Los empleadores no tienen la responsabilidad de identificar y prevenir factores de riesgo psicosocial en el trabajo según la NOM-035.'),
(10, 'NOM 35', 'La NOM-035 requiere que los empleadores realicen evaluaciones anuales de factores de riesgo psicosocial en el trabajo.'),
(11, 'NOM 35', 'La norma no establece ningún requisito para la atención de trabajadores que experimenten situaciones de violencia laboral.'),
(12, 'NOM 35', 'La NOM-035 no se aplica a trabajadores en teletrabajo o trabajo a distancia.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebas`
--

CREATE TABLE `pruebas` (
  `id_usrvsprueba` varchar(45) NOT NULL,
  `nombre_prueba` varchar(45) NOT NULL,
  `minaprob` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pruebas`
--

INSERT INTO `pruebas` (`id_usrvsprueba`, `nombre_prueba`, `minaprob`) VALUES
('NOM 17', 'NOM 17', 5),
('NOM 35', 'NOM 35', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuestas` int(11) NOT NULL,
  `pregunta` int(11) DEFAULT NULL,
  `respuesta` varchar(45) DEFAULT NULL,
  `correcta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_respuestas`, `pregunta`, `respuesta`, `correcta`) VALUES
(1, 1, 'VERDADERO', 0),
(2, 1, 'FALSO', 1),
(3, 2, 'VERDADERO', 1),
(4, 2, 'FALSO', 0),
(5, 3, 'VERDADERO', 0),
(6, 3, 'FALSO', 1),
(7, 4, 'VERDADERO', 0),
(8, 4, 'FALSO', 1),
(9, 5, 'VERDADERO', 1),
(10, 5, 'FALSO', 0),
(11, 6, 'VERDADERO', 0),
(12, 6, 'FALSO', 1),
(13, 7, 'VERDADERO', 0),
(14, 7, 'FALSO', 1),
(15, 8, 'VERDADERO', 0),
(16, 8, 'FALSO', 1),
(17, 9, 'VERDADERO', 0),
(18, 9, 'FALSO', 1),
(19, 10, 'VERDADERO', 1),
(20, 10, 'FALSO', 0),
(21, 11, 'VERDADERO', 0),
(22, 11, 'FALSO', 1),
(23, 12, 'VERDADERO', 0),
(24, 12, 'FALSO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respvsusrs`
--

CREATE TABLE `respvsusrs` (
  `idrespvsusrs` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `pregunta` int(11) NOT NULL,
  `respuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usrvsprueba`
--

CREATE TABLE `usrvsprueba` (
  `id_usrvsprueba` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `prueba` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usrvsprueba`
--

INSERT INTO `usrvsprueba` (`id_usrvsprueba`, `usuario`, `prueba`) VALUES
(1, 456, 'NOM 35'),
(2, 457, 'NOM 17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apppat` varchar(50) NOT NULL,
  `appmat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apppat`, `appmat`) VALUES
(456, 'Francisco', 'León', ''),
(457, 'Guillermina', 'Pérez', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_respusrs`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_respusrs` (
`idrespvsusrs` int(11)
,`usuario` int(11)
,`pregunta` int(11)
,`respuesta` int(11)
,`id_respuestas` int(11)
,`enunciadorespuesta` varchar(45)
,`correcta` tinyint(1)
,`prueba` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_respusrs`
--
DROP TABLE IF EXISTS `view_respusrs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_respusrs`  AS   (select `a`.`idrespvsusrs` AS `idrespvsusrs`,`a`.`usuario` AS `usuario`,`a`.`pregunta` AS `pregunta`,`a`.`respuesta` AS `respuesta`,`b`.`id_respuestas` AS `id_respuestas`,`b`.`respuesta` AS `enunciadorespuesta`,`b`.`correcta` AS `correcta`,`c`.`prueba` AS `prueba` from ((`respvsusrs` `a` join `respuestas` `b`) join `preguntas` `c`) where `a`.`respuesta` = `b`.`id_respuestas` and `c`.`id_pregunta` = `b`.`pregunta`)  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `fk_prueba` (`prueba`);

--
-- Indices de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`id_usrvsprueba`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuestas`),
  ADD KEY `fk_pregunta` (`pregunta`);

--
-- Indices de la tabla `respvsusrs`
--
ALTER TABLE `respvsusrs`
  ADD PRIMARY KEY (`idrespvsusrs`);

--
-- Indices de la tabla `usrvsprueba`
--
ALTER TABLE `usrvsprueba`
  ADD PRIMARY KEY (`id_usrvsprueba`),
  ADD KEY `fk_usuario` (`usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `respvsusrs`
--
ALTER TABLE `respvsusrs`
  MODIFY `idrespvsusrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `usrvsprueba`
--
ALTER TABLE `usrvsprueba`
  MODIFY `id_usrvsprueba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_prueba` FOREIGN KEY (`prueba`) REFERENCES `pruebas` (`id_usrvsprueba`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_pregunta` FOREIGN KEY (`pregunta`) REFERENCES `preguntas` (`id_pregunta`);

--
-- Filtros para la tabla `usrvsprueba`
--
ALTER TABLE `usrvsprueba`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;