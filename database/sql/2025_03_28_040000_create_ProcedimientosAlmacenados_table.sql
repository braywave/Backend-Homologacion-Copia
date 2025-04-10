// actualizar  países

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPais`(IN paisId INT, IN nombrePais VARCHAR(100))
BEGIN
    UPDATE paises SET nombre = nombrePais WHERE id_pais = paisId;
END$$
DELIMITER ;

// eliminar país

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPais`(IN paisId INT)
BEGIN
    DELETE FROM paises WHERE id_pais = paisId;
END$$
DELIMITER ;

// insertar país

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPais`(IN nombrePais VARCHAR(100))
BEGIN
    INSERT INTO paises (nombre) VALUES (nombrePais);
END$$
DELIMITER ;


// obtener país por id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaisPorId`(IN paisId INT)
BEGIN
    SELECT * FROM paises WHERE id_pais = paisId;
END$$
DELIMITER ;

 //obtener países

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaises`()
BEGIN
    SELECT * FROM paises ORDER BY nombre ASC;
END$$
DELIMITER ;




// Rutas para departamentos

// eliminar departamento

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento`(
    IN departamentoId INT
)
BEGIN
    DELETE FROM departamentos WHERE id_departamento = departamentoId;
END$$
DELIMITER ;

//actualizar departamentos

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDepartamento`(IN `departamentoId` INT, IN `nombreDepartamento` VARCHAR(255), IN `paisId` INT)
BEGIN
    UPDATE departamentos
    SET nombre = nombreDepartamento, pais_id = paisId
    WHERE id_departamento = departamentoId;
END$$
DELIMITER ;


// insertar departamentos

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDepartamento`(
    IN departamentoId INT,
    IN nombreDepartamento VARCHAR(255),
    IN paisId INT
)
BEGIN
    INSERT INTO departamentos (id_departamento, nombre, pais_id)
    VALUES (departamentoId, nombreDepartamento, paisId);
END$$
DELIMITER ;




//obtener departamentos id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentoPorId`(IN departamentoId INT)
BEGIN
    SELECT * FROM departamentos WHERE id_departamento = departamentoId;
END$$
DELIMITER ;



//obtener departamentos

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentos`()
BEGIN
    SELECT * FROM departamentos ORDER BY nombre ASC;
END$$
DELIMITER ;



// Rutas para municipios

// actualizar municipios

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMunicipio`(IN `municipioId` INT, IN `nombreMunicipio` VARCHAR(255), IN `departamentoId` INT)
BEGIN
    UPDATE municipios
    SET nombre = nombreMunicipio, departamento_id = departamentoId
    WHERE id_municipio = municipioId;
END$$
DELIMITER ;

// elimina un municipio

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio`(IN municipioId INT)
BEGIN
    DELETE FROM municipios WHERE id_municipio = municipioId;
END$$
DELIMITER ;

//insertar municipio

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarMunicipio`(
    IN nombreMunicipio VARCHAR(255),
    IN departamentoId INT
)
BEGIN
    INSERT INTO municipios (nombre, departamento_id)
    VALUES (nombreMunicipio, departamentoId);
END$$
DELIMITER ;

 // obtener municipio id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipioPorId`(IN municipioId INT)
BEGIN
    SELECT * FROM municipios WHERE id_municipio = municipioId;
END$$
DELIMITER ;

// obtener municipios

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipios`()
BEGIN
    SELECT * FROM municipios ORDER BY nombre ASC;
END$$
DELIMITER ;




// Rutas para instituciones

// actualizar instituciones

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarInstitucion`(
    IN institucionId INT,
    IN p_nombre VARCHAR(255),
    IN p_codigo_ies VARCHAR(50),
    IN p_municipio_id INT,
    IN p_tipo VARCHAR(50)
)
BEGIN
    UPDATE instituciones
    SET nombre = p_nombre,
        codigo_ies = p_codigo_ies,
        municipio_id = p_municipio_id,
        tipo = p_tipo
    WHERE id_institucion = institucionId;
