-- ========================================================
-- Procedimientos para la tabla `paises`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerPaises()
BEGIN
    SELECT * FROM paises ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerPaisPorId(IN paisId INT)
BEGIN
    SELECT * FROM paises WHERE id_pais = paisId;
END;
//

CREATE PROCEDURE InsertarPais(IN nombrePais VARCHAR(100))
BEGIN
    INSERT INTO paises (nombre) VALUES (nombrePais);
END;
//

CREATE PROCEDURE ActualizarPais(IN paisId INT, IN nombrePais VARCHAR(100))
BEGIN
    UPDATE paises SET nombre = nombrePais WHERE id_pais = paisId;
END;
//

CREATE PROCEDURE EliminarPais(IN paisId INT)
BEGIN
    DELETE FROM paises WHERE id_pais = paisId;
END;
//

-- ========================================================
-- Procedimientos para la tabla `departamentos`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerDepartamentos()
BEGIN
    SELECT * FROM departamentos ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerDepartamentoPorId(IN departamentoId INT)
BEGIN
    SELECT * FROM departamentos WHERE id_departamento = departamentoId;
END;
//

CREATE PROCEDURE InsertarDepartamento(IN nombreDepartamento VARCHAR(255), IN paisId INT, IN codigo INT)
BEGIN
    INSERT INTO departamentos (nombre, pais_id, codigo) VALUES (nombreDepartamento, paisId, codigo);
END;
//

CREATE PROCEDURE ActualizarDepartamento(IN departamentoId INT, IN nombreDepartamento VARCHAR(255), IN paisId INT, IN codigo INT)
BEGIN
    UPDATE departamentos
    SET nombre = nombreDepartamento, pais_id = paisId, codigo = codigo
    WHERE id_departamento = departamentoId;
END;
//

CREATE PROCEDURE EliminarDepartamento(IN departamentoId INT)
BEGIN
    DELETE FROM departamentos WHERE id_departamento = departamentoId;
END;
//
DELIMITER ;
-- ========================================================
-- Procedimientos para la tabla `municipios`
-- ========================================================

DELIMITER
//
CREATE PROCEDURE ObtenerMunicipios()
BEGIN
    SELECT * FROM municipios ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerMunicipioPorId(IN municipioId INT)
BEGIN
    SELECT * FROM municipios WHERE id_municipio = municipioId;
END;
//

CREATE PROCEDURE InsertarMunicipio(IN nombreMunicipio VARCHAR(255), IN codigo INT, IN departamentoId INT)
BEGIN
    INSERT INTO municipios (nombre, codigo, departamento_id) VALUES (nombreMunicipio, codigo, departamentoId);
END;
//

CREATE PROCEDURE ActualizarMunicipio(IN municipioId INT, IN nombreMunicipio VARCHAR(255), IN codigo INT, IN departamentoId INT)
BEGIN
    UPDATE municipios
    SET nombre = nombreMunicipio, codigo = codigo, departamento_id = departamentoId
    WHERE id_municipio = municipioId;
END;
//

CREATE PROCEDURE EliminarMunicipio(IN municipioId INT)
BEGIN
    DELETE FROM municipios WHERE id_municipio = municipioId;
END;
//

DELIMITER ;
-- ========================================================
-- Procedimientos para la tabla `asignaturas`
-- ========================================================

DELIMITER //

CREATE PROCEDURE ObtenerAsignaturas()
BEGIN
    SELECT * FROM asignaturas ORDER BY nombre ASC;
END //

CREATE PROCEDURE ObtenerAsignaturaPorId(IN asignaturaId INT)
BEGIN
    SELECT * FROM asignaturas WHERE id_asignatura = asignaturaId;
END //

