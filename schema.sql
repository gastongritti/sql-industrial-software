-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE mtdb;
USE mtdb;

-- Volcando estructura para tabla mtdb.config_terminales
CREATE TABLE IF NOT EXISTS `config_terminales` (
  `id_terminal` int NOT NULL,
  `denom_terminal` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip_servidor` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `usuario_servidor` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `contrasena_servidor` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `denom_bdd` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `fh_ult_sincro` datetime DEFAULT NULL,
  PRIMARY KEY (`id_terminal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Datos de cada terminal/estación de trabajo/pc.';

-- Volcando estructura para tabla mtdb.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `dni` char(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `contrasena` char(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `permisos` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Lista de usuarios (operarios y administradores).';

-- Volcando estructura para tabla mtdb.pprod_cortelad
CREATE TABLE IF NOT EXISTS `pprod_cortelad` (
  `id_pprod` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'LAx-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `total_hs` float DEFAULT NULL,
  `hs_parada_prog` float DEFAULT NULL,
  `hs_disponibles` float DEFAULT NULL,
  `hs_parada_no_prog` float DEFAULT NULL,
  `hs_operativas` float DEFAULT NULL,
  `disponibilidad` float DEFAULT NULL,
  `rendimiento` float DEFAULT NULL,
  `calidad` float DEFAULT NULL,
  `oee` float DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `maquina` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `cons_bloques` int DEFAULT NULL,
  `cons_tapas` int DEFAULT NULL,
  `cons_retazos` int DEFAULT NULL,
  `lad10conf` int DEFAULT NULL,
  `lad12conf` int DEFAULT NULL,
  `lad16conf` int DEFAULT NULL,
  `lad10nc` int DEFAULT NULL,
  `lad12nc` int DEFAULT NULL,
  `lad16nc` int DEFAULT NULL,
  PRIMARY KEY (`id_pprod`),
  KEY `FK_pprod_cortelad_config_terminales` (`id_terminal`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_pprod_cortelad_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Planillas de producción corte de ladrillos.';

-- Volcando estructura para tabla mtdb.bprod_cortelad
CREATE TABLE IF NOT EXISTS `bprod_cortelad` (
  `id_bprod` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'LAx-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `duracion` float DEFAULT NULL,
  `id_pprod` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `material_consumido` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `lad10est` int DEFAULT NULL,
  `lad12est` int DEFAULT NULL,
  `lad16est` int DEFAULT NULL,
  `lad10si` int DEFAULT NULL,
  `lad12si` int DEFAULT NULL,
  `lad16si` int DEFAULT NULL,
  `lad10perd` int DEFAULT NULL,
  `lad12perd` int DEFAULT NULL,
  `lad16perd` int DEFAULT NULL,
  `tapa_sobrante` int DEFAULT NULL,
  `retazos_sobrantes` int DEFAULT NULL,
  PRIMARY KEY (`id_bprod`),
  KEY `FK_bprod_cortelad_config_terminales` (`id_terminal`),
  KEY `id_pprod` (`id_pprod`),
  CONSTRAINT `FK_bprod_cortelad_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Batches de producción en corte de ladrillos. 1 batch es igual a 1 bloque o 1 ciclo.';

-- Volcando estructura para tabla mtdb.pprod_embolsado
CREATE TABLE IF NOT EXISTS `pprod_embolsado` (
  `id_pprod` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'EMx-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `total_hs` float DEFAULT NULL,
  `hs_parada_prog` float DEFAULT NULL,
  `hs_disponibles` float DEFAULT NULL,
  `hs_parada_no_prog` float DEFAULT NULL,
  `hs_operativas` float DEFAULT NULL,
  `disponibilidad` float DEFAULT NULL,
  `rendimiento` float DEFAULT NULL,
  `calidad` float DEFAULT NULL,
  `oee` float DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `producto` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `produccion` int DEFAULT NULL,
  PRIMARY KEY (`id_pprod`) USING BTREE,
  KEY `FK_pprod_embolsado_config_terminales` (`id_terminal`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_pprod_embolsado_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Planillas de producción de embolsado de alivianantes.';

-- Volcando estructura para tabla mtdb.pprod_inyeccion
CREATE TABLE IF NOT EXISTS `pprod_inyeccion` (
  `id_pprod` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'INx-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `total_hs` float DEFAULT NULL,
  `hs_parada_prog` float DEFAULT NULL,
  `hs_disponibles` float DEFAULT NULL,
  `hs_parada_no_prog` float DEFAULT NULL,
  `hs_operativas` float DEFAULT NULL,
  `disponibilidad` float DEFAULT NULL,
  `rendimiento` float DEFAULT NULL,
  `calidad` float DEFAULT NULL,
  `oee` float DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `maquina` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ciclos_inicio` int DEFAULT NULL,
  `ciclos_fin` int DEFAULT NULL,
  `total_ciclos` int DEFAULT NULL,
  `molde` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `produccion` int DEFAULT NULL,
  PRIMARY KEY (`id_pprod`) USING BTREE,
  KEY `FK_pprod_inyeccion_config_terminales` (`id_terminal`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_pprod_inyeccion_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Planillas de producción de inyección.';


-- Volcando estructura para tabla mtdb.paradas_no_prog
CREATE TABLE IF NOT EXISTS `paradas_no_prog` (
  `id_pnoprog` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'x-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_pprod` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `duracion` float DEFAULT NULL COMMENT 'En horas.',
  `motivo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_pnoprog`),
  KEY `id_pprod` (`id_pprod`),
  KEY `FK_paradas_no_prog_config_terminales` (`id_terminal`),
  CONSTRAINT `FK_paradas_no_prog_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Registra todas las paradas NO programadas asociadas a un ID de parte diario.';

-- Volcando estructura para tabla mtdb.paradas_prog
CREATE TABLE IF NOT EXISTS `paradas_prog` (
  `id_pprog` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'x-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_pprod` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `duracion` float DEFAULT NULL COMMENT 'En horas.',
  `motivo` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `comentarios` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_pprog`),
  KEY `id_pprod` (`id_pprod`),
  KEY `FK_paradas_prog_config_terminales` (`id_terminal`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_paradas_prog_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Registra todas las paradas programadas asociadas a un ID de parte diario.';

-- Volcando estructura para tabla mtdb.partes_de_trabajo
CREATE TABLE IF NOT EXISTS `partes_de_trabajo` (
  `id_ptrabajo` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'x-0000',
  `id_terminal` int DEFAULT NULL,
  `fh_creacion` datetime DEFAULT NULL,
  `fh_modificacion` datetime DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_pprod` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `fh_inicio` datetime DEFAULT NULL,
  `fh_fin` datetime DEFAULT NULL,
  `actividad` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `duracion` float DEFAULT NULL COMMENT 'En horas.',
  `comentarios` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_ptrabajo`),
  KEY `FK_partes_de_trabajo_config_terminales` (`id_terminal`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_pprod` (`id_pprod`),
  CONSTRAINT `FK_partes_de_trabajo_config_terminales` FOREIGN KEY (`id_terminal`) REFERENCES `config_terminales` (`id_terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Registra todas las actividades auxiliares o de servicio realizadas dentro de un parte diario.';