END$$
DELIMITER ;

// eliminar institución

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarInstitucion`(IN institucionId INT)
BEGIN
    DELETE FROM instituciones WHERE id_institucion = institucionId;
END$$
DELIMITER ;

// insertar institucion

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarInstitucion`(
    IN nombreInstitucion VARCHAR(255),
    IN codigoIes VARCHAR(20),
    IN municipioId INT,
    IN tipoInstitucion VARCHAR(100)
)
BEGIN
    INSERT INTO instituciones (nombre, codigo_ies, municipio_id, tipo)
    VALUES (nombreInstitucion, codigoIes, municipioId, tipoInstitucion);
END$$
DELIMITER ;

// obtener institución id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstitucionPorId`(IN institucionId INT)
BEGIN
    SELECT * FROM instituciones WHERE id_institucion = institucionId;
END$$
DELIMITER ;

//obtener instituciones

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstituciones`()
BEGIN
    SELECT * FROM instituciones ORDER BY nombre ASC;
END$$
DELIMITER ;


// Rutas para programas

// actualizar programa

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPrograma`(
    IN programaId INT,
    IN p_institucion_id INT,
    IN p_facultad_id INT,
    IN p_nombre VARCHAR(255),
    IN p_codigo_snies VARCHAR(20),
    IN p_tipo_formacion ENUM('Técnico', 'Tecnólogo', 'Profesional'),
    IN p_metodologia ENUM('Presencial','Virtual','Híbrido')
)
BEGIN
    UPDATE programas
    SET institucion_id = p_institucion_id, facultad_id = p_facultad_id, nombre = p_nombre, codigo_snies = p_codigo_snies, tipo_formacion = p_tipo_formacion, metodologia = p_metodologia
    WHERE id_programa = programaId;
END$$
DELIMITER ;

// eliminar programa

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPrograma`(IN programaId INT)
BEGIN
    DELETE FROM programas WHERE id_programa = programaId;
END$$
DELIMITER ;

//insertar programa

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPrograma`(
    IN p_institucion_id INT,
    IN p_facultad_id INT,
    IN p_nombre VARCHAR(255),
    IN p_codigo_snies VARCHAR(20),
    IN p_tipo_formacion ENUM('Técnico', 'Tecnólogo', 'Profesional'),
    IN p_metodologia ENUM('Presencial','Virtual','Híbrido')
)
BEGIN
    INSERT INTO programas (institucion_id, facultad_id, nombre, codigo_snies, tipo_formacion, metodologia)
    VALUES (p_institucion_id, p_facultad_id, p_nombre, p_codigo_snies, p_tipo_formacion, p_metodologia);
END$$
DELIMITER ;

// obtener programa por id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramaPorId`(IN programaId INT)
BEGIN
    SELECT * FROM programas WHERE id_programa = programaId;
END$$
DELIMITER ;

