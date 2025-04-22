-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2025 a las 18:01:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `homologacion_db`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAsignatura` (IN `p_id_asignatura` INT, IN `p_programa_id` INT, IN `p_nombre` VARCHAR(255), IN `p_tipo` ENUM('Materia','Competencia'), IN `p_codigo_asignatura` VARCHAR(30), IN `p_creditos` INT, IN `p_semestre` INT, IN `p_horas_sena` INT, IN `p_tiempo_presencial` INT, IN `p_tiempo_independiente` INT, IN `p_horas_totales_semanales` INT, IN `p_modalidad` ENUM('Teórico','Práctico','Teórico-Práctico'), IN `p_metodologia` ENUM('Presencial','Virtual','Híbrido'))   BEGIN
                UPDATE asignaturas
                SET programa_id = p_programa_id,
                    nombre = p_nombre,
                    tipo = p_tipo,
                    codigo_asignatura = p_codigo_asignatura,
                    creditos = p_creditos,
                    semestre = p_semestre,
                    horas_sena = p_horas_sena,
                    tiempo_presencial = p_tiempo_presencial,
                    tiempo_independiente = p_tiempo_independiente,
                    horas_totales_semanales = p_horas_totales_semanales,
                    modalidad = p_modalidad,
                    metodologia = p_metodologia,
                    updated_at = NOW()
                WHERE id_asignatura = p_id_asignatura;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContenidoProgramatico` (IN `contenidoId` INT, IN `p_asignatura_id` INT, IN `p_tema` VARCHAR(255), IN `p_resultados_aprendizaje` TEXT, IN `p_descripcion` TEXT)   BEGIN
                UPDATE contenidos_programaticos
                SET asignatura_id = p_asignatura_id,
                    tema = p_tema,
                    resultados_aprendizaje = p_resultados_aprendizaje,
                    descripcion = p_descripcion,
                    updated_at = NOW()
                WHERE id_contenido = contenidoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDepartamento` (IN `departamentoId` INT, IN `nombreDepartamento` VARCHAR(255), IN `paisId` INT)   BEGIN
                UPDATE departamentos
                SET nombre = nombreDepartamento, pais_id = paisId
                WHERE id_departamento = departamentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumento` (IN `documentoId` INT, IN `p_solicitud_id` INT, IN `p_usuario_id` INT, IN `p_tipo` VARCHAR(255), IN `p_ruta` VARCHAR(255))   BEGIN
                UPDATE documents
                SET solicitud_id = p_solicitud_id,
                    usuario_id = p_usuario_id,
                    tipo = p_tipo,
                    ruta = p_ruta,
                    updated_at = NOW()
                WHERE id_documento = documentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFacultad` (IN `facultadId` INT, IN `p_institucion_id` INT, IN `p_nombre` VARCHAR(255))   BEGIN
                UPDATE faculties
                SET institucion_id = p_institucion_id,
                    nombre = p_nombre,
                    updated_at = NOW()
                WHERE id_facultad = facultadId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHistorialHomologacion` (IN `historialId` INT, IN `p_solicitud_id` INT, IN `p_usuario_id` INT, IN `p_estado` VARCHAR(20), IN `p_observaciones` TEXT, IN `p_ruta_pdf_resolucion` VARCHAR(255))   BEGIN
                UPDATE historial_homologaciones
                SET solicitud_id = p_solicitud_id,
                    usuario_id = p_usuario_id,
                    estado = p_estado,
                    observaciones = p_observaciones,
                    ruta_pdf_resolucion = p_ruta_pdf_resolucion,
                    updated_at = NOW()
                WHERE id_historial = historialId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHomologacionAsignatura` (IN `p_id_homologacion` INT, IN `p_solicitud_id` INT, IN `p_asignatura_origen_id` INT, IN `p_asignatura_destino_id` INT, IN `p_nota_origen` DECIMAL(3,1), IN `p_horas_sena` DECIMAL(3,1), IN `p_nota_destino` DECIMAL(3,1), IN `p_comentarios` TEXT)   BEGIN
                UPDATE homologacion_asignaturas
                SET
                    solicitud_id = p_solicitud_id,
                    asignatura_origen_id = p_asignatura_origen_id,
                    asignatura_destino_id = p_asignatura_destino_id,
                    nota_origen = p_nota_origen,
                    horas_sena = p_horas_sena,
                    nota_destino = p_nota_destino,
                    comentarios = p_comentarios,
                    updated_at = NOW()
                WHERE id_homologacion = p_id_homologacion;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarInstitucion` (IN `institucionId` INT, IN `p_nombre` VARCHAR(255), IN `p_codigo_ies` VARCHAR(50), IN `p_municipio_id` INT, IN `p_tipo` VARCHAR(50))   BEGIN
                UPDATE instituciones
                SET nombre = p_nombre,
                    codigo_ies = p_codigo_ies,
                    municipio_id = p_municipio_id,
                    tipo = p_tipo
                WHERE id_institucion = institucionId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMunicipio` (IN `municipioId` INT, IN `nombreMunicipio` VARCHAR(255), IN `departamentoId` INT)   BEGIN
                UPDATE municipios
                SET nombre = nombreMunicipio, departamento_id = departamentoId
                WHERE id_municipio = municipioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPais` (IN `paisId` INT, IN `nombrePais` VARCHAR(100))   BEGIN
                UPDATE paises SET nombre = nombrePais WHERE id_pais = paisId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPrograma` (IN `programaId` INT, IN `p_institucion_id` INT, IN `p_facultad_id` INT, IN `p_nombre` VARCHAR(255), IN `p_codigo_snies` VARCHAR(20), IN `p_tipo_formacion` ENUM('Técnico','Tecnólogo','Profesional'), IN `p_metodologia` ENUM('Presencial','Virtual','Híbrido'))   BEGIN
                UPDATE programas
                SET institucion_id = p_institucion_id,
                    facultad_id = p_facultad_id,
                    nombre = p_nombre,
                    codigo_snies = p_codigo_snies,
                    tipo_formacion = p_tipo_formacion,
                    metodologia = p_metodologia
                WHERE id_programa = programaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRol` (IN `rolId` INT, IN `p_nombre` VARCHAR(50))   BEGIN
                UPDATE roles
                SET nombre = p_nombre,
                    updated_at = NOW()
                WHERE id_rol = rolId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSolicitud` (IN `p_id_solicitud` SMALLINT, IN `p_usuario_id` SMALLINT, IN `p_programa_destino_id` SMALLINT, IN `p_finalizo_estudios` ENUM('Si','No'), IN `p_fecha_finalizacion_estudios` DATE, IN `p_fecha_ultimo_semestre_cursado` DATE, IN `p_estado` ENUM('Radicado','En revisión','Aprobado','Rechazado','Cerrado'), IN `p_numero_radicado` VARCHAR(50), IN `p_ruta_pdf_resolucion` VARCHAR(255))   BEGIN
                UPDATE solicitudes
                SET
                    usuario_id = p_usuario_id,
                    programa_destino_id = p_programa_destino_id,
                    finalizo_estudios = p_finalizo_estudios,
                    fecha_finalizacion_estudios = p_fecha_finalizacion_estudios,
                    fecha_ultimo_semestre_cursado = p_fecha_ultimo_semestre_cursado,
                    estado = p_estado,
                    numero_radicado = p_numero_radicado,
                    ruta_pdf_resolucion = p_ruta_pdf_resolucion,
                    updated_at = NOW()
                WHERE id_solicitud = p_id_solicitud;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSolicitudAsignatura` (IN `solicitudAsignaturaId` INT, IN `p_solicitud_id` INT, IN `p_asignatura_id` INT, IN `p_nota_origen` DECIMAL(3,1), IN `p_horas_sena` INT)   BEGIN
                UPDATE solicitud_asignaturas
                SET solicitud_id = p_solicitud_id,
                    asignatura_id = p_asignatura_id,
                    nota_origen = p_nota_origen,
                    horas_sena = p_horas_sena,
                    updated_at = NOW()
                WHERE id_solicitud_asignatura = solicitudAsignaturaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario` (IN `usuarioId` INT, IN `p_primer_nombre` VARCHAR(50), IN `p_segundo_nombre` VARCHAR(50), IN `p_primer_apellido` VARCHAR(50), IN `p_segundo_apellido` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_tipo_identificacion` ENUM('Tarjeta de Identidad','Cédula de Ciudadanía','Cédula de Extranjería'), IN `p_numero_identificacion` VARCHAR(20), IN `p_institucion_origen_id` INT, IN `p_facultad_id` INT, IN `p_telefono` VARCHAR(20), IN `p_direccion` VARCHAR(255), IN `p_pais_id` INT, IN `p_departamento_id` INT, IN `p_municipio_id` INT, IN `p_rol_id` INT, IN `p_activo` BOOLEAN)   BEGIN
                UPDATE users
                SET primer_nombre = p_primer_nombre,
                    segundo_nombre = p_segundo_nombre,
                    primer_apellido = p_primer_apellido,
                    segundo_apellido = p_segundo_apellido,
                    email = p_email,
                    password = IFNULL(p_password, password), -- solo se actualiza si viene valor
                    tipo_identificacion = p_tipo_identificacion,
                    numero_identificacion = p_numero_identificacion,
                    institucion_origen_id = p_institucion_origen_id,
                    facultad_id = p_facultad_id,
                    telefono = p_telefono,
                    direccion = p_direccion,
                    pais_id = p_pais_id,
                    departamento_id = p_departamento_id,
                    municipio_id = p_municipio_id,
                    rol_id = p_rol_id,
                    activo = p_activo,
                    updated_at = NOW()
                WHERE id_usuario = usuarioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAsignatura` (IN `asignaturaId` INT)   BEGIN
                DELETE FROM asignaturas WHERE id_asignatura = asignaturaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarContenidoProgramatico` (IN `contenidoId` INT)   BEGIN
                DELETE FROM contenidos_programaticos WHERE id_contenido = contenidoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento` (IN `departamentoId` INT)   BEGIN
                DELETE FROM departamentos WHERE id_departamento = departamentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDocumento` (IN `documentoId` INT)   BEGIN
                DELETE FROM documents WHERE id_documento = documentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFacultad` (IN `facultadId` INT)   BEGIN
                DELETE FROM faculties WHERE id_facultad = facultadId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHistorialHomologacion` (IN `historialId` INT)   BEGIN
                DELETE FROM historial_homologaciones WHERE id_historial = historialId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHomologacionAsignatura` (IN `homologacionId` INT)   BEGIN
                DELETE FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarInstitucion` (IN `institucionId` INT)   BEGIN
                DELETE FROM instituciones WHERE id_institucion = institucionId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio` (IN `municipioId` INT)   BEGIN
                DELETE FROM municipios WHERE id_municipio = municipioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPais` (IN `paisId` INT)   BEGIN
                DELETE FROM paises WHERE id_pais = paisId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPrograma` (IN `programaId` INT)   BEGIN
                DELETE FROM programas WHERE id_programa = programaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRol` (IN `rolId` INT)   BEGIN
                DELETE FROM roles WHERE id_rol = rolId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitud` (IN `p_id_solicitud` SMALLINT)   BEGIN
                DELETE FROM solicitudes WHERE id_solicitud = p_id_solicitud;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitudAsignatura` (IN `solicitudAsignaturaId` INT)   BEGIN
                DELETE FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario` (IN `usuarioId` INT)   BEGIN
                DELETE FROM users WHERE id_usuario = usuarioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura` (IN `p_programa_id` INT, IN `p_nombre` VARCHAR(255), IN `p_tipo` ENUM('Materia','Competencia'), IN `p_codigo_asignatura` VARCHAR(30), IN `p_creditos` INT, IN `p_semestre` INT, IN `p_horas_sena` INT, IN `p_tiempo_presencial` INT, IN `p_tiempo_independiente` INT, IN `p_horas_totales_semanales` INT, IN `p_modalidad` ENUM('Teórico','Práctico','Teórico-Práctico'), IN `p_metodologia` ENUM('Presencial','Virtual','Híbrido'))   BEGIN
                INSERT INTO asignaturas (
                    programa_id,
                    nombre,
                    tipo,
                    codigo_asignatura,
                    creditos,
                    semestre,
                    horas_sena,
                    tiempo_presencial,
                    tiempo_independiente,
                    horas_totales_semanales,
                    modalidad,
                    metodologia,
                    created_at,
                    updated_at
                ) VALUES (
                    p_programa_id,
                    p_nombre,
                    p_tipo,
                    p_codigo_asignatura,
                    p_creditos,
                    p_semestre,
                    p_horas_sena,
                    p_tiempo_presencial,
                    p_tiempo_independiente,
                    p_horas_totales_semanales,
                    p_modalidad,
                    p_metodologia,
                    NOW(),
                    NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarContenidoProgramatico` (IN `p_asignatura_id` INT, IN `p_tema` VARCHAR(255), IN `p_resultados_aprendizaje` TEXT, IN `p_descripcion` TEXT)   BEGIN
                INSERT INTO contenidos_programaticos (
                    asignatura_id, tema, resultados_aprendizaje, descripcion, created_at, updated_at
                )
                VALUES (
                    p_asignatura_id, p_tema, p_resultados_aprendizaje, p_descripcion, NOW(), NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDepartamento` (IN `nombreDepartamento` VARCHAR(255), IN `paisId` INT)   BEGIN
                INSERT INTO departamentos (nombre, pais_id)
                VALUES (nombreDepartamento, paisId);
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDocumento` (IN `p_solicitud_id` INT, IN `p_usuario_id` INT, IN `p_tipo` VARCHAR(255), IN `p_ruta` VARCHAR(255))   BEGIN
                INSERT INTO documents (
                    solicitud_id, usuario_id, tipo, ruta, fecha_subida,
                    created_at, updated_at
                )
                VALUES (
                    p_solicitud_id, p_usuario_id, p_tipo, p_ruta, NOW(),
                    NOW(), NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacultad` (IN `p_institucion_id` INT, IN `p_nombre` VARCHAR(255))   BEGIN
                INSERT INTO faculties (institucion_id, nombre, created_at, updated_at)
                VALUES (p_institucion_id, p_nombre, NOW(), NOW());
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHistorialHomologacion` (IN `p_solicitud_id` INT, IN `p_usuario_id` INT, IN `p_estado` VARCHAR(20), IN `p_observaciones` TEXT, IN `p_ruta_pdf_resolucion` VARCHAR(255))   BEGIN
                INSERT INTO historial_homologaciones (
                    solicitud_id, usuario_id, estado, fecha, observaciones, ruta_pdf_resolucion, created_at, updated_at
                )
                VALUES (
                    p_solicitud_id, p_usuario_id, p_estado, NOW(), p_observaciones, p_ruta_pdf_resolucion, NOW(), NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHomologacionAsignatura` (IN `p_solicitud_id` INT, IN `p_asignatura_origen_id` INT, IN `p_asignatura_destino_id` INT, IN `p_nota_origen` DECIMAL(3,1), IN `p_horas_sena` INT, IN `p_nota_destino` DECIMAL(3,1), IN `p_comentarios` TEXT)   BEGIN
                INSERT INTO homologacion_asignaturas (
                    solicitud_id,
                    asignatura_origen_id,
                    asignatura_destino_id,
                    nota_origen,
                    horas_sena,
                    nota_destino,
                    comentarios,
                    created_at,
                    updated_at
                ) VALUES (
                    p_solicitud_id,
                    p_asignatura_origen_id,
                    p_asignatura_destino_id,
                    p_nota_origen,
                    p_horas_sena,
                    p_nota_destino,
                    p_comentarios,
                    NOW(),
                    NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarInstitucion` (IN `nombreInstitucion` VARCHAR(255), IN `codigoIes` VARCHAR(20), IN `municipioId` INT, IN `tipoInstitucion` VARCHAR(100))   BEGIN
                INSERT INTO instituciones (nombre, codigo_ies, municipio_id, tipo)
                VALUES (nombreInstitucion, codigoIes, municipioId, tipoInstitucion);
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio` (IN `nombreMunicipio` VARCHAR(255), IN `departamentoId` INT)   BEGIN
                INSERT INTO municipios (nombre, departamento_id)
                VALUES (nombreMunicipio, departamentoId);
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPais` (IN `nombrePais` VARCHAR(100))   BEGIN
                INSERT INTO paises (nombre) VALUES (nombrePais);
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPrograma` (IN `p_institucion_id` INT, IN `p_facultad_id` INT, IN `p_nombre` VARCHAR(255), IN `p_codigo_snies` VARCHAR(20), IN `p_tipo_formacion` ENUM('Técnico','Tecnólogo','Profesional'), IN `p_metodologia` ENUM('Presencial','Virtual','Híbrido'))   BEGIN
                INSERT INTO programas (institucion_id, facultad_id, nombre, codigo_snies, tipo_formacion, metodologia)
                VALUES (p_institucion_id, p_facultad_id, p_nombre, p_codigo_snies, p_tipo_formacion, p_metodologia);
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRol` (IN `p_nombre` VARCHAR(50))   BEGIN
                INSERT INTO roles (nombre, created_at, updated_at)
                VALUES (p_nombre, NOW(), NOW());
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSolicitud` (IN `p_usuario_id` SMALLINT, IN `p_programa_destino_id` SMALLINT, IN `p_finalizo_estudios` ENUM('Si','No'), IN `p_fecha_finalizacion_estudios` DATE, IN `p_fecha_ultimo_semestre_cursado` DATE, IN `p_estado` ENUM('Radicado','En revisión','Aprobado','Rechazado','Cerrado'), IN `p_numero_radicado` VARCHAR(50), IN `p_ruta_pdf_resolucion` VARCHAR(255))   BEGIN
                INSERT INTO solicitudes (
                    usuario_id,
                    programa_destino_id,
                    finalizo_estudios,
                    fecha_finalizacion_estudios,
                    fecha_ultimo_semestre_cursado,
                    estado,
                    numero_radicado,
                    ruta_pdf_resolucion,
                    created_at,
                    updated_at
                ) VALUES (
                    p_usuario_id,
                    p_programa_destino_id,
                    p_finalizo_estudios,
                    p_fecha_finalizacion_estudios,
                    p_fecha_ultimo_semestre_cursado,
                    p_estado,
                    p_numero_radicado,
                    p_ruta_pdf_resolucion,
                    NOW(),
                    NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSolicitudAsignatura` (IN `p_solicitud_id` INT, IN `p_asignatura_id` INT, IN `p_nota_origen` DECIMAL(3,1), IN `p_horas_sena` INT)   BEGIN
                INSERT INTO solicitud_asignaturas (
                    solicitud_id, asignatura_id, nota_origen, horas_sena, created_at, updated_at
                )
                VALUES (
                    p_solicitud_id, p_asignatura_id, p_nota_origen, p_horas_sena, NOW(), NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario` (IN `p_primer_nombre` VARCHAR(50), IN `p_segundo_nombre` VARCHAR(50), IN `p_primer_apellido` VARCHAR(50), IN `p_segundo_apellido` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_tipo_identificacion` ENUM('Tarjeta de Identidad','Cédula de Ciudadanía','Cédula de Extranjería'), IN `p_numero_identificacion` VARCHAR(20), IN `p_institucion_origen_id` INT, IN `p_facultad_id` INT, IN `p_telefono` VARCHAR(20), IN `p_direccion` VARCHAR(255), IN `p_pais_id` INT, IN `p_departamento_id` INT, IN `p_municipio_id` INT, IN `p_rol_id` INT, IN `p_activo` BOOLEAN)   BEGIN
                INSERT INTO users (
                    primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
                    email, password, tipo_identificacion, numero_identificacion,
                    institucion_origen_id, facultad_id, telefono, direccion,
                    pais_id, departamento_id, municipio_id, rol_id,
                    activo, created_at, updated_at
                )
                VALUES (
                    p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido,
                    p_email, p_password, p_tipo_identificacion, p_numero_identificacion,
                    p_institucion_origen_id, p_facultad_id, p_telefono, p_direccion,
                    p_pais_id, p_departamento_id, p_municipio_id, p_rol_id,
                    p_activo, NOW(), NOW()
                );
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturaPorId` (IN `asignaturaId` INT)   BEGIN
    SELECT a.id_asignatura,
           a.nombre,
           a.tipo,
           a.codigo_asignatura,
           a.creditos,
           a.semestre,
           a.horas_sena,
           a.tiempo_presencial,
           a.tiempo_independiente,
           a.horas_totales_semanales,
           a.modalidad,
           a.metodologia,
           a.created_at,
           a.updated_at,
           p.nombre AS programa,
           i.nombre AS institucion
    FROM asignaturas a
    JOIN programas p ON a.programa_id = p.id_programa
    JOIN instituciones i ON p.institucion_id = i.id_institucion
    WHERE a.id_asignatura = asignaturaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturas` ()   BEGIN
    SELECT a.id_asignatura,
           a.nombre,
           a.tipo,
           a.codigo_asignatura,
           a.creditos,
           a.semestre,
           a.horas_sena,
           a.tiempo_presencial,
           a.tiempo_independiente,
           a.horas_totales_semanales,
           a.modalidad,
           a.metodologia,
           a.created_at,
           a.updated_at,
           p.nombre AS programa,
           i.nombre AS institucion
    FROM asignaturas a
    JOIN programas p ON a.programa_id = p.id_programa
    JOIN instituciones i ON p.institucion_id = i.id_institucion
    ORDER BY a.nombre ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidoProgramaticoPorId` (IN `contenidoId` INT)   BEGIN
                SELECT
                    cp.id_contenido,
                    cp.tema,
                    cp.resultados_aprendizaje,
                    cp.descripcion,
                    a.nombre AS nombre_asignatura,
                    cp.created_at,
                    cp.updated_at
                FROM contenidos_programaticos cp
                INNER JOIN asignaturas a ON cp.asignatura_id = a.id_asignatura
                WHERE cp.id_contenido = contenidoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidosProgramaticos` ()   BEGIN
                SELECT
                    cp.id_contenido,
                    cp.tema,
                    cp.resultados_aprendizaje,
                    cp.descripcion,
                    a.nombre AS nombre_asignatura,
                    cp.created_at,
                    cp.updated_at
                FROM contenidos_programaticos cp
                INNER JOIN asignaturas a ON cp.asignatura_id = a.id_asignatura
                ORDER BY cp.tema ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentoPorId` (IN `departamentoId` INT)   BEGIN
                SELECT d.id_departamento, d.nombre AS departamento, p.nombre AS pais
                FROM departamentos d
                JOIN paises p ON d.pais_id = p.id_pais
                WHERE d.id_departamento = departamentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentos` ()   BEGIN
                SELECT d.id_departamento, d.nombre AS departamento, p.nombre AS pais
                FROM departamentos d
                JOIN paises p ON d.pais_id = p.id_pais
                ORDER BY d.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoPorId` (IN `documentoId` INT)   BEGIN
                SELECT
                    d.id_documento,
                    CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
                    s.id_solicitud,
                    d.tipo,
                    d.ruta,
                    d.fecha_subida,
                    d.created_at,
                    d.updated_at
                FROM documents d
                LEFT JOIN users u ON d.usuario_id = u.id_usuario
                LEFT JOIN solicitudes s ON d.solicitud_id = s.id_solicitud
                WHERE d.id_documento = documentoId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentos` ()   BEGIN
                SELECT
                    d.id_documento,
                    CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
                    s.id_solicitud,
                    d.tipo,
                    d.ruta,
                    d.fecha_subida,
                    d.created_at,
                    d.updated_at
                FROM documents d
                LEFT JOIN users u ON d.usuario_id = u.id_usuario
                LEFT JOIN solicitudes s ON d.solicitud_id = s.id_solicitud
                ORDER BY d.fecha_subida DESC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultades` ()   BEGIN
                SELECT
                    f.id_facultad,
                    i.nombre AS institucion,
                    f.nombre,
                    f.created_at,
                    f.updated_at
                FROM faculties f
                LEFT JOIN institutions i ON f.institucion_id = i.id_institucion
                ORDER BY f.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultadPorId` (IN `facultadId` INT)   BEGIN
                SELECT
                    f.id_facultad,
                    i.nombre AS institucion,
                    f.nombre,
                    f.created_at,
                    f.updated_at
                FROM faculties f
                LEFT JOIN institutions i ON f.institucion_id = i.id_institucion
                WHERE f.id_facultad = facultadId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHistorialHomologaciones` ()   BEGIN
                SELECT
                    hh.id_historial,
                    hh.estado AS estado_historial,
                    hh.fecha,
                    hh.observaciones,
                    hh.ruta_pdf_resolucion,

                    s.id_solicitud,
                    s.numero_radicado,
                    s.estado AS estado_solicitud,
                    s.fecha_solicitud,
                    s.finalizo_estudios,
                    prog.nombre AS nombre_programa_destino,

                    u.id_usuario,
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,

                    p.nombre AS pais_nombre,
                    d.nombre AS departamento_nombre,
                    m.nombre AS municipio_nombre,
                    i.nombre AS institucion_origen_nombre

                FROM historial_homologaciones hh
                INNER JOIN solicitudes s ON hh.solicitud_id = s.id_solicitud
                INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
                INNER JOIN users u ON hh.usuario_id = u.id_usuario
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHistorialHomologacionPorId` (IN `p_id` INT)   BEGIN
                SELECT
                    hh.id_historial,
                    hh.estado AS estado_historial,
                    hh.fecha,
                    hh.observaciones,
                    hh.ruta_pdf_resolucion,

                    s.id_solicitud,
                    s.numero_radicado,
                    s.estado AS estado_solicitud,
                    s.fecha_solicitud,
                    s.finalizo_estudios,
                    s.fecha_finalizacion_estudios,
                    s.fecha_ultimo_semestre_cursado,
                    s.ruta_pdf_resolucion AS resolucion_solicitud,
                    prog.nombre AS nombre_programa_destino,

                    u.id_usuario,
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,
                    u.tipo_identificacion,
                    u.numero_identificacion,
                    u.telefono,
                    u.direccion,

                    p.nombre AS pais_nombre,
                    d.nombre AS departamento_nombre,
                    m.nombre AS municipio_nombre,
                    i.nombre AS institucion_origen_nombre

                FROM historial_homologaciones hh
                INNER JOIN solicitudes s ON hh.solicitud_id = s.id_solicitud
                INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
                INNER JOIN users u ON hh.usuario_id = u.id_usuario
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
                WHERE hh.id_historial = p_id;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionAsignaturaPorId` (IN `homologacionId` INT)   BEGIN
                SELECT
                    ha.id_homologacion,
                    ha.solicitud_id,

                    -- Origen
                    ao.id_asignatura   AS asignatura_origen_id,
                    ao.nombre          AS asignatura_origen,
                    i_origen.nombre    AS institucion_origen,

                    -- Destino
                    ad.id_asignatura   AS asignatura_destino_id,
                    ad.nombre          AS asignatura_destino,
                    i_destino.nombre   AS institucion_destino,

                    sa.nota_origen,
                    sa.horas_sena,
                    ha.nota_destino,
                    ha.fecha,
                    ha.comentarios,
                    ha.created_at,
                    ha.updated_at,

                    CONCAT(
                    u.primer_nombre, ' ',
                    IFNULL(u.segundo_nombre, ''), ' ',
                    u.primer_apellido, ' ',
                    IFNULL(u.segundo_apellido, '')
                    ) AS estudiante

                FROM homologacion_asignaturas ha
                JOIN asignaturas ao ON ha.asignatura_origen_id  = ao.id_asignatura
                JOIN asignaturas ad ON ha.asignatura_destino_id = ad.id_asignatura
                JOIN solicitudes      s ON ha.solicitud_id       = s.id_solicitud
                JOIN users            u ON s.usuario_id         = u.id_usuario
                LEFT JOIN solicitud_asignaturas sa
                    ON sa.solicitud_id = ha.solicitud_id
                    AND sa.asignatura_id = ha.asignatura_origen_id

                LEFT JOIN programas   po ON ao.programa_id       = po.id_programa
                LEFT JOIN instituciones i_origen
                    ON po.institucion_id = i_origen.id_institucion

                LEFT JOIN programas   pd ON ad.programa_id       = pd.id_programa
                LEFT JOIN instituciones i_destino
                    ON pd.institucion_id = i_destino.id_institucion

                WHERE ha.id_homologacion = homologacionId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionesAsignaturas` ()   BEGIN
                SELECT
                    ha.id_homologacion,
                    ha.solicitud_id,

                    -- Asignatura origen
                    ao.id_asignatura   AS asignatura_origen_id,
                    ao.nombre          AS asignatura_origen,
                    i_origen.nombre    AS institucion_origen,   -- Universidad de la asignatura origen

                    -- Asignatura destino
                    ad.id_asignatura   AS asignatura_destino_id,
                    ad.nombre          AS asignatura_destino,
                    i_destino.nombre   AS institucion_destino,  -- Universidad de la asignatura destino

                    -- Nota y horas desde solicitud_asignaturas
                    sa.nota_origen,
                    sa.horas_sena,

                    -- Nota destino
                    ha.nota_destino,

                    -- Datos adicionales
                    ha.fecha,
                    ha.comentarios,
                    ha.created_at,
                    ha.updated_at,

                    -- Estudiante
                    CONCAT(
                    u.primer_nombre, ' ',
                    IFNULL(u.segundo_nombre, ''), ' ',
                    u.primer_apellido, ' ',
                    IFNULL(u.segundo_apellido, '')
                    ) AS estudiante

                FROM homologacion_asignaturas ha
                JOIN asignaturas ao ON ha.asignatura_origen_id  = ao.id_asignatura
                JOIN asignaturas ad ON ha.asignatura_destino_id = ad.id_asignatura
                JOIN solicitudes      s ON ha.solicitud_id       = s.id_solicitud
                JOIN users            u ON s.usuario_id         = u.id_usuario
                LEFT JOIN solicitud_asignaturas sa
                    ON sa.solicitud_id = ha.solicitud_id
                    AND sa.asignatura_id = ha.asignatura_origen_id

                -- Para origen: asignatura → programa → institución
                LEFT JOIN programas   po ON ao.programa_id       = po.id_programa
                LEFT JOIN instituciones i_origen
                    ON po.institucion_id = i_origen.id_institucion

                -- Para destino: asignatura → programa → institución
                LEFT JOIN programas   pd ON ad.programa_id       = pd.id_programa
                LEFT JOIN instituciones i_destino
                    ON pd.institucion_id = i_destino.id_institucion

                ORDER BY ha.id_homologacion ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstituciones` ()   BEGIN
                SELECT i.id_institucion,
                       i.nombre,
                       i.codigo_ies,
                       m.nombre AS municipio,
                       d.nombre AS departamento,
                       i.tipo
                FROM instituciones i
                JOIN municipios m ON i.municipio_id = m.id_municipio
                JOIN departamentos d ON m.departamento_id = d.id_departamento
                ORDER BY i.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstitucionPorId` (IN `institucionId` INT)   BEGIN
                SELECT i.id_institucion,
                       i.nombre,
                       i.codigo_ies,
                       m.nombre AS municipio,
                       d.nombre AS departamento,
                       i.tipo
                FROM instituciones i
                JOIN municipios m ON i.municipio_id = m.id_municipio
                JOIN departamentos d ON m.departamento_id = d.id_departamento
                WHERE i.id_institucion = institucionId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipioPorId` (IN `municipioId` INT)   BEGIN
                SELECT m.id_municipio, m.nombre AS municipio, d.nombre AS departamento, p.nombre AS pais
                FROM municipios m
                JOIN departamentos d ON m.departamento_id = d.id_departamento
                JOIN paises p ON d.pais_id = p.id_pais
                WHERE m.id_municipio = municipioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipios` ()   BEGIN
                SELECT m.id_municipio, m.nombre AS municipio, d.nombre AS departamento, p.nombre AS pais
                FROM municipios m
                JOIN departamentos d ON m.departamento_id = d.id_departamento
                JOIN paises p ON d.pais_id = p.id_pais
                ORDER BY m.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaises` ()   BEGIN
                SELECT p.id_pais, p.nombre AS pais
                FROM paises p
                ORDER BY p.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaisPorId` (IN `paisId` INT)   BEGIN
                SELECT p.id_pais, p.nombre AS pais
                FROM paises p
                WHERE p.id_pais = paisId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramaPorId` (IN `programaId` INT)   BEGIN
                SELECT pr.id_programa,
                       pr.nombre AS programa,
                       i.nombre AS institucion,
                       pr.codigo_snies,
                       pr.tipo_formacion,
                       pr.metodologia
                FROM programas pr
                JOIN instituciones i ON pr.institucion_id = i.id_institucion
                WHERE pr.id_programa = programaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramas` ()   BEGIN
                SELECT pr.id_programa,
                       pr.nombre AS programa,
                       i.nombre AS institucion,
                       pr.codigo_snies,
                       pr.tipo_formacion,
                       pr.metodologia
                FROM programas pr
                JOIN instituciones i ON pr.institucion_id = i.id_institucion
                ORDER BY pr.nombre ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRoles` ()   BEGIN
                SELECT * FROM roles ORDER BY id_rol ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRolPorId` (IN `rolId` INT)   BEGIN
                SELECT * FROM roles WHERE id_rol = rolId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturaPorId` (IN `solicitudAsignaturaId` INT)   BEGIN
                SELECT
                    sa.id_solicitud_asignatura,
                    s.id_solicitud,
                    CONCAT(u.primer_nombre, ' ', u.primer_apellido)       AS estudiante,
                    i.nombre                                              AS institucion,
                    a.nombre                                              AS asignatura,
                    a.codigo_asignatura         AS codigo_asignatura,
                    sa.nota_origen,
                    sa.horas_sena                  AS horas_sena,
                    sa.created_at,
                    sa.updated_at
                FROM solicitud_asignaturas sa
                LEFT JOIN solicitudes       s ON sa.solicitud_id        = s.id_solicitud
                LEFT JOIN users          u ON s.usuario_id           = u.id_usuario
                LEFT JOIN asignaturas       a ON sa.asignatura_id       = a.id_asignatura
                LEFT JOIN programas         p ON a.programa_id          = p.id_programa
                LEFT JOIN instituciones     i ON p.institucion_id       = i.id_institucion
                WHERE sa.id_solicitud_asignatura = solicitudAsignaturaId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturas` ()   BEGIN
                SELECT
                    sa.id_solicitud_asignatura,
                    s.id_solicitud,
                    CONCAT(u.primer_nombre, ' ', u.primer_apellido)       AS estudiante,
                    i.nombre                                              AS institucion,
                    a.nombre                                              AS asignatura,
                    a.codigo_asignatura         AS codigo_asignatura,
                    sa.nota_origen,
                    sa.horas_sena                  AS horas_sena,
                    sa.created_at,
                    sa.updated_at
                FROM solicitud_asignaturas sa
                LEFT JOIN solicitudes       s ON sa.solicitud_id        = s.id_solicitud
                LEFT JOIN users          u ON s.usuario_id           = u.id_usuario
                LEFT JOIN asignaturas       a ON sa.asignatura_id       = a.id_asignatura
                LEFT JOIN programas         p ON a.programa_id          = p.id_programa
                LEFT JOIN instituciones     i ON p.institucion_id       = i.id_institucion
                ORDER BY sa.id_solicitud_asignatura ASC;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudes` ()   BEGIN
                SELECT
                    s.id_solicitud,
                    s.usuario_id,
                    s.finalizo_estudios,
                    s.fecha_finalizacion_estudios,
                    s.fecha_ultimo_semestre_cursado,
                    s.fecha_solicitud,
                    s.estado,
                    s.numero_radicado,
                    s.ruta_pdf_resolucion AS pdf_resolucion,

                    -- Datos del programa destino
                    prog.nombre AS programa_destino_nombre,

                    -- Datos del usuario
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,
                    u.tipo_identificacion,
                    u.numero_identificacion,
                    u.telefono,
                    u.direccion,

                    -- Nombres en vez de IDs
                    p.nombre AS pais_nombre,
                    d.nombre AS departamento_nombre,
                    m.nombre AS municipio_nombre,
                    inst.nombre AS institucion_origen_nombre

                FROM solicitudes s
                INNER JOIN users u ON s.usuario_id = u.id_usuario
                INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                LEFT JOIN instituciones inst ON u.institucion_origen_id = inst.id_institucion;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudPorId` (IN `p_id_solicitud` SMALLINT)   BEGIN
                SELECT
                    s.id_solicitud,
                    s.usuario_id,
                    s.finalizo_estudios,
                    s.fecha_finalizacion_estudios,
                    s.fecha_ultimo_semestre_cursado,
                    s.fecha_solicitud,
                    s.estado,
                    s.numero_radicado,
                    s.ruta_pdf_resolucion AS pdf_resolucion,

                    -- Datos del programa destino
                    prog.nombre AS programa_destino_nombre,

                    -- Datos del usuario
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,
                    u.tipo_identificacion,
                    u.numero_identificacion,
                    u.telefono,
                    u.direccion,

                    -- Nombres en vez de IDs
                    p.nombre AS pais_nombre,
                    d.nombre AS departamento_nombre,
                    m.nombre AS municipio_nombre,
                    inst.nombre AS institucion_origen_nombre

                FROM solicitudes s
                INNER JOIN user u ON s.usuario_id = u.id_usuario
                INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                LEFT JOIN instituciones inst ON u.institucion_origen_id = inst.id_institucion
                WHERE s.id_solicitud = p_id_solicitud;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarioPorId` (IN `usuarioId` INT)   BEGIN
                SELECT
                    u.id_usuario,
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,
                    u.tipo_identificacion,
                    u.numero_identificacion,
                    i.nombre AS institucion_origen,
                    f.nombre AS facultad,
                    u.telefono,
                    u.direccion,
                    p.nombre AS pais,
                    d.nombre AS departamento,
                    m.nombre AS municipio,
                    u.created_at,
                    u.updated_at
                FROM users u
                LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
                LEFT JOIN facultades f ON u.facultad_id = f.id_facultad
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                WHERE u.id_usuario = usuarioId;
            END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarios` ()   BEGIN
                SELECT
                    u.id_usuario,
                    u.primer_nombre,
                    u.segundo_nombre,
                    u.primer_apellido,
                    u.segundo_apellido,
                    u.email,
                    u.tipo_identificacion,
                    u.numero_identificacion,
                    i.nombre AS institucion_origen,
                    f.nombre AS facultad,
                    u.telefono,
                    u.direccion,
                    p.nombre AS pais,
                    d.nombre AS departamento,
                    m.nombre AS municipio,
                    u.created_at,
                    u.updated_at
                FROM users u
                LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
                LEFT JOIN facultades f ON u.facultad_id = f.id_facultad
                LEFT JOIN paises p ON u.pais_id = p.id_pais
                LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
                LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
                ORDER BY u.primer_nombre ASC;
            END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id_asignatura` smallint(5) UNSIGNED NOT NULL,
  `programa_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` enum('Materia','Competencia') NOT NULL,
  `codigo_asignatura` varchar(30) NOT NULL,
  `creditos` int(10) UNSIGNED DEFAULT NULL,
  `semestre` int(10) UNSIGNED DEFAULT NULL,
  `horas_sena` int(10) UNSIGNED DEFAULT NULL,
  `tiempo_presencial` int(10) UNSIGNED DEFAULT NULL,
  `tiempo_independiente` int(10) UNSIGNED DEFAULT NULL,
  `horas_totales_semanales` int(10) UNSIGNED DEFAULT NULL,
  `modalidad` enum('Teórico','Práctico','Teórico-Práctico') DEFAULT NULL,
  `metodologia` enum('Presencial','Virtual','Híbrido') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id_asignatura`, `programa_id`, `nombre`, `tipo`, `codigo_asignatura`, `creditos`, `semestre`, `horas_sena`, `tiempo_presencial`, `tiempo_independiente`, `horas_totales_semanales`, `modalidad`, `metodologia`, `created_at`, `updated_at`) VALUES
(1, 1, 'Circuitos Eléctricos', 'Materia', '1_CIRCUITO', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(2, 1, 'Electrónica Digital', 'Materia', '1_ELECTRON', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(3, 1, 'Comunicación Digital', 'Materia', '1_COMUNICA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(4, 1, 'Microcontroladores', 'Materia', '1_MICROCON', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(5, 1, 'Procesamiento de Señales', 'Materia', '1_PROCESAM', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(6, 1, 'Control Automático', 'Materia', '1_CONTROL_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(7, 1, 'Redes de Computadoras', 'Materia', '1_REDES_DE', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(8, 1, 'Proyecto Electrónico I', 'Materia', '1_PROYECTO', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(9, 2, 'Matemáticas I', 'Materia', '2_MATEMATI', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(10, 2, 'Topografía', 'Materia', '2_TOPOGRAF', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(11, 2, 'Mecánica de Materiales', 'Materia', '2_MECANICA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(12, 2, 'Hidráulica', 'Materia', '2_HIDRAULI', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(13, 2, 'Estructuras I', 'Materia', '2_ESTRUCTU', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(14, 2, 'Materiales de Construcción', 'Materia', '2_MATERIAL', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(15, 2, 'Geotecnia', 'Materia', '2_GEOTECNI', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(16, 2, 'Transporte y Vías', 'Materia', '2_TRANSPOR', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(17, 2, 'Gestión de Proyectos', 'Materia', '2_GESTION_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(18, 3, 'Fundamentos de Programación', 'Materia', '3_FUNDAMEN', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(19, 3, 'Estructuras de Datos', 'Materia', '3_ESTRUCTU', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(20, 3, 'Sistemas Distribuidos', 'Materia', '3_SISTEMAS', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(21, 3, 'Redes de Computadores', 'Materia', '3_REDES_DE', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(22, 3, 'Bases de Datos', 'Materia', '3_BASES_DE', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(23, 3, 'Ingeniería de Software', 'Materia', '3_INGENIER', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(24, 3, 'Análisis de Algoritmos', 'Materia', '3_ANALISIS', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(25, 3, 'Desarrollo Web', 'Materia', '3_DESARROL', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(26, 4, 'Control de Procesos', 'Materia', '4_CONTROL_', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(27, 4, 'Instrumentación Industrial', 'Materia', '4_INSTRUME', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(28, 4, 'Sistemas SCADA', 'Materia', '4_SISTEMAS', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(29, 4, 'Robótica Industrial', 'Materia', '4_ROBOTICA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(30, 4, 'Electrónica de Potencia', 'Materia', '4_ELECTRON', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(31, 4, 'PLC y Modulación', 'Materia', '4_PLC_Y_MO', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(32, 4, 'Redes Industriales', 'Materia', '4_REDES_IN', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(33, 4, 'Mantenimiento Industrial', 'Materia', '4_MANTENIM', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(34, 4, 'Metrología', 'Materia', '4_METROLOG', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(35, 5, 'Matemáticas I', 'Materia', '5_MATEMATI', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(36, 5, 'Física II', 'Materia', '5_FISICA_I', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(37, 5, 'Termodinámica', 'Materia', '5_TERMODIN', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(38, 5, 'Mecánica Cuántica', 'Materia', '5_MECANICA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(39, 5, 'Ondas y Óptica', 'Materia', '5_ONDAS_Y_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(40, 5, 'Física Computacional', 'Materia', '5_FISICA_C', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(41, 5, 'Electrónica para Físicos', 'Materia', '5_ELECTRON', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(42, 5, 'Láseres y Fotónica', 'Materia', '5_LASERES_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(43, 6, 'Programación I', 'Materia', '6_PROGRAMA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(44, 6, 'Estructuras de Datos', 'Materia', '6_ESTRUCTU', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(45, 6, 'Arquitectura de Computadores', 'Materia', '6_ARQUITEC', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(46, 6, 'Bases de Datos', 'Materia', '6_BASES_DE', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(47, 6, 'Ingeniería de Software', 'Materia', '6_INGENIER', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(48, 6, 'Redes y Comunicaciones', 'Materia', '6_REDES_Y_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(49, 6, 'Sistemas Operativos', 'Materia', '6_SISTEMAS', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(50, 6, 'Seguridad Informática', 'Materia', '6_SEGURIDA', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(51, 6, 'Gestión de Proyectos', 'Materia', '6_GESTION_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(52, 7, 'Investigación de Operaciones', 'Materia', '7_INVESTIG', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(53, 7, 'Estadística Aplicada', 'Materia', '7_ESTADIST', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(54, 7, 'Gestión de la Producción', 'Materia', '7_GESTION_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(55, 7, 'Procesos de Manufactura', 'Materia', '7_PROCESOS', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(56, 7, 'Ingeniería de Métodos', 'Materia', '7_INGENIER', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(57, 7, 'Logística', 'Materia', '7_LOGISTIC', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(58, 7, 'Seguridad Industrial', 'Materia', '7_SEGURIDA', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(59, 7, 'Ergonomía', 'Materia', '7_ERGONOMI', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(60, 8, 'Diseño Arquitectónico', 'Materia', '8_DISENO_A', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(61, 8, 'Historia de la Arquitectura', 'Materia', '8_HISTORIA', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(62, 8, 'Construcción I', 'Materia', '8_CONSTRUC', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(63, 8, 'Dibujo Arquitectónico', 'Materia', '8_DIBUJO_A', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(64, 8, 'Urbanismo', 'Materia', '8_URBANISM', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(65, 8, 'Tecnología de la Construcción', 'Materia', '8_TECNOLOG', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(66, 8, 'Paisajismo', 'Materia', '8_PAISAJIS', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(67, 8, 'BIM', 'Materia', '8_BIM', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(68, 8, 'Diseño Urbano', 'Materia', '8_DISENO_U', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(69, 9, 'Fundamentos de Programación', 'Materia', '9_FUNDAMEN', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(70, 9, 'Estructuras de Datos', 'Materia', '9_ESTRUCTU', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(71, 9, 'Sistemas Operativos', 'Materia', '9_SISTEMAS', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(72, 9, 'Bases de Datos', 'Materia', '9_BASES_DE', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(73, 9, 'Redes de Computadores', 'Materia', '9_REDES_DE', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(74, 9, 'Desarrollo Web', 'Materia', '9_DESARROL', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(75, 9, 'Programación Móvil', 'Materia', '9_PROGRAMA', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(76, 9, 'Inteligencia Artificial', 'Materia', '9_INTELIGE', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(77, 9, 'Seguridad Informática', 'Materia', '9_SEGURIDA', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(78, 10, 'Circuitos Eléctricos', 'Materia', '10_CIRCUIT', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(79, 10, 'Electrónica de Potencia', 'Materia', '10_ELECTRO', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(80, 10, 'Microcontroladores', 'Materia', '10_MICROCO', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(81, 10, 'Señales y Sistemas', 'Materia', '10_SENALES', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(82, 10, 'Control Automático', 'Materia', '10_CONTROL', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(83, 10, 'Redes de Comunicaciones', 'Materia', '10_REDES_D', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(84, 10, 'Proyecto Electrónico I', 'Materia', '10_PROYECT', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(85, 11, 'Análisis de Requisitos', 'Materia', '11_ANALISI', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(86, 11, 'Diseño de Software', 'Materia', '11_DISENO_', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(87, 11, 'Programación Orientada a Objetos', 'Materia', '11_PROGRAM', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(88, 11, 'Bases de Datos', 'Materia', '11_BASES_D', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(89, 11, 'Desarrollo Web', 'Materia', '11_DESARRO', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(90, 11, 'Pruebas de Software', 'Materia', '11_PRUEBAS', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(91, 11, 'Metodologías Ágiles', 'Materia', '11_METODOL', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(92, 11, 'DevOps Básico', 'Materia', '11_DEVOPS_', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(93, 11, 'Cloud Computing', 'Materia', '11_CLOUD_C', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(94, 11, 'Proyecto Integrador', 'Materia', '11_PROYECT', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(95, 16, 'Analizar Requerimientos', 'Competencia', '16_ANALIZA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(96, 16, 'Diseñar Soluciones Software', 'Competencia', '16_DISENAR', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(97, 16, 'Desarrollar Aplicaciones', 'Competencia', '16_DESARRO', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(98, 16, 'Realizar Pruebas de Software', 'Competencia', '16_REALIZA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(99, 16, 'Implementar Front‑end', 'Competencia', '16_IMPLEME', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(100, 16, 'Desplegar en Servidor', 'Competencia', '16_DESPLEG', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(101, 16, 'Mantener Software', 'Competencia', '16_MANTENE', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(102, 16, 'Documentar Proyectos', 'Competencia', '16_DOCUMEN', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(103, 17, 'Instalación de Periféricos', 'Competencia', '17_INSTALA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(104, 17, 'Configurar Hardware', 'Competencia', '17_CONFIGU', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(105, 17, 'Administrar Cuentas de Usuario', 'Competencia', '17_ADMINIS', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(106, 17, 'Montar Redes Locales', 'Competencia', '17_MONTAR_', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(107, 17, 'Mantenimiento Preventivo', 'Competencia', '17_MANTENI', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(108, 17, 'Monitoreo de Sistemas', 'Competencia', '17_MONITOR', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(109, 18, 'Diseñar Topologías de Red', 'Competencia', '18_DISENAR', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(110, 18, 'Configurar Routers y Switches', 'Competencia', '18_CONFIGU', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(111, 18, 'Implementar VLAN', 'Competencia', '18_IMPLEME', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(112, 18, 'Asegurar Redes', 'Competencia', '18_ASEGURA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(113, 18, 'Monitorizar Tráfico', 'Competencia', '18_MONITOR', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(114, 18, 'Administrar VPN', 'Competencia', '18_ADMINIS', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(115, 18, 'Optimizar Rendimiento', 'Competencia', '18_OPTIMIZ', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(116, 18, 'Gestionar Proyectos de Redes', 'Competencia', '18_GESTION', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(117, 19, 'Diseñar Gráficos', 'Competencia', '19_DISENAR', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(118, 19, 'Edición de Video', 'Competencia', '19_EDICION', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(119, 19, 'Creación de Animaciones', 'Competencia', '19_CREACIO', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(120, 19, 'Producción de Audio', 'Competencia', '19_PRODUCC', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(121, 19, 'Maquetación Web', 'Competencia', '19_MAQUETA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(122, 19, 'Modelado 3D', 'Competencia', '19_MODELAD', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(123, 19, 'UX/UI Básico', 'Competencia', '19_UXUI_BA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(124, 19, 'Publicación Multimedia', 'Competencia', '19_PUBLICA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(125, 20, 'Codificar Módulos', 'Competencia', '20_CODIFIC', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(126, 20, 'Depurar Código', 'Competencia', '20_DEPURAR', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(127, 20, 'Gestionar Repositorios', 'Competencia', '20_GESTION', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(128, 20, 'Documentar Código', 'Competencia', '20_DOCUMEN', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(129, 20, 'Ejecutar Compilaciones', 'Competencia', '20_EJECUTA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(130, 20, 'Pruebas Unitarias', 'Competencia', '20_PRUEBAS', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(131, 20, 'Asistir en Análisis', 'Competencia', '20_ASISTIR', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(132, 20, 'Soporte a Usuario', 'Competencia', '20_SOPORTE', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(133, 21, 'Instalar Servidores', 'Competencia', '21_INSTALA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(134, 21, 'Configurar Redes', 'Competencia', '21_CONFIGU', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(135, 21, 'Desplegar Servicios', 'Competencia', '21_DESPLEG', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(136, 21, 'Virtualización', 'Competencia', '21_VIRTUAL', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(137, 21, 'Administrar Almacenamiento', 'Competencia', '21_ADMINIS', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(138, 21, 'Asegurar Infraestructura', 'Competencia', '21_ASEGURA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(139, 21, 'Automatizar Despliegues', 'Competencia', '21_AUTOMAT', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(140, 21, 'Monitorizar Servicios', 'Competencia', '21_MONITOR', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(141, 22, 'Identificar Riesgos', 'Competencia', '22_IDENTIF', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(142, 22, 'Implementar Medidas Preventivas', 'Competencia', '22_IMPLEME', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(143, 22, 'Elaborar Planes SST', 'Competencia', '22_ELABORA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(144, 22, 'Capacitar Personal', 'Competencia', '22_CAPACIT', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(145, 22, 'Realizar Auditorías', 'Competencia', '22_REALIZA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(146, 22, 'Gestionar Incidentes', 'Competencia', '22_GESTION', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(147, 22, 'Reportar Accidentes', 'Competencia', '22_REPORTA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(148, 22, 'Actualizar Normatividad', 'Competencia', '22_ACTUALI', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(149, 23, 'Definir Alcance', 'Competencia', '23_DEFINIR', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(150, 23, 'Elaborar Cronogramas', 'Competencia', '23_ELABORA', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(151, 23, 'Administrar Recursos', 'Competencia', '23_ADMINIS', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(152, 23, 'Gestionar Riesgos', 'Competencia', '23_GESTION', NULL, 1, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(153, 23, 'Liderar Equipos', 'Competencia', '23_LIDERAR', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(154, 23, 'Controlar Calidad', 'Competencia', '23_CONTROL', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(155, 23, 'Comunicar Stakeholders', 'Competencia', '23_COMUNIC', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(156, 23, 'Entregar Entregables', 'Competencia', '23_ENTREGA', NULL, 2, 160, 4, 4, 8, 'Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(157, 12, 'Matemáticas I', 'Materia', 'IS_S1_M1', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(158, 12, 'Física I', 'Materia', 'IS_S1_M2', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(159, 12, 'Programación I', 'Materia', 'IS_S1_M3', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(160, 12, 'Comunicación Oral y Escrita', 'Materia', 'IS_S1_M4', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(161, 12, 'Fundamentos de Ingeniería de Software', 'Materia', 'IS_S1_M5', 3, 1, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(162, 12, 'Matemáticas II', 'Materia', 'IS_S2_M1', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(163, 12, 'Física II', 'Materia', 'IS_S2_M2', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(164, 12, 'Programación II', 'Materia', 'IS_S2_M3', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(165, 12, 'Lógica y Matemática Discreta', 'Materia', 'IS_S2_M4', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(166, 12, 'Arquitectura de Computadores', 'Materia', 'IS_S2_M5', 3, 2, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(167, 12, 'Estructuras de Datos', 'Materia', 'IS_S3_M1', 3, 3, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(168, 12, 'Bases de Datos I', 'Materia', 'IS_S3_M2', 3, 3, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(169, 12, 'Ingeniería de Requisitos', 'Materia', 'IS_S3_M3', 3, 3, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(170, 12, 'Probabilidad y Estadística', 'Materia', 'IS_S3_M4', 3, 3, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(171, 12, 'Sistemas Operativos', 'Materia', 'IS_S3_M5', 3, 3, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(172, 12, 'Bases de Datos II', 'Materia', 'IS_S4_M1', 3, 4, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(173, 12, 'Diseño de Software', 'Materia', 'IS_S4_M2', 3, 4, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(174, 12, 'Ingeniería de Software I', 'Materia', 'IS_S4_M3', 3, 4, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(175, 12, 'Análisis y Diseño de Algoritmos', 'Materia', 'IS_S4_M4', 3, 4, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(176, 12, 'Redes de Computadores', 'Materia', 'IS_S4_M5', 3, 4, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(177, 12, 'Lenguajes de Programación', 'Materia', 'IS_S5_M1', 3, 5, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(178, 12, 'Seguridad Informática', 'Materia', 'IS_S5_M2', 3, 5, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(179, 12, 'Gestión de Proyectos de Software', 'Materia', 'IS_S5_M3', 3, 5, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(180, 12, 'Desarrollo Web', 'Materia', 'IS_S5_M4', 3, 5, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(181, 12, 'Electiva Profesional I', 'Materia', 'IS_S5_M5', 3, 5, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(182, 12, 'Ingeniería de Software II', 'Materia', 'IS_S6_M1', 3, 6, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(183, 12, 'Desarrollo de Aplicaciones Móviles', 'Materia', 'IS_S6_M2', 3, 6, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(184, 12, 'Computación en la Nube', 'Materia', 'IS_S6_M3', 3, 6, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(185, 12, 'Interacción Humano-Computador', 'Materia', 'IS_S6_M4', 3, 6, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(186, 12, 'Electiva Profesional II', 'Materia', 'IS_S6_M5', 3, 6, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(187, 12, 'Inteligencia Artificial', 'Materia', 'IS_S7_M1', 3, 7, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(188, 12, 'Arquitectura de Software', 'Materia', 'IS_S7_M2', 3, 7, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(189, 12, 'Auditoría y Normatividad en Software', 'Materia', 'IS_S7_M3', 3, 7, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(190, 12, 'Electiva Profesional III', 'Materia', 'IS_S7_M4', 3, 7, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(191, 12, 'Práctica Empresarial I', 'Materia', 'IS_S7_M5', 3, 7, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(192, 12, 'Minería de Datos', 'Materia', 'IS_S8_M1', 3, 8, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(193, 12, 'DevOps y Automatización', 'Materia', 'IS_S8_M2', 3, 8, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(194, 12, 'Ética Profesional', 'Materia', 'IS_S8_M3', 3, 8, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(195, 12, 'Electiva Profesional IV', 'Materia', 'IS_S8_M4', 3, 8, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(196, 12, 'Práctica Empresarial II', 'Materia', 'IS_S8_M5', 3, 8, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(197, 12, 'Trabajo de Grado', 'Materia', 'IS_S9_M1', 3, 9, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(198, 12, 'Emprendimiento y Nuevas Tecnologías', 'Materia', 'IS_S9_M2', 3, 9, NULL, 2, 4, 6, 'Teórico-Práctico', 'Presencial', '2025-04-22 21:00:49', '2025-04-22 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos_programaticos`
--

CREATE TABLE `contenidos_programaticos` (
  `id_contenido` smallint(5) UNSIGNED NOT NULL,
  `asignatura_id` smallint(5) UNSIGNED NOT NULL,
  `tema` varchar(255) NOT NULL,
  `resultados_aprendizaje` text NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` smallint(5) UNSIGNED NOT NULL,
  `pais_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `pais_id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amazonas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(2, 1, 'Antioquia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(3, 1, 'Arauca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(4, 1, 'Archipiélago de San Andrés Providencia y Santa Ca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(5, 1, 'Atlántico', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(6, 1, 'Bogotá D.C.', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(7, 1, 'Bolívar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(8, 1, 'Boyacá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(9, 1, 'Caldas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(10, 1, 'Caquetá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(11, 1, 'Casanare', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(12, 1, 'Cauca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(13, 1, 'Cesar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(14, 1, 'Chocó', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(15, 1, 'Córdoba', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(16, 1, 'Cundinamarca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(17, 1, 'Guainía', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(18, 1, 'Guaviare', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(19, 1, 'Huila', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(20, 1, 'La Guajira', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(21, 1, 'Magdalena', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(22, 1, 'Meta', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(23, 1, 'Nariño', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(24, 1, 'Norte de Santander', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(25, 1, 'Putumayo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(26, 1, 'Quindío', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(27, 1, 'Risaralda', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(28, 1, 'Santander', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(29, 1, 'Sucre', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(30, 1, 'Tolima', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(31, 1, 'Valle del Cauca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(32, 1, 'Vaupés', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(33, 1, 'Vichada', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(34, 1, 'Sin Departamento', '2025-04-22 21:00:42', '2025-04-22 21:00:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` smallint(5) UNSIGNED NOT NULL,
  `solicitud_id` smallint(5) UNSIGNED NOT NULL,
  `usuario_id` smallint(5) UNSIGNED NOT NULL,
  `tipo` enum('Certificado de Notas','Carta de Solicitud','Certificación de Finalización de Estudios','Copia de la Visa','Copia del Pasaporte','Documento de Identidad','Contenido Programático','Apostilla') NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `fecha_subida` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id_documento`, `solicitud_id`, `usuario_id`, `tipo`, `ruta`, `fecha_subida`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Certificado de Notas', 'documentos/laura/certificado_notas_laura.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(2, 1, 1, 'Carta de Solicitud', 'documentos/laura/carta_solicitud_laura.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(3, 1, 1, 'Certificación de Finalización de Estudios', 'documentos/laura/finalizacion_estudios_laura.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(4, 2, 2, 'Documento de Identidad', 'documentos/carlos/cedula_carlos.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(5, 2, 2, 'Carta de Solicitud', 'documentos/carlos/carta_solicitud_carlos.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(6, 2, 2, 'Certificado de Notas', 'documentos/carlos/certificado_notas_carlos.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(7, 3, 3, 'Contenido Programático', 'documentos/andrea/contenido_programatico_andrea.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(8, 3, 3, 'Certificado de Notas', 'documentos/andrea/certificado_notas_andrea.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(9, 3, 3, 'Carta de Solicitud', 'documentos/andrea/carta_solicitud_andrea.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(10, 4, 4, 'Carta de Solicitud', 'documentos/luis/carta_solicitud_luis.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(11, 4, 4, 'Certificación de Finalización de Estudios', 'documentos/luis/finalizacion_estudios_luis.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(12, 4, 4, 'Documento de Identidad', 'documentos/luis/cedula_luis.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(13, 5, 5, 'Copia del Pasaporte', 'documentos/miguel/pasaporte_miguel.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(14, 5, 5, 'Copia de la Visa', 'documentos/miguel/visa_miguel.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(15, 5, 5, 'Apostilla', 'documentos/miguel/apostilla_miguel.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(16, 6, 6, 'Certificación de Finalización de Estudios', 'documentos/juliana/finalizacion_estudios_juliana.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(17, 6, 6, 'Documento de Identidad', 'documentos/juliana/cedula_juliana.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(18, 6, 6, 'Carta de Solicitud', 'documentos/juliana/carta_solicitud_juliana.pdf', '2025-04-22 16:00:49', '2025-04-22 21:00:49', '2025-04-22 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultades`
--

CREATE TABLE `facultades` (
  `id_facultad` smallint(5) UNSIGNED NOT NULL,
  `institucion_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `facultades`
--

INSERT INTO `facultades` (`id_facultad`, `institucion_id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 5, 'Facultad de Ingeniería Civil', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(2, 5, 'Facultad de Ingeniería Electrónica y Telecomunicaciones', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(3, 4, 'Facultad de Ingeniería y Arquitectura', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(4, 3, 'Facultad de Ingeniería', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(5, 1, 'Facultad de Ingeniería', '2025-04-22 21:00:45', '2025-04-22 21:00:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_homologaciones`
--

CREATE TABLE `historial_homologaciones` (
  `id_historial` smallint(5) UNSIGNED NOT NULL,
  `solicitud_id` smallint(5) UNSIGNED NOT NULL,
  `usuario_id` smallint(5) UNSIGNED NOT NULL,
  `estado` enum('Radicado','En revisión','Evaluado','Aprobado','Rechazado','Cerrado') NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` text DEFAULT NULL,
  `ruta_pdf_resolucion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_homologaciones`
--

INSERT INTO `historial_homologaciones` (`id_historial`, `solicitud_id`, `usuario_id`, `estado`, `fecha`, `observaciones`, `ruta_pdf_resolucion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Radicado', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(2, 2, 2, 'En revisión', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(3, 3, 3, 'Radicado', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(4, 4, 4, 'En revisión', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(5, 5, 5, 'Aprobado', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(6, 6, 6, 'Rechazado', '2025-04-22 21:00:49', 'Solicitud creada automáticamente', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `homologacion_asignaturas`
--

CREATE TABLE `homologacion_asignaturas` (
  `id_homologacion` smallint(5) UNSIGNED NOT NULL,
  `solicitud_id` smallint(5) UNSIGNED NOT NULL,
  `asignatura_origen_id` smallint(5) UNSIGNED NOT NULL,
  `asignatura_destino_id` smallint(5) UNSIGNED NOT NULL,
  `nota_destino` decimal(3,1) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `homologacion_asignaturas`
--

INSERT INTO `homologacion_asignaturas` (`id_homologacion`, `solicitud_id`, `asignatura_origen_id`, `asignatura_destino_id`, `nota_destino`, `fecha`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 165, 4.1, '2025-04-22 16:00:49', 'Temario coincidente en un 90%.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(2, 1, 2, 166, 3.9, '2025-04-22 16:00:49', 'Faltan prácticas de laboratorio.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(3, 2, 46, 167, 4.7, '2025-04-22 16:00:49', 'Nivel y profundidad adecuados.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(4, 2, 47, 168, NULL, '2025-04-22 16:00:49', 'Pendiente plan de clases detallado.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(5, 2, 48, 169, 4.3, '2025-04-22 16:00:49', 'Buen ajuste de competencias.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(6, 3, 101, 170, NULL, '2025-04-22 16:00:49', 'Requiere validar conceptos avanzados.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(7, 3, 102, 171, 4.0, '2025-04-22 16:00:49', 'Contenido teórico cubierto.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(8, 4, 73, 172, 4.2, '2025-04-22 16:00:49', 'Ejercicios prácticos suficientes.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(9, 4, 74, 173, NULL, '2025-04-22 16:00:49', 'Falta evidencia de proyecto.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(10, 5, 3, 174, 4.5, '2025-04-22 16:00:49', 'Coincidencia de laboratorio alta.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(11, 5, 4, 175, NULL, '2025-04-22 16:00:49', 'Syllabus incompleto.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(12, 5, 5, 176, 4.1, '2025-04-22 16:00:49', 'Buenas prácticas incluidas.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(13, 6, 103, 177, 3.8, '2025-04-22 16:00:49', 'Evaluación práctica pendiente.', '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(14, 6, 104, 178, NULL, '2025-04-22 16:00:49', 'Falta plan de análisis de datos.', '2025-04-22 21:00:49', '2025-04-22 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones`
--

CREATE TABLE `instituciones` (
  `id_institucion` smallint(5) UNSIGNED NOT NULL,
  `municipio_id` smallint(5) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo_ies` varchar(20) DEFAULT NULL,
  `tipo` enum('Universitaria','SENA','Mixta') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `instituciones`
--

INSERT INTO `instituciones` (`id_institucion`, `municipio_id`, `nombre`, `codigo_ies`, `tipo`, `created_at`, `updated_at`) VALUES
(1, 703, 'Corporación Universitaria Autónoma del Cauca', '2849', 'Universitaria', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(2, 703, 'Servicio Nacional de Aprendizaje - SENA', NULL, 'SENA', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(3, 703, 'Colegio Mayor del Cauca', '3104', 'Mixta', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(4, 703, 'Fundación Universitaria de Popayán - FUP', '1055', 'Mixta', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(5, 703, 'Universidad del Cauca', '1110', 'Universitaria', '2025-04-22 21:00:45', '2025-04-22 21:00:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2025_03_27_230000_create_paises_table', 1),
(3, '2025_03_27_231000_create_departamentos_table', 1),
(4, '2025_03_27_232000_create_municipios_table', 1),
(5, '2025_03_28_000000_create_instituciones_table', 1),
(6, '2025_03_28_001000_create_facultades_table', 1),
(7, '2025_03_28_002000_create_programas_table', 1),
(8, '2025_03_28_010000_create_roles_table', 1),
(9, '2025_03_28_040000_create_asignaturas_table', 1),
(10, '2025_03_28_041000_create_contenidos_programaticos_table', 1),
(11, '2025_03_28_042000_create_users_table', 1),
(12, '2025_03_28_050000_create_solicitudes_table', 1),
(13, '2025_03_28_051000_create_documentos_table', 1),
(14, '2025_03_31_162741_create_historial_homologaciones_table', 1),
(15, '2025_03_31_165258_create_solicitud_asignaturas_table', 1),
(16, '2025_03_31_173221_create_homologacion_asignaturas_table', 1),
(17, '2025_04_21_010527_crear_procedimientos_homologacion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` smallint(5) UNSIGNED NOT NULL,
  `departamento_id` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `departamento_id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 2, 'Abejorral', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(2, 24, 'Abrego', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(3, 2, 'Abriaquí', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(4, 22, 'Acacias', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(5, 14, 'Acandí', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(6, 19, 'Acevedo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(7, 7, 'Achí', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(8, 19, 'Agrado', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(9, 16, 'Agua de Dios', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(10, 13, 'Aguachica', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(11, 28, 'Aguada', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(12, 9, 'Aguadas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(13, 11, 'Aguazul', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(14, 13, 'Agustín Codazzi', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(15, 19, 'Aipe', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(16, 16, 'Albán', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(17, 23, 'Albán', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(18, 10, 'Albania', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(19, 20, 'Albania', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(20, 28, 'Albania', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(21, 31, 'Alcalá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(22, 23, 'Aldana', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(23, 2, 'Alejandría', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(24, 21, 'Algarrobo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(25, 19, 'Algeciras', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(26, 12, 'Almaguer', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(27, 8, 'Almeida', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(28, 30, 'Alpujarra', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(29, 19, 'Altamira', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(30, 14, 'Alto Baudo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(31, 7, 'Altos del Rosario', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(32, 30, 'Alvarado', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(33, 2, 'Amagá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(34, 2, 'Amalfi', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(35, 30, 'Ambalema', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(36, 16, 'Anapoima', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(37, 23, 'Ancuyá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(38, 31, 'Andalucía', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(39, 2, 'Andes', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(40, 2, 'Angelópolis', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(41, 2, 'Angostura', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(42, 16, 'Anolaima', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(43, 2, 'Anorí', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(44, 9, 'Anserma', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(45, 31, 'Ansermanuevo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(46, 2, 'Anza', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(47, 30, 'Anzoátegui', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(48, 2, 'Apartadó', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(49, 27, 'Apía', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(50, 16, 'Apulo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(51, 8, 'Aquitania', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(52, 21, 'Aracataca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(53, 9, 'Aranzazu', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(54, 28, 'Aratoca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(55, 3, 'Arauca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(56, 3, 'Arauquita', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(57, 16, 'Arbeláez', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(58, 23, 'Arboleda', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(59, 24, 'Arboledas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(60, 2, 'Arboletes', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(61, 8, 'Arcabuco', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(62, 7, 'Arenal', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(63, 2, 'Argelia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(64, 12, 'Argelia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(65, 31, 'Argelia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(66, 21, 'Ariguaní', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(67, 7, 'Arjona', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(68, 2, 'Armenia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(69, 26, 'Armenia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(70, 30, 'Armero', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(71, 7, 'Arroyohondo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(72, 13, 'Astrea', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(73, 30, 'Ataco', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(74, 14, 'Atrato', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(75, 15, 'Ayapel', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(76, 14, 'Bagadó', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(77, 14, 'Bahía Solano', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(78, 14, 'Bajo Baudó', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(79, 12, 'Balboa', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(80, 27, 'Balboa', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(81, 5, 'Baranoa', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(82, 19, 'Baraya', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(83, 23, 'Barbacoas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(84, 2, 'Barbosa', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(85, 28, 'Barbosa', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(86, 28, 'Barichara', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(87, 22, 'Barranca de Upía', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(88, 28, 'Barrancabermeja', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(89, 20, 'Barrancas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(90, 7, 'Barranco de Loba', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(91, 17, 'Barranco Minas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(92, 5, 'Barranquilla', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(93, 13, 'Becerril', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(94, 9, 'Belalcázar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(95, 8, 'Belén', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(96, 23, 'Belén', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(97, 14, 'Belén de Bajira', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(98, 10, 'Belén de Los Andaquies', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(99, 27, 'Belén de Umbría', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(100, 2, 'Bello', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(101, 2, 'Belmira', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(102, 16, 'Beltrán', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(103, 8, 'Berbeo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(104, 2, 'Betania', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(105, 8, 'Betéitiva', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(106, 2, 'Betulia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(107, 28, 'Betulia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(108, 16, 'Bituima', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(109, 8, 'Boavita', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(110, 24, 'Bochalema', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(111, 6, 'Bogotá D.C.', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(112, 16, 'Bojacá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(113, 14, 'Bojaya', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(114, 12, 'Bolívar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(115, 28, 'Bolívar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(116, 31, 'Bolívar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(117, 13, 'Bosconia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(118, 8, 'Boyacá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(119, 2, 'Briceño', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(120, 8, 'Briceño', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(121, 28, 'Bucaramanga', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(122, 24, 'Bucarasica', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(123, 8, 'Buena Vista', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(124, 31, 'Buenaventura', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(125, 15, 'Buenavista', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(126, 26, 'Buenavista', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(127, 29, 'Buenavista', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(128, 12, 'Buenos Aires', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(129, 23, 'Buesaco', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(130, 31, 'Bugalagrande', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(131, 2, 'Buriticá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(132, 8, 'Busbanzá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(133, 16, 'Cabrera', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(134, 28, 'Cabrera', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(135, 22, 'Cabuyaro', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(136, 17, 'Cacahual', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(137, 2, 'Cáceres', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(138, 16, 'Cachipay', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(139, 24, 'Cachirá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(140, 24, 'Cácota', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(141, 2, 'Caicedo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(142, 31, 'Caicedonia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(143, 29, 'Caimito', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(144, 30, 'Cajamarca', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(145, 12, 'Cajibío', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(146, 16, 'Cajicá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(147, 7, 'Calamar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(148, 18, 'Calamar', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(149, 26, 'Calarcá', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(150, 2, 'Caldas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(151, 8, 'Caldas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(152, 12, 'Caldono', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(153, 31, 'Cali', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(154, 28, 'California', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(155, 31, 'Calima', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(156, 12, 'Caloto', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(157, 2, 'Campamento', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(158, 5, 'Campo de La Cruz', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(159, 19, 'Campoalegre', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(160, 8, 'Campohermoso', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(161, 15, 'Canalete', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(162, 5, 'Candelaria', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(163, 31, 'Candelaria', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(164, 7, 'Cantagallo', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(165, 2, 'Cañasgordas', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(166, 16, 'Caparrapí', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(167, 28, 'Capitanejo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(168, 16, 'Caqueza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(169, 2, 'Caracolí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(170, 2, 'Caramanta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(171, 28, 'Carcasí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(172, 2, 'Carepa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(173, 30, 'Carmen de Apicala', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(174, 16, 'Carmen de Carupa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(175, 14, 'Carmen del Darien', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(176, 2, 'Carolina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(177, 7, 'Cartagena', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(178, 10, 'Cartagena del Chairá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(179, 31, 'Cartago', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(180, 32, 'Caruru', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(181, 30, 'Casabianca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(182, 22, 'Castilla la Nueva', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(183, 2, 'Caucasia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(184, 28, 'Cepitá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(185, 15, 'Cereté', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(186, 8, 'Cerinza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(187, 28, 'Cerrito', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(188, 21, 'Cerro San Antonio', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(189, 14, 'Cértegui', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(190, 23, 'Chachagüí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(191, 16, 'Chaguaní', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(192, 29, 'Chalán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(193, 11, 'Chámeza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(194, 30, 'Chaparral', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(195, 28, 'Charalá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(196, 28, 'Charta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(197, 16, 'Chía', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(198, 2, 'Chigorodó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(199, 15, 'Chimá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(200, 28, 'Chimá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(201, 13, 'Chimichagua', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(202, 24, 'Chinácota', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(203, 8, 'Chinavita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(204, 9, 'Chinchiná', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(205, 15, 'Chinú', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(206, 16, 'Chipaque', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(207, 28, 'Chipatá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(208, 8, 'Chiquinquirá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(209, 8, 'Chíquiza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(210, 13, 'Chiriguaná', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(211, 8, 'Chiscas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(212, 8, 'Chita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(213, 24, 'Chitagá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(214, 8, 'Chitaraque', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(215, 8, 'Chivatá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(216, 21, 'Chivolo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(217, 8, 'Chivor', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(218, 16, 'Choachí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(219, 16, 'Chocontá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(220, 7, 'Cicuco', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(221, 21, 'Ciénaga', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(222, 15, 'Ciénaga de Oro', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(223, 8, 'Ciénega', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(224, 28, 'Cimitarra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(225, 26, 'Circasia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(226, 2, 'Cisneros', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(227, 2, 'Ciudad Bolívar', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(228, 7, 'Clemencia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(229, 2, 'Cocorná', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(230, 30, 'Coello', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(231, 16, 'Cogua', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(232, 19, 'Colombia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(233, 23, 'Colón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(234, 25, 'Colón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(235, 29, 'Coloso', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(236, 8, 'Cómbita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(237, 2, 'Concepción', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(238, 28, 'Concepción', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(239, 2, 'Concordia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(240, 21, 'Concordia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(241, 14, 'Condoto', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(242, 28, 'Confines', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(243, 23, 'Consaca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(244, 23, 'Contadero', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(245, 28, 'Contratación', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(246, 24, 'Convención', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(247, 2, 'Copacabana', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(248, 8, 'Coper', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(249, 7, 'Córdoba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(250, 23, 'Córdoba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(251, 26, 'Córdoba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(252, 12, 'Corinto', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(253, 28, 'Coromoro', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(254, 29, 'Corozal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(255, 8, 'Corrales', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(256, 16, 'Cota', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(257, 15, 'Cotorra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(258, 8, 'Covarachía', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(259, 29, 'Coveñas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(260, 30, 'Coyaima', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(261, 3, 'Cravo Norte', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(262, 23, 'Cuaspud', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(263, 8, 'Cubará', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(264, 22, 'Cubarral', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(265, 8, 'Cucaita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(266, 16, 'Cucunubá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(267, 24, 'Cúcuta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(268, 24, 'Cucutilla', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(269, 8, 'Cuítiva', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(270, 22, 'Cumaral', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(271, 33, 'Cumaribo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(272, 23, 'Cumbal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(273, 23, 'Cumbitara', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(274, 30, 'Cunday', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(275, 10, 'Curillo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(276, 28, 'Curití', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(277, 13, 'Curumaní', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(278, 2, 'Dabeiba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(279, 31, 'Dagua', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(280, 20, 'Dibula', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(281, 20, 'Distracción', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(282, 30, 'Dolores', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(283, 2, 'Don Matías', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(284, 27, 'Dosquebradas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(285, 8, 'Duitama', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(286, 24, 'Durania', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(287, 2, 'Ebéjico', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(288, 31, 'El Águila', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(289, 2, 'El Bagre', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(290, 21, 'El Banco', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(291, 31, 'El Cairo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(292, 22, 'El Calvario', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(293, 14, 'El Cantón del San Pablo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(294, 24, 'El Carmen', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(295, 14, 'El Carmen de Atrato', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(296, 7, 'El Carmen de Bolívar', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(297, 28, 'El Carmen de Chucurí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(298, 2, 'El Carmen de Viboral', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(299, 22, 'El Castillo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(300, 31, 'El Cerrito', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(301, 23, 'El Charco', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(302, 8, 'El Cocuy', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(303, 16, 'El Colegio', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(304, 13, 'El Copey', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(305, 10, 'El Doncello', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(306, 22, 'El Dorado', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(307, 31, 'El Dovio', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(308, 1, 'El Encanto', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(309, 8, 'El Espino', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(310, 28, 'El Guacamayo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(311, 7, 'El Guamo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(312, 14, 'El Litoral del San Juan', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(313, 20, 'El Molino', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(314, 13, 'El Paso', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(315, 10, 'El Paujil', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(316, 23, 'El Peñol', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(317, 7, 'El Peñón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(318, 16, 'El Peñón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(319, 28, 'El Peñón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(320, 21, 'El Piñon', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(321, 28, 'El Playón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(322, 21, 'El Retén', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(323, 18, 'El Retorno', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(324, 29, 'El Roble', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(325, 16, 'El Rosal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(326, 23, 'El Rosario', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(327, 2, 'El Santuario', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(328, 23, 'El Tablón de Gómez', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(329, 12, 'El Tambo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(330, 23, 'El Tambo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(331, 24, 'El Tarra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(332, 24, 'El Zulia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(333, 19, 'Elías', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(334, 28, 'Encino', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(335, 28, 'Enciso', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(336, 2, 'Entrerrios', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(337, 2, 'Envigado', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(338, 30, 'Espinal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(339, 16, 'Facatativá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(340, 30, 'Falan', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(341, 9, 'Filadelfia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(342, 26, 'Filandia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(343, 8, 'Firavitoba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(344, 30, 'Flandes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(345, 10, 'Florencia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(346, 12, 'Florencia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(347, 8, 'Floresta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(348, 28, 'Florián', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(349, 31, 'Florida', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(350, 28, 'Floridablanca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(351, 16, 'Fomeque', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(352, 20, 'Fonseca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(353, 3, 'Fortul', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(354, 16, 'Fosca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(355, 23, 'Francisco Pizarro', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(356, 2, 'Fredonia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(357, 30, 'Fresno', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(358, 2, 'Frontino', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(359, 22, 'Fuente de Oro', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(360, 21, 'Fundación', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(361, 23, 'Funes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(362, 16, 'Funza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(363, 16, 'Fúquene', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(364, 16, 'Fusagasugá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(365, 16, 'Gachala', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(366, 16, 'Gachancipá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(367, 8, 'Gachantivá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(368, 16, 'Gachetá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(369, 28, 'Galán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(370, 5, 'Galapa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(371, 29, 'Galeras', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(372, 16, 'Gama', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(373, 13, 'Gamarra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(374, 28, 'Gambita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(375, 8, 'Gameza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(376, 8, 'Garagoa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(377, 19, 'Garzón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(378, 26, 'Génova', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(379, 19, 'Gigante', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(380, 31, 'Ginebra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(381, 2, 'Giraldo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(382, 16, 'Girardot', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(383, 2, 'Girardota', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(384, 28, 'Girón', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(385, 2, 'Gómez Plata', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(386, 13, 'González', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(387, 24, 'Gramalote', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(388, 2, 'Granada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(389, 16, 'Granada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(390, 22, 'Granada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(391, 28, 'Guaca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(392, 8, 'Guacamayas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(393, 31, 'Guacarí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(394, 12, 'Guachené', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(395, 16, 'Guachetá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(396, 23, 'Guachucal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(397, 31, 'Guadalajara de Buga', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(398, 2, 'Guadalupe', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(399, 19, 'Guadalupe', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(400, 28, 'Guadalupe', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(401, 16, 'Guaduas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(402, 23, 'Guaitarilla', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(403, 23, 'Gualmatán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(404, 21, 'Guamal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(405, 22, 'Guamal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(406, 30, 'Guamo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(407, 12, 'Guapi', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(408, 28, 'Guapotá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(409, 29, 'Guaranda', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(410, 2, 'Guarne', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(411, 16, 'Guasca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(412, 2, 'Guatapé', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(413, 16, 'Guataquí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(414, 16, 'Guatavita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(415, 8, 'Guateque', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(416, 27, 'Guática', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(417, 28, 'Guavatá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(418, 16, 'Guayabal de Siquima', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(419, 16, 'Guayabetal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(420, 8, 'Guayatá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(421, 28, 'Güepsa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(422, 8, 'Güicán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(423, 16, 'Gutiérrez', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(424, 24, 'Hacarí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(425, 7, 'Hatillo de Loba', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(426, 28, 'Hato', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(427, 11, 'Hato Corozal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(428, 20, 'Hatonuevo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(429, 2, 'Heliconia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(430, 24, 'Herrán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(431, 30, 'Herveo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(432, 2, 'Hispania', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(433, 19, 'Hobo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(434, 30, 'Honda', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(435, 30, 'Ibagué', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(436, 30, 'Icononzo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(437, 23, 'Iles', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(438, 23, 'Imués', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(439, 17, 'Inírida', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(440, 12, 'Inzá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(441, 23, 'Ipiales', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(442, 19, 'Iquira', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(443, 19, 'Isnos', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(444, 14, 'Istmina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(445, 2, 'Itagui', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(446, 2, 'Ituango', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(447, 8, 'Iza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(448, 12, 'Jambaló', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(449, 31, 'Jamundí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(450, 2, 'Jardín', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(451, 8, 'Jenesano', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(452, 2, 'Jericó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(453, 8, 'Jericó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(454, 16, 'Jerusalén', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(455, 28, 'Jesús María', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(456, 28, 'Jordán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(457, 5, 'Juan de Acosta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(458, 16, 'Junín', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(459, 14, 'Juradó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(460, 15, 'La Apartada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(461, 19, 'La Argentina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(462, 28, 'La Belleza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(463, 16, 'La Calera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(464, 8, 'La Capilla', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(465, 2, 'La Ceja', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(466, 27, 'La Celia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(467, 1, 'La Chorrera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(468, 23, 'La Cruz', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(469, 31, 'La Cumbre', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(470, 9, 'La Dorada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(471, 24, 'La Esperanza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(472, 2, 'La Estrella', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(473, 23, 'La Florida', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(474, 13, 'La Gloria', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(475, 17, 'La Guadalupe', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(476, 13, 'La Jagua de Ibirico', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(477, 20, 'La Jagua del Pilar', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(478, 23, 'La Llanada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(479, 22, 'La Macarena', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(480, 9, 'La Merced', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(481, 16, 'La Mesa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(482, 10, 'La Montañita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(483, 16, 'La Palma', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(484, 13, 'La Paz', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(485, 28, 'La Paz', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(486, 1, 'La Pedrera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(487, 16, 'La Peña', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(488, 2, 'La Pintada', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(489, 19, 'La Plata', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(490, 24, 'La Playa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(491, 33, 'La Primavera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(492, 11, 'La Salina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(493, 12, 'La Sierra', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(494, 26, 'La Tebaida', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(495, 23, 'La Tola', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(496, 2, 'La Unión', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(497, 23, 'La Unión', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(498, 29, 'La Unión', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(499, 31, 'La Unión', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(500, 8, 'La Uvita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(501, 12, 'La Vega', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(502, 16, 'La Vega', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(503, 1, 'La Victoria', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(504, 8, 'La Victoria', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(505, 31, 'La Victoria', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(506, 27, 'La Virginia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(507, 24, 'Labateca', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(508, 8, 'Labranzagrande', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(509, 28, 'Landázuri', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(510, 28, 'Lebríja', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(511, 25, 'Leguízamo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(512, 23, 'Leiva', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(513, 22, 'Lejanías', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(514, 16, 'Lenguazaque', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(515, 30, 'Lérida', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(516, 1, 'Leticia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(517, 30, 'Líbano', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(518, 2, 'Liborina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(519, 23, 'Linares', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(520, 14, 'Lloró', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(521, 12, 'López', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(522, 15, 'Lorica', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(523, 23, 'Los Andes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(524, 15, 'Los Córdobas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(525, 29, 'Los Palmitos', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(526, 24, 'Los Patios', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(527, 28, 'Los Santos', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(528, 24, 'Lourdes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(529, 5, 'Luruaco', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(530, 8, 'Macanal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(531, 28, 'Macaravita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(532, 2, 'Maceo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(533, 16, 'Macheta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(534, 16, 'Madrid', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(535, 7, 'Magangué', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(536, 23, 'Magüí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(537, 7, 'Mahates', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(538, 20, 'Maicao', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(539, 29, 'Majagual', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(540, 28, 'Málaga', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(541, 5, 'Malambo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(542, 23, 'Mallama', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(543, 5, 'Manatí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(544, 13, 'Manaure', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(545, 20, 'Manaure', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(546, 11, 'Maní', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(547, 9, 'Manizales', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(548, 16, 'Manta', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(549, 9, 'Manzanares', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(550, 22, 'Mapiripán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(551, 17, 'Mapiripana', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(552, 7, 'Margarita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(553, 7, 'María la Baja', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(554, 2, 'Marinilla', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(555, 8, 'Maripí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(556, 30, 'Mariquita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(557, 9, 'Marmato', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(558, 9, 'Marquetalia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(559, 27, 'Marsella', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(560, 9, 'Marulanda', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(561, 28, 'Matanza', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(562, 2, 'Medellín', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(563, 16, 'Medina', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(564, 14, 'Medio Atrato', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(565, 14, 'Medio Baudó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(566, 14, 'Medio San Juan', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(567, 30, 'Melgar', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(568, 12, 'Mercaderes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(569, 22, 'Mesetas', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(570, 10, 'Milán', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(571, 8, 'Miraflores', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(572, 18, 'Miraflores', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(573, 12, 'Miranda', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(574, 1, 'Miriti Paraná', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(575, 27, 'Mistrató', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(576, 32, 'Mitú', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(577, 25, 'Mocoa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(578, 28, 'Mogotes', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(579, 28, 'Molagavita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(580, 15, 'Momil', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(581, 7, 'Mompós', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(582, 8, 'Mongua', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(583, 8, 'Monguí', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(584, 8, 'Moniquirá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(585, 2, 'Montebello', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(586, 7, 'Montecristo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(587, 15, 'Montelíbano', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(588, 26, 'Montenegro', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(589, 15, 'Montería', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(590, 11, 'Monterrey', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(591, 15, 'Moñitos', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(592, 7, 'Morales', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(593, 12, 'Morales', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(594, 10, 'Morelia', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(595, 17, 'Morichal', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(596, 29, 'Morroa', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(597, 16, 'Mosquera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(598, 23, 'Mosquera', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(599, 8, 'Motavita', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(600, 30, 'Murillo', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(601, 2, 'Murindó', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(602, 2, 'Mutatá', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(603, 24, 'Mutiscua', '2025-04-22 21:00:43', '2025-04-22 21:00:43'),
(604, 8, 'Muzo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(605, 2, 'Nariño', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(606, 16, 'Nariño', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(607, 23, 'Nariño', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(608, 19, 'Nátaga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(609, 30, 'Natagaima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(610, 2, 'Nechí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(611, 2, 'Necoclí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(612, 9, 'Neira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(613, 19, 'Neiva', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(614, 16, 'Nemocón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(615, 16, 'Nilo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(616, 16, 'Nimaima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(617, 8, 'Nobsa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(618, 16, 'Nocaima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(619, 9, 'Norcasia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(620, 7, 'Norosí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(621, 14, 'Nóvita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(622, 21, 'Nueva Granada', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(623, 8, 'Nuevo Colón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(624, 11, 'Nunchía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(625, 14, 'Nuquí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(626, 31, 'Obando', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(627, 28, 'Ocamonte', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(628, 24, 'Ocaña', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(629, 28, 'Oiba', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(630, 8, 'Oicatá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(631, 2, 'Olaya', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(632, 23, 'Olaya Herrera', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(633, 28, 'Onzaga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(634, 19, 'Oporapa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(635, 25, 'Orito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(636, 11, 'Orocué', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(637, 30, 'Ortega', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(638, 23, 'Ospina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(639, 8, 'Otanche', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(640, 29, 'Ovejas', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(641, 8, 'Pachavita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(642, 16, 'Pacho', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(643, 32, 'Pacoa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(644, 9, 'Pácora', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(645, 12, 'Padilla', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(646, 8, 'Páez', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(647, 12, 'Páez', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(648, 19, 'Paicol', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(649, 13, 'Pailitas', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(650, 16, 'Paime', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(651, 8, 'Paipa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(652, 8, 'Pajarito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(653, 19, 'Palermo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(654, 9, 'Palestina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(655, 19, 'Palestina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(656, 28, 'Palmar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(657, 5, 'Palmar de Varela', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(658, 28, 'Palmas del Socorro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(659, 31, 'Palmira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(660, 29, 'Palmito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(661, 30, 'Palocabildo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(662, 24, 'Pamplona', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(663, 24, 'Pamplonita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(664, 17, 'Pana Pana', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(665, 16, 'Pandi', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(666, 8, 'Panqueba', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(667, 32, 'Papunaua', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(668, 28, 'Páramo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(669, 16, 'Paratebueno', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(670, 16, 'Pasca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(671, 23, 'Pasto', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(672, 12, 'Patía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(673, 8, 'Pauna', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(674, 8, 'Paya', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(675, 11, 'Paz de Ariporo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(676, 8, 'Paz de Río', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(677, 21, 'Pedraza', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(678, 13, 'Pelaya', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(679, 9, 'Pensilvania', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(680, 2, 'Peñol', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(681, 2, 'Peque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(682, 27, 'Pereira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(683, 8, 'Pesca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(684, 12, 'Piamonte', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(685, 28, 'Piedecuesta', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(686, 30, 'Piedras', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(687, 12, 'Piendamó', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(688, 26, 'Pijao', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(689, 21, 'Pijiño del Carmen', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(690, 28, 'Pinchote', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(691, 7, 'Pinillos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(692, 5, 'Piojó', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(693, 8, 'Pisba', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(694, 19, 'Pital', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(695, 19, 'Pitalito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(696, 21, 'Pivijay', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(697, 30, 'Planadas', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(698, 15, 'Planeta Rica', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(699, 21, 'Plato', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(700, 23, 'Policarpa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(701, 5, 'Polonuevo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(702, 5, 'Ponedera', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(703, 12, 'Popayán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(704, 11, 'Pore', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(705, 23, 'Potosí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(706, 31, 'Pradera', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(707, 30, 'Prado', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(708, 4, 'Providencia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(709, 23, 'Providencia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(710, 13, 'Pueblo Bello', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(711, 15, 'Pueblo Nuevo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(712, 27, 'Pueblo Rico', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(713, 21, 'Pueblo Viejo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(714, 2, 'Pueblorrico', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(715, 28, 'Puente Nacional', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(716, 23, 'Puerres', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(717, 1, 'Puerto Alegría', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(718, 1, 'Puerto Arica', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(719, 25, 'Puerto Asís', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(720, 2, 'Puerto Berrío', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(721, 8, 'Puerto Boyacá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(722, 25, 'Puerto Caicedo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(723, 33, 'Puerto Carreño', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(724, 5, 'Puerto Colombia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(725, 17, 'Puerto Colombia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(726, 22, 'Puerto Concordia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(727, 15, 'Puerto Escondido', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(728, 22, 'Puerto Gaitán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(729, 25, 'Puerto Guzmán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(730, 15, 'Puerto Libertador', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(731, 22, 'Puerto Lleras', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(732, 22, 'Puerto López', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(733, 2, 'Puerto Nare', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(734, 1, 'Puerto Nariño', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(735, 28, 'Puerto Parra', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(736, 10, 'Puerto Rico', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(737, 22, 'Puerto Rico', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(738, 3, 'Puerto Rondón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(739, 16, 'Puerto Salgar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(740, 1, 'Puerto Santander', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(741, 24, 'Puerto Santander', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(742, 12, 'Puerto Tejada', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(743, 2, 'Puerto Triunfo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(744, 28, 'Puerto Wilches', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(745, 16, 'Pulí', '2025-04-22 21:00:44', '2025-04-22 21:00:44');
INSERT INTO `municipios` (`id_municipio`, `departamento_id`, `nombre`, `created_at`, `updated_at`) VALUES
(746, 23, 'Pupiales', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(747, 12, 'Puracé', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(748, 30, 'Purificación', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(749, 15, 'Purísima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(750, 16, 'Quebradanegra', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(751, 16, 'Quetame', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(752, 14, 'Quibdó', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(753, 26, 'Quimbaya', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(754, 27, 'Quinchía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(755, 8, 'Quípama', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(756, 16, 'Quipile', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(757, 24, 'Ragonvalia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(758, 8, 'Ramiriquí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(759, 8, 'Ráquira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(760, 11, 'Recetor', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(761, 7, 'Regidor', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(762, 2, 'Remedios', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(763, 21, 'Remolino', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(764, 5, 'Repelón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(765, 22, 'Restrepo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(766, 31, 'Restrepo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(767, 2, 'Retiro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(768, 16, 'Ricaurte', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(769, 23, 'Ricaurte', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(770, 30, 'Rio Blanco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(771, 13, 'Río de Oro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(772, 14, 'Río Iro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(773, 14, 'Río Quito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(774, 7, 'Río Viejo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(775, 31, 'Riofrío', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(776, 20, 'Riohacha', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(777, 2, 'Rionegro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(778, 28, 'Rionegro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(779, 9, 'Riosucio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(780, 14, 'Riosucio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(781, 9, 'Risaralda', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(782, 19, 'Rivera', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(783, 23, 'Roberto Payán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(784, 31, 'Roldanillo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(785, 30, 'Roncesvalles', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(786, 8, 'Rondón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(787, 12, 'Rosas', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(788, 30, 'Rovira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(789, 28, 'Sabana de Torres', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(790, 5, 'Sabanagrande', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(791, 2, 'Sabanalarga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(792, 5, 'Sabanalarga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(793, 11, 'Sabanalarga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(794, 21, 'Sabanas de San Angel', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(795, 2, 'Sabaneta', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(796, 8, 'Saboyá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(797, 11, 'Sácama', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(798, 8, 'Sáchica', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(799, 15, 'Sahagún', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(800, 19, 'Saladoblanco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(801, 9, 'Salamina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(802, 21, 'Salamina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(803, 24, 'Salazar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(804, 30, 'Saldaña', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(805, 26, 'Salento', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(806, 2, 'Salgar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(807, 8, 'Samacá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(808, 9, 'Samaná', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(809, 23, 'Samaniego', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(810, 29, 'Sampués', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(811, 19, 'San Agustín', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(812, 13, 'San Alberto', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(813, 4, 'San Andrés', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(814, 28, 'San Andrés', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(815, 2, 'San Andrés de Cuerquía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(816, 23, 'San Andrés de Tumaco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(817, 15, 'San Andrés Sotavento', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(818, 15, 'San Antero', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(819, 30, 'San Antonio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(820, 16, 'San Antonio del Tequendama', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(821, 28, 'San Benito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(822, 29, 'San Benito Abad', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(823, 16, 'San Bernardo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(824, 23, 'San Bernardo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(825, 15, 'San Bernardo del Viento', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(826, 24, 'San Calixto', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(827, 2, 'San Carlos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(828, 15, 'San Carlos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(829, 22, 'San Carlos de Guaroa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(830, 16, 'San Cayetano', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(831, 24, 'San Cayetano', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(832, 7, 'San Cristóbal', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(833, 13, 'San Diego', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(834, 8, 'San Eduardo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(835, 7, 'San Estanislao', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(836, 17, 'San Felipe', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(837, 7, 'San Fernando', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(838, 2, 'San Francisco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(839, 16, 'San Francisco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(840, 25, 'San Francisco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(841, 28, 'San Gil', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(842, 7, 'San Jacinto', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(843, 7, 'San Jacinto del Cauca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(844, 2, 'San Jerónimo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(845, 28, 'San Joaquín', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(846, 9, 'San José', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(847, 2, 'San José de La Montaña', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(848, 28, 'San José de Miranda', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(849, 8, 'San José de Pare', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(850, 15, 'San José de Uré', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(851, 10, 'San José del Fragua', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(852, 18, 'San José del Guaviare', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(853, 14, 'San José del Palmar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(854, 22, 'San Juan de Arama', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(855, 29, 'San Juan de Betulia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(856, 16, 'San Juan de Río Seco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(857, 2, 'San Juan de Urabá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(858, 20, 'San Juan del Cesar', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(859, 7, 'San Juan Nepomuceno', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(860, 22, 'San Juanito', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(861, 23, 'San Lorenzo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(862, 2, 'San Luis', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(863, 30, 'San Luis', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(864, 8, 'San Luis de Gaceno', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(865, 11, 'San Luis de Gaceno', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(866, 29, 'San Luis de Sincé', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(867, 29, 'San Marcos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(868, 13, 'San Martín', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(869, 22, 'San Martín', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(870, 7, 'San Martín de Loba', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(871, 8, 'San Mateo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(872, 25, 'San Miguel', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(873, 28, 'San Miguel', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(874, 8, 'San Miguel de Sema', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(875, 29, 'San Onofre', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(876, 23, 'San Pablo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(877, 7, 'San Pablo de Borbur', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(878, 8, 'San Pablo de Borbur', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(879, 2, 'San Pedro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(880, 29, 'San Pedro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(881, 31, 'San Pedro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(882, 23, 'San Pedro de Cartago', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(883, 2, 'San Pedro de Uraba', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(884, 15, 'San Pelayo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(885, 2, 'San Rafael', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(886, 2, 'San Roque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(887, 12, 'San Sebastián', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(888, 21, 'San Sebastián de Buenavista', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(889, 2, 'San Vicente', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(890, 28, 'San Vicente de Chucurí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(891, 10, 'San Vicente del Caguán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(892, 21, 'San Zenón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(893, 23, 'Sandoná', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(894, 21, 'Santa Ana', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(895, 2, 'Santa Bárbara', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(896, 23, 'Santa Bárbara', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(897, 28, 'Santa Bárbara', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(898, 21, 'Santa Bárbara de Pinto', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(899, 7, 'Santa Catalina', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(900, 28, 'Santa Helena del Opón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(901, 30, 'Santa Isabel', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(902, 5, 'Santa Lucía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(903, 8, 'Santa María', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(904, 19, 'Santa María', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(905, 21, 'Santa Marta', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(906, 7, 'Santa Rosa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(907, 12, 'Santa Rosa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(908, 27, 'Santa Rosa de Cabal', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(909, 2, 'Santa Rosa de Osos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(910, 8, 'Santa Rosa de Viterbo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(911, 7, 'Santa Rosa del Sur', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(912, 33, 'Santa Rosalía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(913, 8, 'Santa Sofía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(914, 23, 'Santacruz', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(915, 2, 'Santafé de Antioquia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(916, 8, 'Santana', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(917, 12, 'Santander de Quilichao', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(918, 24, 'Santiago', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(919, 25, 'Santiago', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(920, 29, 'Santiago de Tolú', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(921, 2, 'Santo Domingo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(922, 5, 'Santo Tomás', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(923, 27, 'Santuario', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(924, 23, 'Sapuyes', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(925, 3, 'Saravena', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(926, 24, 'Sardinata', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(927, 16, 'Sasaima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(928, 8, 'Sativanorte', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(929, 8, 'Sativasur', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(930, 2, 'Segovia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(931, 16, 'Sesquilé', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(932, 31, 'Sevilla', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(933, 8, 'Siachoque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(934, 16, 'Sibaté', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(935, 25, 'Sibundoy', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(936, 24, 'Silos', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(937, 16, 'Silvania', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(938, 12, 'Silvia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(939, 28, 'Simacota', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(940, 16, 'Simijaca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(941, 7, 'Simití', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(942, 29, 'Sincelejo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(943, 14, 'Sipí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(944, 21, 'Sitionuevo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(945, 16, 'Soacha', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(946, 8, 'Soatá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(947, 8, 'Socha', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(948, 28, 'Socorro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(949, 8, 'Socotá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(950, 8, 'Sogamoso', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(951, 10, 'Solano', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(952, 5, 'Soledad', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(953, 10, 'Solita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(954, 8, 'Somondoco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(955, 2, 'Sonsón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(956, 2, 'Sopetrán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(957, 7, 'Soplaviento', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(958, 16, 'Sopó', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(959, 8, 'Sora', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(960, 8, 'Soracá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(961, 8, 'Sotaquirá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(962, 12, 'Sotara', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(963, 28, 'Suaita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(964, 5, 'Suan', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(965, 12, 'Suárez', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(966, 30, 'Suárez', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(967, 19, 'Suaza', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(968, 16, 'Subachoque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(969, 12, 'Sucre', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(970, 28, 'Sucre', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(971, 29, 'Sucre', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(972, 16, 'Suesca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(973, 16, 'Supatá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(974, 9, 'Supía', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(975, 28, 'Suratá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(976, 16, 'Susa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(977, 8, 'Susacón', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(978, 8, 'Sutamarchán', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(979, 16, 'Sutatausa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(980, 8, 'Sutatenza', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(981, 16, 'Tabio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(982, 14, 'Tadó', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(983, 7, 'Talaigua Nuevo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(984, 13, 'Tamalameque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(985, 11, 'Támara', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(986, 3, 'Tame', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(987, 2, 'Támesis', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(988, 23, 'Taminango', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(989, 23, 'Tangua', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(990, 32, 'Taraira', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(991, 1, 'Tarapacá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(992, 2, 'Tarazá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(993, 19, 'Tarqui', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(994, 2, 'Tarso', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(995, 8, 'Tasco', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(996, 11, 'Tauramena', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(997, 16, 'Tausa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(998, 19, 'Tello', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(999, 16, 'Tena', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1000, 21, 'Tenerife', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1001, 16, 'Tenjo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1002, 8, 'Tenza', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1003, 24, 'Teorama', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1004, 19, 'Teruel', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1005, 19, 'Tesalia', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1006, 16, 'Tibacuy', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1007, 8, 'Tibaná', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1008, 8, 'Tibasosa', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1009, 16, 'Tibirita', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1010, 24, 'Tibú', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1011, 15, 'Tierralta', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1012, 19, 'Timaná', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1013, 12, 'Timbío', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1014, 12, 'Timbiquí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1015, 8, 'Tinjacá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1016, 8, 'Tipacoque', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1017, 7, 'Tiquisio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1018, 2, 'Titiribí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1019, 8, 'Toca', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1020, 16, 'Tocaima', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1021, 16, 'Tocancipá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1022, 8, 'Togüí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1023, 2, 'Toledo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1024, 24, 'Toledo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1025, 29, 'Tolú Viejo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1026, 28, 'Tona', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1027, 8, 'Tópaga', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1028, 16, 'Topaipí', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1029, 12, 'Toribio', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1030, 31, 'Toro', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1031, 8, 'Tota', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1032, 12, 'Totoró', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1033, 11, 'Trinidad', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1034, 31, 'Trujillo', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1035, 5, 'Tubará', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1036, 15, 'Tuchín', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1037, 31, 'Tuluá', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1038, 8, 'Tunja', '2025-04-22 21:00:44', '2025-04-22 21:00:44'),
(1039, 8, 'Tununguá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1040, 23, 'Túquerres', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1041, 7, 'Turbaco', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1042, 7, 'Turbaná', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1043, 2, 'Turbo', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1044, 8, 'Turmequé', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1045, 8, 'Tuta', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1046, 8, 'Tutazá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1047, 16, 'Ubalá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1048, 16, 'Ubaque', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1049, 31, 'Ulloa', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1050, 8, 'Umbita', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1051, 16, 'Une', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1052, 14, 'Unguía', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1053, 14, 'Unión Panamericana', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1054, 2, 'Uramita', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1055, 22, 'Uribe', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1056, 20, 'Uribia', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1057, 2, 'Urrao', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1058, 20, 'Urumita', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1059, 5, 'Usiacurí', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1060, 16, 'Útica', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1061, 2, 'Valdivia', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1062, 15, 'Valencia', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1063, 25, 'Valle de Guamez', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1064, 28, 'Valle de San José', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1065, 30, 'Valle de San Juan', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1066, 13, 'Valledupar', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1067, 2, 'Valparaíso', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1068, 10, 'Valparaíso', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1069, 2, 'Vegachí', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1070, 28, 'Vélez', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1071, 30, 'Venadillo', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1072, 2, 'Venecia', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1073, 16, 'Venecia', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1074, 8, 'Ventaquemada', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1075, 16, 'Vergara', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1076, 31, 'Versalles', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1077, 28, 'Vetas', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1078, 16, 'Vianí', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1079, 9, 'Victoria', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1080, 2, 'Vigía del Fuerte', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1081, 31, 'Vijes', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1082, 24, 'Villa Caro', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1083, 8, 'Villa de Leyva', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1084, 16, 'Villa de San Diego de Ubate', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1085, 24, 'Villa del Rosario', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1086, 12, 'Villa Rica', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1087, 25, 'Villagarzón', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1088, 16, 'Villagómez', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1089, 30, 'Villahermosa', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1090, 9, 'Villamaría', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1091, 7, 'Villanueva', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1092, 11, 'Villanueva', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1093, 20, 'Villanueva', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1094, 28, 'Villanueva', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1095, 16, 'Villapinzón', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1096, 30, 'Villarrica', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1097, 22, 'Villavicencio', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1098, 19, 'Villavieja', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1099, 16, 'Villeta', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1100, 16, 'Viotá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1101, 8, 'Viracachá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1102, 22, 'Vista Hermosa', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1103, 9, 'Viterbo', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1104, 16, 'Yacopí', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1105, 23, 'Yacuanquer', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1106, 19, 'Yaguará', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1107, 2, 'Yalí', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1108, 2, 'Yarumal', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1109, 32, 'Yavaraté', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1110, 2, 'Yolombó', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1111, 2, 'Yondó', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1112, 11, 'Yopal', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1113, 31, 'Yotoco', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1114, 31, 'Yumbo', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1115, 7, 'Zambrano', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1116, 28, 'Zapatoca', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1117, 21, 'Zapayán', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1118, 2, 'Zaragoza', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1119, 31, 'Zarzal', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1120, 8, 'Zetaquira', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1121, 16, 'Zipacón', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1122, 16, 'Zipaquirá', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1123, 21, 'Zona Bananera', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(1124, 34, 'Sin Municipio', '2025-04-22 21:00:45', '2025-04-22 21:00:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Colombia', '2025-04-22 21:00:42', '2025-04-22 21:00:42'),
(2, 'Otro', '2025-04-22 21:00:42', '2025-04-22 21:00:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id_programa` smallint(5) UNSIGNED NOT NULL,
  `institucion_id` smallint(5) UNSIGNED NOT NULL,
  `facultad_id` smallint(5) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo_snies` varchar(20) DEFAULT NULL,
  `tipo_formacion` enum('Técnico','Tecnólogo','Profesional') NOT NULL,
  `metodologia` enum('Presencial','Virtual','Híbrido') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id_programa`, `institucion_id`, `facultad_id`, `nombre`, `codigo_snies`, `tipo_formacion`, `metodologia`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 'Ingeniería Electrónica y Telecomunicaciones', '3104', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(2, 5, 1, 'Ingeniería Civil', '1105', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(3, 5, 2, 'Ingeniería de Sistemas', '1050', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(4, 5, 2, 'Ingeniería en Automática Industrial', '1106', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(5, 5, 2, 'Ingeniería Física', '1107', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(6, 4, 3, 'Ingeniería de Sistemas', '2612', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(7, 4, 3, 'Ingeniería Industrial', '2555', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(8, 4, 3, 'Arquitectura', '3615', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(9, 3, 4, 'Ingeniería Informática', '106716', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(10, 3, 4, 'Ingeniería Electrónica', '54559', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(11, 3, 4, 'Tecnología en Desarrollo de Software', '1108', 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(12, 1, 5, 'Ingeniería de Software y Computación', '110398', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(13, 1, 5, 'Ingeniería Electrónica', '20415', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(14, 1, 5, 'Ingeniería Civil', '111155', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(15, 1, 5, 'Ingeniería Energética', '110670', 'Profesional', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(16, 2, NULL, 'Tecnólogo en Análisis y Desarrollo de Software', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(17, 2, NULL, 'Técnico en Sistemas', NULL, 'Técnico', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(18, 2, NULL, 'Tecnólogo en Gestión de Redes de Datos', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(19, 2, NULL, 'Tecnólogo en Producción Multimedia', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(20, 2, NULL, 'Técnico en Programación de Software', NULL, 'Técnico', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(21, 2, NULL, 'Tecnólogo en Implementación de Infraestructura de Tecnologías de la Información y las Comunicaciones', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(22, 2, NULL, 'Tecnólogo en Gestión de la Seguridad y Salud en el Trabajo', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(23, 2, NULL, 'Tecnólogo en Gestión de Proyectos de Desarrollo de Software', NULL, 'Tecnólogo', 'Presencial', '2025-04-22 21:00:45', '2025-04-22 21:00:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(1, 'Aspirante'),
(2, 'Coordinador'),
(3, 'Decano'),
(4, 'Vicerrector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitud` smallint(5) UNSIGNED NOT NULL,
  `usuario_id` smallint(5) UNSIGNED NOT NULL,
  `programa_destino_id` smallint(5) UNSIGNED NOT NULL,
  `finalizo_estudios` enum('Si','No') NOT NULL DEFAULT 'No',
  `fecha_finalizacion_estudios` date DEFAULT NULL,
  `fecha_ultimo_semestre_cursado` date DEFAULT NULL,
  `estado` enum('Radicado','En revisión','Aprobado','Rechazado','Cerrado') NOT NULL DEFAULT 'Radicado',
  `numero_radicado` varchar(50) NOT NULL,
  `fecha_solicitud` timestamp NOT NULL DEFAULT current_timestamp(),
  `ruta_pdf_resolucion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id_solicitud`, `usuario_id`, `programa_destino_id`, `finalizo_estudios`, `fecha_finalizacion_estudios`, `fecha_ultimo_semestre_cursado`, `estado`, `numero_radicado`, `fecha_solicitud`, `ruta_pdf_resolucion`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 'No', NULL, '2023-12-01', 'Radicado', 'HOM-2025-0001', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(2, 2, 12, 'No', NULL, '2023-06-15', 'En revisión', 'HOM-2025-0002', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(3, 3, 12, 'No', NULL, '2022-12-01', 'Radicado', 'HOM-2025-0003', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(4, 4, 12, 'Si', '2023-05-30', NULL, 'En revisión', 'HOM-2025-0004', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(5, 5, 12, 'Si', '2022-11-15', NULL, 'Aprobado', 'HOM-2025-0005', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49'),
(6, 6, 12, 'Si', '2022-10-10', NULL, 'Rechazado', 'HOM-2025-0006', '2025-04-22 16:00:49', NULL, '2025-04-22 21:00:49', '2025-04-22 21:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_asignaturas`
--

CREATE TABLE `solicitud_asignaturas` (
  `id_solicitud_asignatura` smallint(5) UNSIGNED NOT NULL,
  `solicitud_id` smallint(5) UNSIGNED NOT NULL,
  `asignatura_id` smallint(5) UNSIGNED NOT NULL,
  `nota_origen` decimal(3,1) DEFAULT NULL,
  `horas_sena` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` smallint(5) UNSIGNED NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `tipo_identificacion` enum('Tarjeta de Identidad','Cédula de Ciudadanía','Cédula de Extranjería') NOT NULL,
  `numero_identificacion` varchar(20) DEFAULT NULL,
  `institucion_origen_id` smallint(5) UNSIGNED DEFAULT NULL,
  `facultad_id` smallint(5) UNSIGNED DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `pais_id` smallint(5) UNSIGNED DEFAULT NULL,
  `departamento_id` smallint(5) UNSIGNED DEFAULT NULL,
  `municipio_id` smallint(5) UNSIGNED DEFAULT NULL,
  `rol_id` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `email`, `email_verified_at`, `password`, `tipo_identificacion`, `numero_identificacion`, `institucion_origen_id`, `facultad_id`, `telefono`, `direccion`, `pais_id`, `departamento_id`, `municipio_id`, `rol_id`, `activo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Laura', 'Isabel', 'Martínez', 'Gómez', 'laura.martinez@example.com', NULL, '$2y$12$hKD23GcUFVi6cSTMvo7uwemOYRQ1GAz5qSB3v5NMkvSpFF3FYtKxC', 'Cédula de Ciudadanía', '1122334455', 1, 5, '3123456789', 'Calle 10 #5-45', 1, 12, 703, 1, 1, NULL, '2025-04-22 21:00:45', '2025-04-22 21:00:45'),
(2, 'Carlos', 'Eduardo', 'López', 'Ruiz', 'carlos.lopez@example.com', NULL, '$2y$12$rfQFQenhh8Hz.3wNxmL1Euz02scYHWBrgpBxMkdk3EGmQDTamdKMe', 'Cédula de Ciudadanía', '2233445566', 4, 3, '3114567890', 'Carrera 15 #6-30', 1, 12, 703, 1, 1, NULL, '2025-04-22 21:00:46', '2025-04-22 21:00:46'),
(3, 'Andrea', NULL, 'Sánchez', 'Valencia', 'andrea.sanchez@example.com', NULL, '$2y$12$NQWJk8hxbWQ59sb//DwyteFggGtEEihU1suQkmaRdqVb5LkLHEXMy', 'Cédula de Ciudadanía', '3344556677', 3, 4, NULL, 'Av. Panamericana #12-34', 1, 12, 703, 1, 1, NULL, '2025-04-22 21:00:46', '2025-04-22 21:00:46'),
(4, 'Luis', 'Fernando', 'Rodríguez', 'Mora', 'luis.rodriguez@example.com', NULL, '$2y$12$M.QaS8gjd/5MH3fAd6HxFObmDivIRqb4s14apvO8Q0PRsQ/LlZmWq', 'Cédula de Ciudadanía', '4455667788', 5, 2, NULL, 'Cra 3 #20-60', 1, 12, 703, 1, 1, NULL, '2025-04-22 21:00:47', '2025-04-22 21:00:47'),
(5, 'Miguel', 'Andrés', 'Herrera', 'Pérez', 'miguel.herrera@example.com', NULL, '$2y$12$bSpiC1WLHTmnuCuRndHTZOIenQXf.xW00OdDdDg4lQR2F.ACOuxP6', 'Cédula de Extranjería', 'EX12345678', 5, 1, '3007894561', 'Calle Internacional #99', 2, NULL, NULL, 1, 1, NULL, '2025-04-22 21:00:47', '2025-04-22 21:00:47'),
(6, 'Juliana', NULL, 'Patiño', 'Córdoba', 'juliana.patino@example.com', NULL, '$2y$12$ow22fSp0853xNg4luL9CguebBt9JzfHsuMWd4MKIh5UQ.haOvwKzi', 'Cédula de Ciudadanía', '5566778899', 2, NULL, '3139876543', 'Mz H Casa 25', 1, 12, 703, 1, 1, NULL, '2025-04-22 21:00:48', '2025-04-22 21:00:48'),
(7, 'Sebastián', 'David', 'Cano', 'Velasco', 'sebastian.cano@example.com', NULL, '$2y$12$lIBaYkpPlYD7RT/vX5.gnu1F3g.iW3ZwcKd7RvvM/8p0y27FANoMS', 'Cédula de Ciudadanía', '6677889900', 1, 5, '3101122334', 'Calle 21 #7-12', 1, 12, 703, 2, 1, NULL, '2025-04-22 21:00:48', '2025-04-22 21:00:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD UNIQUE KEY `asignaturas_codigo_asignatura_unique` (`codigo_asignatura`),
  ADD KEY `asignaturas_programa_id_foreign` (`programa_id`);

--
-- Indices de la tabla `contenidos_programaticos`
--
ALTER TABLE `contenidos_programaticos`
  ADD PRIMARY KEY (`id_contenido`),
  ADD KEY `contenidos_programaticos_asignatura_id_foreign` (`asignatura_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `departamentos_pais_id_foreign` (`pais_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `documentos_solicitud_id_foreign` (`solicitud_id`),
  ADD KEY `documentos_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD PRIMARY KEY (`id_facultad`),
  ADD KEY `facultades_institucion_id_foreign` (`institucion_id`);

--
-- Indices de la tabla `historial_homologaciones`
--
ALTER TABLE `historial_homologaciones`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `historial_homologaciones_solicitud_id_foreign` (`solicitud_id`),
  ADD KEY `historial_homologaciones_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `homologacion_asignaturas`
--
ALTER TABLE `homologacion_asignaturas`
  ADD PRIMARY KEY (`id_homologacion`),
  ADD KEY `homologacion_asignaturas_solicitud_id_foreign` (`solicitud_id`),
  ADD KEY `homologacion_asignaturas_asignatura_origen_id_foreign` (`asignatura_origen_id`),
  ADD KEY `homologacion_asignaturas_asignatura_destino_id_foreign` (`asignatura_destino_id`);

--
-- Indices de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD PRIMARY KEY (`id_institucion`),
  ADD UNIQUE KEY `instituciones_codigo_ies_unique` (`codigo_ies`),
  ADD KEY `instituciones_municipio_id_foreign` (`municipio_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `municipios_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id_programa`),
  ADD UNIQUE KEY `programas_codigo_snies_unique` (`codigo_snies`),
  ADD KEY `programas_institucion_id_foreign` (`institucion_id`),
  ADD KEY `programas_facultad_id_foreign` (`facultad_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD UNIQUE KEY `solicitudes_numero_radicado_unique` (`numero_radicado`),
  ADD KEY `solicitudes_usuario_id_foreign` (`usuario_id`),
  ADD KEY `solicitudes_programa_destino_id_foreign` (`programa_destino_id`);

--
-- Indices de la tabla `solicitud_asignaturas`
--
ALTER TABLE `solicitud_asignaturas`
  ADD PRIMARY KEY (`id_solicitud_asignatura`),
  ADD KEY `solicitud_asignaturas_solicitud_id_foreign` (`solicitud_id`),
  ADD KEY `solicitud_asignaturas_asignatura_id_foreign` (`asignatura_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_numero_identificacion_unique` (`numero_identificacion`),
  ADD KEY `users_pais_id_foreign` (`pais_id`),
  ADD KEY `users_departamento_id_foreign` (`departamento_id`),
  ADD KEY `users_municipio_id_foreign` (`municipio_id`),
  ADD KEY `users_institucion_origen_id_foreign` (`institucion_origen_id`),
  ADD KEY `users_rol_id_foreign` (`rol_id`),
  ADD KEY `users_facultad_id_foreign` (`facultad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id_asignatura` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `contenidos_programaticos`
--
ALTER TABLE `contenidos_programaticos`
  MODIFY `id_contenido` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `facultades`
--
ALTER TABLE `facultades`
  MODIFY `id_facultad` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_homologaciones`
--
ALTER TABLE `historial_homologaciones`
  MODIFY `id_historial` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `homologacion_asignaturas`
--
ALTER TABLE `homologacion_asignaturas`
  MODIFY `id_homologacion` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `id_institucion` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1125;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id_programa` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitud` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `solicitud_asignaturas`
--
ALTER TABLE `solicitud_asignaturas`
  MODIFY `id_solicitud_asignatura` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuario` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id_programa`);

--
-- Filtros para la tabla `contenidos_programaticos`
--
ALTER TABLE `contenidos_programaticos`
  ADD CONSTRAINT `contenidos_programaticos_asignatura_id_foreign` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id_asignatura`) ON DELETE CASCADE;

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id_pais`);

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_solicitud_id_foreign` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id_solicitud`),
  ADD CONSTRAINT `documentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id_usuario`);

--
-- Filtros para la tabla `facultades`
--
ALTER TABLE `facultades`
  ADD CONSTRAINT `facultades_institucion_id_foreign` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id_institucion`);

--
-- Filtros para la tabla `historial_homologaciones`
--
ALTER TABLE `historial_homologaciones`
  ADD CONSTRAINT `historial_homologaciones_solicitud_id_foreign` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id_solicitud`),
  ADD CONSTRAINT `historial_homologaciones_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id_usuario`);

--
-- Filtros para la tabla `homologacion_asignaturas`
--
ALTER TABLE `homologacion_asignaturas`
  ADD CONSTRAINT `homologacion_asignaturas_asignatura_destino_id_foreign` FOREIGN KEY (`asignatura_destino_id`) REFERENCES `asignaturas` (`id_asignatura`),
  ADD CONSTRAINT `homologacion_asignaturas_asignatura_origen_id_foreign` FOREIGN KEY (`asignatura_origen_id`) REFERENCES `asignaturas` (`id_asignatura`),
  ADD CONSTRAINT `homologacion_asignaturas_solicitud_id_foreign` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id_solicitud`);

--
-- Filtros para la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD CONSTRAINT `instituciones_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id_municipio`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`);

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `programas_facultad_id_foreign` FOREIGN KEY (`facultad_id`) REFERENCES `facultades` (`id_facultad`),
  ADD CONSTRAINT `programas_institucion_id_foreign` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id_institucion`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_programa_destino_id_foreign` FOREIGN KEY (`programa_destino_id`) REFERENCES `programas` (`id_programa`),
  ADD CONSTRAINT `solicitudes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id_usuario`);

--
-- Filtros para la tabla `solicitud_asignaturas`
--
ALTER TABLE `solicitud_asignaturas`
  ADD CONSTRAINT `solicitud_asignaturas_asignatura_id_foreign` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id_asignatura`),
  ADD CONSTRAINT `solicitud_asignaturas_solicitud_id_foreign` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id_solicitud`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `users_facultad_id_foreign` FOREIGN KEY (`facultad_id`) REFERENCES `facultades` (`id_facultad`),
  ADD CONSTRAINT `users_institucion_origen_id_foreign` FOREIGN KEY (`institucion_origen_id`) REFERENCES `instituciones` (`id_institucion`),
  ADD CONSTRAINT `users_municipio_id_foreign` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `users_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id_pais`),
  ADD CONSTRAINT `users_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