CREATE PROCEDURE InsertarAsignatura(
    IN programaId INT,
    IN nombreAsignatura VARCHAR(255),
    IN tipoAsignatura ENUM('Materia', 'Competencia'),
    IN codigoMateria VARCHAR(50),
    IN creditosAsignatura INT,
    IN semestreAsignatura INT,
    IN horasAsignatura INT,
    IN tiempoPresencial INT,
    IN tiempoIndependiente INT,
    IN horasTotales INT,
    IN modalidadAsignatura ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN metodologiaAsignatura ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
    INSERT INTO asignaturas (
        programa_id,
        nombre,
        tipo,
        codigo_materia,
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
        programaId,
        nombreAsignatura,
        tipoAsignatura,
        codigoMateria,
        creditosAsignatura,
        semestreAsignatura,
        horasAsignatura,
        tiempoPresencial,
        tiempoIndependiente,
        horasTotales,
        modalidadAsignatura,
        metodologiaAsignatura,
        NOW(),
        NOW()
    );
END //

CREATE PROCEDURE ActualizarAsignatura(
    IN asignaturaId INT,
    IN programaId INT,
    IN nombreAsignatura VARCHAR(255),
    IN tipoAsignatura ENUM('Materia', 'Competencia'),
    IN codigoMateria VARCHAR(50),
    IN creditosAsignatura INT,
    IN semestreAsignatura INT,
    IN horasAsignatura INT,
    IN tiempoPresencial INT,
    IN tiempoIndependiente INT,
    IN horasTotales INT,
    IN modalidadAsignatura ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN metodologiaAsignatura ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
    UPDATE asignaturas
    SET
        programa_id = programaId,
        nombre = nombreAsignatura,
        tipo = tipoAsignatura,
        codigo_materia = codigoMateria,
        creditos = creditosAsignatura,
        semestre = semestreAsignatura,
        horas = horasAsignatura,
        tiempo_presencial = tiempoPresencial,
        tiempo_independiente = tiempoIndependiente,
        horas_totales_semanales = horasTotales,
        modalidad = modalidadAsignatura,
        metodologia = metodologiaAsignatura,
        updated_at = NOW()
    WHERE id_asignatura = asignaturaId;
END //

CREATE PROCEDURE EliminarAsignatura(IN asignaturaId INT)
BEGIN
    DELETE FROM asignaturas WHERE id_asignatura = asignaturaId;
END //

DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `instituciones`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerInstituciones()
BEGIN
    SELECT * FROM instituciones ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerInstitucionPorId(IN institucionId INT)
BEGIN
    SELECT * FROM instituciones WHERE id_institucion = institucionId;
END;
//

CREATE PROCEDURE InsertarInstitucion(
    IN p_nombre VARCHAR(255),
    IN p_codigo_snies VARCHAR(20),
    IN p_municipio_id INT,
    IN p_tipo ENUM('Universidad', 'SENA'),
    IN p_crup VARCHAR(20)
)
BEGIN
    INSERT INTO instituciones (nombre, codigo_snies, municipio_id, tipo, crup)
    VALUES (p_nombre, p_codigo_snies, p_municipio_id, p_tipo, p_crup);
END;
//

CREATE PROCEDURE ActualizarInstitucion(
    IN institucionId INT,
    IN p_nombre VARCHAR(255),
    IN p_codigo_snies VARCHAR(20),
    IN p_municipio_id INT,
    IN p_tipo ENUM('Universidad', 'SENA'),
    IN p_crup VARCHAR(20)
)
BEGIN
    UPDATE instituciones
    SET nombre = p_nombre, codigo_snies = p_codigo_snies, municipio_id = p_municipio_id, tipo = p_tipo, crup = p_crup
    WHERE id_institucion = institucionId;
END;
//

CREATE PROCEDURE EliminarInstitucion(IN institucionId INT)
BEGIN
    DELETE FROM instituciones WHERE id_institucion = institucionId;
END;
//

-- ========================================================
-- Procedimientos para la tabla `facultades`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerFacultades()
BEGIN
    SELECT * FROM facultades ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerFacultadPorId(IN facultadId INT)
BEGIN
    SELECT * FROM facultades WHERE id_facultad = facultadId;
END;
//

CREATE PROCEDURE InsertarFacultad(
    IN p_institucion_id INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    INSERT INTO facultades (institucion_id, nombre)
    VALUES (p_institucion_id, p_nombre);
END;
//

CREATE PROCEDURE ActualizarFacultad(
    IN facultadId INT,
    IN p_institucion_id INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    UPDATE facultades
    SET institucion_id = p_institucion_id, nombre = p_nombre
    WHERE id_facultad = facultadId;
END;
//

CREATE PROCEDURE EliminarFacultad(IN facultadId INT)
BEGIN
    DELETE FROM facultades WHERE id_facultad = facultadId;
END;
//
DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `programas`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerProgramas()
BEGIN
    SELECT * FROM programas ORDER BY nombre ASC;
END;
//

CREATE PROCEDURE ObtenerProgramaPorId(IN programaId INT)
BEGIN
    SELECT * FROM programas WHERE id_programa = programaId;
END;
//

CREATE PROCEDURE InsertarPrograma(
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
END;
//

CREATE PROCEDURE ActualizarPrograma(
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
END;
//

CREATE PROCEDURE EliminarPrograma(IN programaId INT)
BEGIN
    DELETE FROM programas WHERE id_programa = programaId;
END;
//

DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `usuarios`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerUsuarios()
BEGIN
    SELECT * FROM usuarios ORDER BY primer_nombre ASC;
END;
//

CREATE PROCEDURE ObtenerUsuarioPorId(IN usuarioId INT)
BEGIN
    SELECT * FROM usuarios WHERE id_usuario = usuarioId;
END;
//

CREATE PROCEDURE InsertarUsuario(
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
    INSERT INTO usuarios (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo, tipo_identificacion, numero_identificacion, institucion_origen_id, facultad_id, telefono, direccion, pais_id, departamento_id, municipio_id, rol_id)
    VALUES (p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_correo, p_tipo_identificacion, p_numero_identificacion, p_institucion_origen_id, p_facultad_id, p_telefono, p_direccion, p_pais_id, p_departamento_id, p_municipio_id, p_rol_id);
END;
//

CREATE PROCEDURE ActualizarUsuario(
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
    SET primer_nombre = p_primer_nombre, segundo_nombre = p_segundo_nombre, primer_apellido = p_primer_apellido, segundo_apellido = p_segundo_apellido, correo = p_correo, tipo_identificacion = p_tipo_identificacion, numero_identificacion = p_numero_identificacion, institucion_origen_id = p_institucion_origen_id, facultad_id = p_facultad_id, telefono = p_telefono, direccion = p_direccion, pais_id = p_pais_id, departamento_id = p_departamento_id, municipio_id = p_municipio_id, rol_id = p_rol_id
    WHERE id_usuario = usuarioId;
END;
//

CREATE PROCEDURE EliminarUsuario(IN usuarioId INT)
BEGIN
    DELETE FROM usuarios WHERE id_usuario = usuarioId;
END;
//
DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `contenidos_programaticos`
-- ========================================================

CREATE PROCEDURE ObtenerContenidosProgramaticos()
BEGIN
    SELECT * FROM contenidos_programaticos ORDER BY tema ASC;
END;
//

CREATE PROCEDURE ObtenerContenidoProgramaticoPorId(IN contenidoId INT)
BEGIN
    SELECT * FROM contenidos_programaticos WHERE id_contenido = contenidoId;
END;
//

CREATE PROCEDURE InsertarContenidoProgramatico(
    IN p_asignatura_id INT,
    IN p_tema VARCHAR(255),
    IN p_resultados_aprendizaje TEXT,
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO contenidos_programaticos (asignatura_id, tema, resultados_aprendizaje, descripcion)
    VALUES (p_asignatura_id, p_tema, p_resultados_aprendizaje, p_descripcion);
END;
//

CREATE PROCEDURE ActualizarContenidoProgramatico(
    IN contenidoId INT,
    IN p_asignatura_id INT,
    IN p_tema VARCHAR(255),
    IN p_resultados_aprendizaje TEXT,
    IN p_descripcion TEXT
)
BEGIN
    UPDATE contenidos_programaticos
    SET asignatura_id = p_asignatura_id, tema = p_tema, resultados_aprendizaje = p_resultados_aprendizaje, descripcion = p_descripcion
    WHERE id_contenido = contenidoId;
END;
//

CREATE PROCEDURE EliminarContenidoProgramatico(IN contenidoId INT)
BEGIN
    DELETE FROM contenidos_programaticos WHERE id_contenido = contenidoId;
END;
//
DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `solicitudes`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerSolicitudes()
BEGIN
    SELECT * FROM solicitudes ORDER BY fecha_solicitud DESC;
END;
//

CREATE PROCEDURE ObtenerSolicitudPorId(IN solicitudId INT)
BEGIN
    SELECT * FROM solicitudes WHERE id_solicitud = solicitudId;
END;
//

CREATE PROCEDURE InsertarSolicitud(
    IN p_usuario_id INT,
    IN p_programa_destino_id INT,
    IN p_finalizo_estudios ENUM('Si','No'),
    IN p_fecha_finalizacion_estudios DATE,
    IN p_fecha_ultimo_semestre_cursado DATE,
    IN p_estado ENUM('Radicado', 'En revisión', 'Aprobado', 'Rechazado', 'Cerrado'),
    IN p_numero_radicado VARCHAR(50),
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    INSERT INTO solicitudes (usuario_id, programa_destino_id, finalizo_estudios, fecha_finalizacion_estudios, fecha_ultimo_semestre_cursado, estado, numero_radicado, fecha_solicitud, ruta_pdf_resolucion)
    VALUES (p_usuario_id, p_programa_destino_id, p_finalizo_estudios, p_fecha_finalizacion_estudios, p_fecha_ultimo_semestre_cursado, p_estado, p_numero_radicado, CURRENT_TIMESTAMP, p_ruta_pdf_resolucion);
END;
//

CREATE PROCEDURE ActualizarSolicitud(
    IN solicitudId INT,
    IN p_usuario_id INT,
    IN p_programa_destino_id INT,
    IN p_finalizo_estudios ENUM('Si','No'),
    IN p_fecha_finalizacion_estudios DATE,
    IN p_fecha_ultimo_semestre_cursado DATE,
    IN p_estado ENUM('Radicado', 'En revisión', 'Aprobado', 'Rechazado', 'Cerrado'),
    IN p_numero_radicado VARCHAR(50),
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    UPDATE solicitudes
    SET usuario_id = p_usuario_id, programa_destino_id = p_programa_destino_id, finalizo_estudios = p_finalizo_estudios, fecha_finalizacion_estudios = p_fecha_finalizacion_estudios, fecha_ultimo_semestre_cursado = p_fecha_ultimo_semestre_cursado, estado = p_estado, numero_radicado = p_numero_radicado, ruta_pdf_resolucion = p_ruta_pdf_resolucion
    WHERE id_solicitud = solicitudId;
END;
//

CREATE PROCEDURE EliminarSolicitud(IN solicitudId INT)
BEGIN
    DELETE FROM solicitudes WHERE id_solicitud = solicitudId;
END;
//

DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `documentos'
-- ========================================================
DELIMITER //

CREATE PROCEDURE ObtenerDocumentos()
BEGIN
    SELECT * FROM documentos ORDER BY fecha_subida DESC;
END;
//

CREATE PROCEDURE ObtenerDocumentoPorId(IN documentoId INT)
BEGIN
    SELECT * FROM documentos WHERE id_documento = documentoId;
END;
//

CREATE PROCEDURE InsertarDocumento(
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_tipo VARCHAR(255), -- Cambié ENUM a VARCHAR(255)
    IN p_ruta VARCHAR(255)
)
BEGIN
    INSERT INTO documentos (solicitud_id, usuario_id, tipo, ruta, fecha_subida)
    VALUES (p_solicitud_id, p_usuario_id, p_tipo, p_ruta, NOW());
END;
//

CREATE PROCEDURE ActualizarDocumento(
    IN documentoId INT,
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_tipo VARCHAR(255), -- Cambié ENUM a VARCHAR(255)
    IN p_ruta VARCHAR(255)
)
BEGIN
    UPDATE documentos
    SET solicitud_id = p_solicitud_id, usuario_id = p_usuario_id, tipo = p_tipo, ruta = p_ruta
    WHERE id_documento = documentoId;
END;
//

CREATE PROCEDURE EliminarDocumento(IN documentoId INT)
BEGIN
    DELETE FROM documentos WHERE id_documento = documentoId;
END;
//

DELIMITER ;



-- ========================================================
-- Procedimientos para la tabla `historial_homologaciones`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerHistorialHomologaciones()
BEGIN
    SELECT * FROM historial_homologaciones ORDER BY fecha DESC;
END;
//

//
CREATE PROCEDURE ObtenerHistorialHomologacionPorId(IN historialId INT)
BEGIN
    SELECT * FROM historial_homologaciones WHERE id_historial = historialId;
END;
//
CREATE PROCEDURE InsertarHistorialHomologacion(
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_estado ENUM('Radicado', 'En revisión', 'Evaluado', 'Aprobado', 'Rechazado', 'Apelación'),
    IN p_observaciones TEXT,
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    INSERT INTO historial_homologaciones (solicitud_id, usuario_id, estado, fecha, observaciones, ruta_pdf_resolucion)
    VALUES (p_solicitud_id, p_usuario_id, p_estado, NOW(), p_observaciones, p_ruta_pdf_resolucion);
END;
//
CREATE PROCEDURE ActualizarHistorialHomologacion(
    IN historialId INT,
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_estado ENUM('Radicado', 'En revisión', 'Evaluado', 'Aprobado', 'Rechazado', 'Apelación'),
    IN p_observaciones TEXT,
    IN p_ruta_pdf_resolucion VARCHAR(255)
)
BEGIN
    UPDATE historial_homologaciones
    SET solicitud_id = p_solicitud_id, usuario_id = p_usuario_id, estado = p_estado, observaciones = p_observaciones, ruta_pdf_resolucion = p_ruta_pdf_resolucion
    WHERE id_historial = historialId;
END;

//
CREATE PROCEDURE EliminarHistorialHomologacion(IN historialId INT)
BEGIN
    DELETE FROM historial_homologaciones WHERE id_historial = historialId;
END;
//


DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `solicitud_asignaturas`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerSolicitudAsignaturas()
BEGIN
    SELECT * FROM solicitud_asignaturas ORDER BY id_solicitud_asignatura ASC;
END;
//

CREATE PROCEDURE ObtenerSolicitudAsignaturaPorId(IN solicitudAsignaturaId INT)
BEGIN
    SELECT * FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END;
//

CREATE PROCEDURE InsertarSolicitudAsignatura(
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas INT
)
BEGIN
    INSERT INTO solicitud_asignaturas (solicitud_id, asignatura_id, nota_origen, horas)
    VALUES (p_solicitud_id, p_asignatura_id, p_nota_origen, p_horas);
END;
//

CREATE PROCEDURE ActualizarSolicitudAsignatura(
    IN solicitudAsignaturaId INT,
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas INT
)
BEGIN
    UPDATE solicitud_asignaturas
    SET solicitud_id = p_solicitud_id, asignatura_id = p_asignatura_id, nota_origen = p_nota_origen, horas = p_horas
    WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END;
//

CREATE PROCEDURE EliminarSolicitudAsignatura(IN solicitudAsignaturaId INT)
BEGIN
    DELETE FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END;
//
DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `homologacion_asignaturas`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerHomologacionesAsignaturas()
BEGIN
    SELECT * FROM homologacion_asignaturas ORDER BY id_homologacion ASC;
END;
//

CREATE PROCEDURE ObtenerHomologacionAsignaturaPorId(IN homologacionId INT)
BEGIN
    SELECT * FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
END;
//

CREATE PROCEDURE InsertarHomologacionAsignatura(
    IN p_solicitud_id INT,
    IN p_asignatura_origen_id INT,
    IN p_asignatura_destino_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_nota_destino DECIMAL(3,1),
    IN p_comentarios TEXT
)
BEGIN
    INSERT INTO homologacion_asignaturas (solicitud_id, asignatura_origen_id, asignatura_destino_id, nota_origen, nota_destino, comentarios)
    VALUES (p_solicitud_id, p_asignatura_origen_id, p_asignatura_destino_id, p_nota_origen, p_nota_destino, p_comentarios);
END;
//

CREATE PROCEDURE ActualizarHomologacionAsignatura(
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
    SET solicitud_id = p_solicitud_id, asignatura_origen_id = p_asignatura_origen_id, asignatura_destino_id = p_asignatura_destino_id,
        nota_origen = p_nota_origen, nota_destino = p_nota_destino, comentarios = p_comentarios
    WHERE id_homologacion = homologacionId;
END;
//

CREATE PROCEDURE EliminarHomologacionAsignatura(IN homologacionId INT)
BEGIN
    DELETE FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
END;
//
DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `credenciales`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerCredenciales()
BEGIN
    SELECT * FROM credenciales ORDER BY id_credencial ASC;
END;
//
CREATE PROCEDURE ObtenerCredencialPorId(IN credencialId INT)
BEGIN
    SELECT * FROM credenciales WHERE id_credencial = credencialId;
END;
//
CREATE PROCEDURE InsertarCredencial(
    IN p_usuario_id INT,
    IN p_contraseña VARCHAR(255)
)
BEGIN
    INSERT INTO credenciales (usuario_id, contraseña)
    VALUES (p_usuario_id, p_contraseña);
END;
//
CREATE PROCEDURE ActualizarCredencial(
    IN credencialId INT,
    IN p_usuario_id INT,
    IN p_contraseña VARCHAR(255)
)
BEGIN
    UPDATE credenciales
    SET usuario_id = p_usuario_id, contraseña = p_contraseña
    WHERE id_credencial = credencialId;
END;
//
CREATE PROCEDURE EliminarCredencial(IN credencialId INT)
BEGIN
    DELETE FROM credenciales WHERE id_credencial = credencialId;
END;
//
DELIMITER ;

-- ========================================================
-- Procedimientos para la tabla `roles`
-- ========================================================

DELIMITER //
CREATE PROCEDURE ObtenerRoles()
BEGIN
    SELECT * FROM roles ORDER BY id_rol ASC;
END;
//
CREATE PROCEDURE ObtenerRolPorId(IN rolId INT)
BEGIN
    SELECT * FROM roles WHERE id_rol = rolId;
END;
//
CREATE PROCEDURE InsertarRol(
    IN p_nombre ENUM('Aspirante', 'Coordinador', 'Decano', 'Vicerrector')
)
BEGIN
    INSERT INTO roles (nombre)
    VALUES (p_nombre);
END;
//
CREATE PROCEDURE ActualizarRol(
    IN rolId INT,
    IN p_nombre ENUM('Aspirante', 'Coordinador', 'Decano', 'Vicerrector')
)
BEGIN
    UPDATE roles
    SET nombre = p_nombre
    WHERE id_rol = rolId;
END;
//
CREATE PROCEDURE EliminarRol(IN rolId INT)
BEGIN
    DELETE FROM roles WHERE id_rol = rolId;
END;
//
DELIMITER ;