// obtener programa

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramas`()
BEGIN
    SELECT * FROM programas ORDER BY nombre ASC;
END$$
DELIMITER ;


// Rutas para asignaturas

// actualizar asignatura

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAsignatura`(
    IN p_id_asignatura SMALLINT,
    IN p_programas_id SMALLINT,
    IN p_nombre VARCHAR(255),
    IN p_tipo ENUM('Materias', 'Competencia'),
    IN p_codigo_asignatura VARCHAR(30),
    IN p_creditos INT,
    IN p_semestre INT,
    IN p_horas INT,
    IN p_tiempo_presencial INT,
    IN p_tiempo_independiente INT,
    IN p_horas_totales_semanales INT,
    IN p_modalidad ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN p_metodologia ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
    UPDATE asignaturas
    SET
        programas_id = p_programas_id,
        nombre = p_nombre,
        tipo = p_tipo,
        codigo_asignatura = p_codigo_asignatura,
        creditos = p_creditos,
        semestre = p_semestre,
        horas = p_horas,
        tiempo_presencial = p_tiempo_presencial,
        tiempo_independiente = p_tiempo_independiente,
        horas_totales_semanales = p_horas_totales_semanales,
        modalidad = p_modalidad,
        metodologia = p_metodologia,
        updated_at = NOW()
    WHERE id_asignatura = p_id_asignatura;
END$$
DELIMITER ;

//eliminar asignatura

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAsignatura`(IN asignaturaId INT)
BEGIN
    DELETE FROM asignaturas WHERE id_asignatura = asignaturaId;
END$$
DELIMITER ;

//insertar asignatura

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura`(
    IN p_programas_id SMALLINT,
    IN p_nombre VARCHAR(255),
    IN p_tipo ENUM('Materias', 'Competencia'),
    IN p_codigo_asignatura VARCHAR(30),
    IN p_creditos INT,
    IN p_semestre INT,
    IN p_horas INT,
    IN p_tiempo_presencial INT,
    IN p_tiempo_independiente INT,
    IN p_horas_totales_semanales INT,
    IN p_modalidad ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN p_metodologia ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
    INSERT INTO asignaturas (
        programas_id,
        nombre,
        tipo,
        codigo_asignatura,
        creditos,
        semestre,
        horas,
        tiempo_presencial,
        tiempo_independiente,
        horas_totales_semanales,
        modalidad,
        metodologia,
        created_at,
        updated_at
    ) VALUES (
        p_programas_id,
        p_nombre,
        p_tipo,
        p_codigo_asignatura,
        p_creditos,
        p_semestre,
        p_horas,
        p_tiempo_presencial,
        p_tiempo_independiente,
        p_horas_totales_semanales,
        p_modalidad,
        p_metodologia,
        NOW(),
        NOW()
    );
END$$
DELIMITER ;

// obtener asignaturas

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturas`()
BEGIN
    SELECT * FROM asignaturas ORDER BY nombre ASC;
END$$
DELIMITER ;

// obtener asignatura por id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturaPorId`(IN asignaturaId INT)
BEGIN
    SELECT * FROM asignaturas WHERE id_asignatura = asignaturaId;
END$$
DELIMITER ;

// Rutas para credenciales

// actualizar credenciales
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCredencial`(
    IN credencialId INT,
    IN p_usuario_id INT,
    IN p_contraseña VARCHAR(255)
)
BEGIN
    UPDATE credenciales
    SET usuario_id = p_usuario_id, contraseña = p_contraseña
    WHERE id_credencial = credencialId;
END$$
DELIMITER ;

//eliminar credenciales

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCredencial`(IN credencialId INT)
BEGIN
    DELETE FROM credenciales WHERE id_credencial = credencialId;
END$$
DELIMITER ;

//insertar credenciales

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCredencial`(
    IN p_usuario_id SMALLINT,
    IN p_contraseña VARCHAR(255)
)
BEGIN
    INSERT INTO credenciales (
        usuario_id,
        contraseña,
        created_at,
        updated_at
    ) VALUES (
        p_usuario_id,
        p_contraseña,
        NOW(),
        NOW()
    );
END$$
DELIMITER ;

//obtener credenciales por id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCredencialPorId`(IN credencialId INT)
BEGIN
    SELECT * FROM credenciales WHERE id_credencial = credencialId;
END$$
DELIMITER ;

//obtener credenciales

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCredenciales`()
BEGIN
    SELECT * FROM credenciales ORDER BY id_credencial ASC;
END$$
DELIMITER ;


 // Rutas para solicitudes

// actualizar solicitud

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSolicitud`(
    IN p_id_solicitud SMALLINT,
    IN p_usuario_id SMALLINT,
    IN p_programa_destino_id SMALLINT,
    IN p_finalizo_estudios ENUM('Si', 'No'),
    IN p_fecha_finalizacion_estudios DATE,
    IN p_fecha_ultimo_semestre_cursado DATE,
    IN p_estado ENUM('Radicado', 'En revisión', 'Aprobado', 'Rechazado', 'Cerrado'),
    IN p_numero_radicado VARCHAR(50),
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
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
DELIMITER ;

//eliminar solicitud

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitud`(IN p_id_solicitud SMALLINT)
BEGIN
    DELETE FROM solicitudes WHERE id_solicitud = p_id_solicitud;
END$$
DELIMITER ;

//insertar solicitud
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSolicitud`(
    IN p_usuario_id SMALLINT,
    IN p_programa_destino_id SMALLINT,
    IN p_finalizo_estudios ENUM('Si', 'No'),
    IN p_fecha_finalizacion_estudios DATE,
    IN p_fecha_ultimo_semestre_cursado DATE,
    IN p_estado ENUM('Radicado', 'En revisión', 'Aprobado', 'Rechazado', 'Cerrado'),
    IN p_numero_radicado VARCHAR(50),
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
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
    )
    VALUES (
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
DELIMITER ;

//obtener solicitud por id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudPorId`(IN p_id_solicitud SMALLINT)
BEGIN
    SELECT * FROM solicitudes WHERE id_solicitud = p_id_solicitud;
END$$
DELIMITER ;

// obtener solicitud

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudes`()
BEGIN
    SELECT * FROM solicitudes;
END$$
DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `usuarios`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarios`()
BEGIN
    SELECT * FROM usuarios ORDER BY primer_nombre ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarioPorId`(IN usuarioId INT)
BEGIN
    SELECT * FROM usuarios WHERE id_usuario = usuarioId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario`(
    IN p_primer_nombre VARCHAR(50),
    IN p_segundo_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_correo VARCHAR(100),
    IN p_tipo_identificacion ENUM('Tarjeta de Identidad', 'Cédula de Ciudadanía', 'Cédula de Extranjería'),
    IN p_numero_identificacion VARCHAR(20),
    IN p_institucion_origen_id INT,
    IN p_facultad_id INT,
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255),
    IN p_pais_id INT,
    IN p_departamento_id INT,
    IN p_municipio_id INT,
    IN p_rol_id INT
)
BEGIN
    INSERT INTO usuarios (
        primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
        correo, tipo_identificacion, numero_identificacion,
        institucion_origen_id, facultad_id, telefono, direccion,
        pais_id, departamento_id, municipio_id, rol_id,
        created_at, updated_at
    )
    VALUES (
        p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido,
        p_correo, p_tipo_identificacion, p_numero_identificacion,
        p_institucion_origen_id, p_facultad_id, p_telefono, p_direccion,
        p_pais_id, p_departamento_id, p_municipio_id, p_rol_id,
        NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario`(
    IN usuarioId INT,
    IN p_primer_nombre VARCHAR(50),
    IN p_segundo_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_correo VARCHAR(100),
    IN p_tipo_identificacion ENUM('Tarjeta de Identidad', 'Cédula de Ciudadanía', 'Cédula de Extranjería'),
    IN p_numero_identificacion VARCHAR(20),
    IN p_institucion_origen_id INT,
    IN p_facultad_id INT,
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255),
    IN p_pais_id INT,
    IN p_departamento_id INT,
    IN p_municipio_id INT,
    IN p_rol_id INT
)
BEGIN
    UPDATE usuarios
    SET primer_nombre = p_primer_nombre,
        segundo_nombre = p_segundo_nombre,
        primer_apellido = p_primer_apellido,
        segundo_apellido = p_segundo_apellido,
        correo = p_correo,
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
        updated_at = NOW()
    WHERE id_usuario = usuarioId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario`(IN usuarioId INT)
BEGIN
    DELETE FROM usuarios WHERE id_usuario = usuarioId;
END$$

DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `documentos`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentos`()
BEGIN
    SELECT * FROM documentos ORDER BY fecha_subida DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoPorId`(IN documentoId INT)
BEGIN
    SELECT * FROM documentos WHERE id_documento = documentoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDocumento`(
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_tipo VARCHAR(255),
    IN p_ruta VARCHAR(255)
)
BEGIN
    INSERT INTO documentos (
        solicitud_id, usuario_id, tipo, ruta, fecha_subida,
        created_at, updated_at
    )
    VALUES (
        p_solicitud_id, p_usuario_id, p_tipo, p_ruta, NOW(),
        NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumento`(
    IN documentoId INT,
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_tipo VARCHAR(255),
    IN p_ruta VARCHAR(255)
)
BEGIN
    UPDATE documentos
    SET solicitud_id = p_solicitud_id,
        usuario_id = p_usuario_id,
        tipo = p_tipo,
        ruta = p_ruta,
        updated_at = NOW()
    WHERE id_documento = documentoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDocumento`(IN documentoId INT)
BEGIN
    DELETE FROM documentos WHERE id_documento = documentoId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `facultades`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultades`()
BEGIN
    SELECT * FROM facultades ORDER BY nombre ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultadPorId`(IN facultadId INT)
BEGIN
    SELECT * FROM facultades WHERE id_facultad = facultadId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacultad`(
    IN p_institucion_id INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    INSERT INTO facultades (institucion_id, nombre, created_at, updated_at)
    VALUES (p_institucion_id, p_nombre, NOW(), NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFacultad`(
    IN facultadId INT,
    IN p_institucion_id INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    UPDATE facultades
    SET institucion_id = p_institucion_id,
        nombre = p_nombre,
        updated_at = NOW()
    WHERE id_facultad = facultadId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFacultad`(IN facultadId INT)
BEGIN
    DELETE FROM facultades WHERE id_facultad = facultadId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `roles`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRoles`()
BEGIN
    SELECT * FROM roles ORDER BY id_rol ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRolPorId`(IN rolId INT)
BEGIN
    SELECT * FROM roles WHERE id_rol = rolId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRol`(
    IN p_nombre VARCHAR(50) -- Cambio de ENUM a VARCHAR
)
BEGIN
    INSERT INTO roles (nombre, created_at, updated_at)
    VALUES (p_nombre, NOW(), NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRol`(
    IN rolId INT,
    IN p_nombre VARCHAR(50)
)
BEGIN
    UPDATE roles
    SET nombre = p_nombre,
        updated_at = NOW()
    WHERE id_rol = rolId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRol`(IN rolId INT)
BEGIN
    DELETE FROM roles WHERE id_rol = rolId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `contenidos_programaticos`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidosProgramaticos`()
BEGIN
    SELECT * FROM contenidos_programaticos ORDER BY tema ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidoProgramaticoPorId`(IN contenidoId INT)
BEGIN
    SELECT * FROM contenidos_programaticos WHERE id_contenido = contenidoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarContenidoProgramatico`(
    IN p_asignatura_id INT,
    IN p_tema VARCHAR(255),
    IN p_resultados_aprendizaje TEXT,
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO contenidos_programaticos (
        asignatura_id, tema, resultados_aprendizaje, descripcion, created_at, updated_at
    )
    VALUES (
        p_asignatura_id, p_tema, p_resultados_aprendizaje, p_descripcion, NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContenidoProgramatico`(
    IN contenidoId INT,
    IN p_asignatura_id INT,
    IN p_tema VARCHAR(255),
    IN p_resultados_aprendizaje TEXT,
    IN p_descripcion TEXT
)
BEGIN
    UPDATE contenidos_programaticos
    SET asignatura_id = p_asignatura_id,
        tema = p_tema,
        resultados_aprendizaje = p_resultados_aprendizaje,
        descripcion = p_descripcion,
        updated_at = NOW()
    WHERE id_contenido = contenidoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarContenidoProgramatico`(IN contenidoId INT)
BEGIN
    DELETE FROM contenidos_programaticos WHERE id_contenido = contenidoId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `historial_homologaciones`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHistorialHomologaciones`()
BEGIN
    SELECT * FROM historial_homologaciones ORDER BY fecha DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHistorialHomologacionPorId`(IN historialId INT)
BEGIN
    SELECT * FROM historial_homologaciones WHERE id_historial = historialId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHistorialHomologacion`(
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_estado ENUM('Radicado', 'En revisión', 'Evaluado', 'Aprobado', 'Rechazado', 'Apelación'),
    IN p_observaciones TEXT,
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    INSERT INTO historial_homologaciones (
        solicitud_id, usuario_id, estado, fecha, observaciones, ruta_pdf_resolucion, created_at, updated_at
    )
    VALUES (
        p_solicitud_id, p_usuario_id, p_estado, NOW(), p_observaciones, p_ruta_pdf_resolucion, NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHistorialHomologacion`(
    IN historialId INT,
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_estado ENUM('Radicado', 'En revisión', 'Evaluado', 'Aprobado', 'Rechazado', 'Apelación'),
    IN p_observaciones TEXT,
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    UPDATE historial_homologaciones
    SET solicitud_id = p_solicitud_id,
        usuario_id = p_usuario_id,
        estado = p_estado,
        observaciones = p_observaciones,
        ruta_pdf_resolucion = p_ruta_pdf_resolucion,
        updated_at = NOW()
    WHERE id_historial = historialId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHistorialHomologacion`(IN historialId INT)
BEGIN
    DELETE FROM historial_homologaciones WHERE id_historial = historialId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `solicitud_asignaturas`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturas`()
BEGIN
    SELECT * FROM solicitud_asignaturas ORDER BY id_solicitud_asignatura ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturaPorId`(IN solicitudAsignaturaId INT)
BEGIN
    SELECT * FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSolicitudAsignatura`(
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas INT
)
BEGIN
    INSERT INTO solicitud_asignaturas (
        solicitud_id, asignatura_id, nota_origen, horas, created_at, updated_at
    )
    VALUES (
        p_solicitud_id, p_asignatura_id, p_nota_origen, p_horas, NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSolicitudAsignatura`(
    IN solicitudAsignaturaId INT,
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas INT
)
BEGIN
    UPDATE solicitud_asignaturas
    SET solicitud_id = p_solicitud_id,
        asignatura_id = p_asignatura_id,
        nota_origen = p_nota_origen,
        horas = p_horas,
        updated_at = NOW()
    WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitudAsignatura`(IN solicitudAsignaturaId INT)
BEGIN
    DELETE FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END$$

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `homologacion_asignaturas`
-- ========================================================

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionesAsignaturas`()
BEGIN
    SELECT * FROM homologacion_asignaturas ORDER BY id_homologacion ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionAsignaturaPorId`(IN homologacionId INT)
BEGIN
    SELECT * FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHomologacionAsignatura`(
    IN p_solicitud_id INT,
    IN p_asignatura_origen_id INT,
    IN p_asignatura_destino_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_nota_destino DECIMAL(3,1),
    IN p_comentarios TEXT
)
BEGIN
    INSERT INTO homologacion_asignaturas (
        solicitud_id, asignatura_origen_id, asignatura_destino_id, nota_origen, nota_destino, comentarios, created_at, updated_at
    )
    VALUES (
        p_solicitud_id, p_asignatura_origen_id, p_asignatura_destino_id, p_nota_origen, p_nota_destino, p_comentarios, NOW(), NOW()
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHomologacionAsignatura`(
    IN homologacionId INT,
    IN p_solicitud_id INT,
    IN p_asignatura_origen_id INT,
    IN p_asignatura_destino_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_nota_destino DECIMAL(3,1),
    IN p_comentarios TEXT
)
BEGIN
    UPDATE homologacion_asignaturas
    SET solicitud_id = p_solicitud_id,
        asignatura_origen_id = p_asignatura_origen_id,
        asignatura_destino_id = p_asignatura_destino_id,
        nota_origen = p_nota_origen,
        nota_destino = p_nota_destino,
        comentarios = p_comentarios,
        updated_at = NOW()
    WHERE id_homologacion = homologacionId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHomologacionAsignatura`(IN homologacionId INT)
BEGIN
    DELETE FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
END$$

DELIMITER ;

