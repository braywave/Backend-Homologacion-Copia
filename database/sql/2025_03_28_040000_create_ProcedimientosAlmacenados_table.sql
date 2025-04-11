--------------
--- PAISES ---
--------------

-- ACTUALIZAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPais`(
    IN paisId INT,
    IN nombrePais VARCHAR(100)
)
BEGIN
    UPDATE paises
       SET nombre = nombrePais
     WHERE id_pais = paisId;
END$$
DELIMITER ;


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPais`(
    IN paisId INT
)
BEGIN
    DELETE FROM paises
     WHERE id_pais = paisId;
END$$
DELIMITER ;

-- insertar

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPais`(
    IN nombrePais VARCHAR(100)
)
BEGIN
    INSERT INTO paises (nombre)
         VALUES (nombrePais);
END$$
DELIMITER ;


-- OBTENER PAIS POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaisPorId`(
    IN paisId INT
)
BEGIN

    SELECT p.id_pais,
            p.nombre AS pais
      FROM paises p
     WHERE p.id_pais = paisId;
END$$
DELIMITER ;


 -- OBTENER TODOS LOS PAISES

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPaises`()
BEGIN
     SELECT p.id_pais,
            p.nombre AS pais
      FROM paises p
     ORDER BY p.nombre ASC;
END$$
DELIMITER ;



---------------------
--- DEPARTAMENTOS ---
---------------------

-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento`(
    IN departamentoId INT
)
BEGIN
    DELETE FROM departamentos
     WHERE id_departamento = departamentoId;
END$$
DELIMITER ;


-- ACTUALIZAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDepartamento`(
    IN departamentoId INT,
    IN nombreDepartamento VARCHAR(255),
    IN paisId INT
)
BEGIN
    UPDATE departamentos
       SET nombre = nombreDepartamento, pais_id = paisId
     WHERE id_departamento = departamentoId;
END$$
DELIMITER ;

-- INSERTAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDepartamento`(
    IN nombreDepartamento VARCHAR(255),
    IN paisId INT
)
BEGIN
    INSERT INTO departamentos (nombre, pais_id)
         VALUES (nombreDepartamento, paisId);
END$$
DELIMITER ;



-- OBTENER DEPARTAMENTO POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentoPorId`(
    IN departamentoId INT
)
BEGIN
    SELECT d.id_departamento,
           d.nombre AS departamento,
           p.nombre AS pais
      FROM departamentos d
      JOIN paises p ON d.pais_id = p.id_pais
     WHERE d.id_departamento = departamentoId;
END$$
DELIMITER ;

-- OBTENER TODOS LOS DEPARTAMENTOS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDepartamentos`()
BEGIN
    SELECT d.id_departamento,
           d.nombre AS departamento,
           p.nombre AS pais
      FROM departamentos d
      JOIN paises p ON d.pais_id = p.id_pais
     ORDER BY d.nombre ASC;
END$$
DELIMITER ;


------------------
--- MUNICIPIOS ---
------------------

-- ACTUALIZAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarMunicipio`(
    IN municipioId INT,
    IN nombreMunicipio VARCHAR(255),
    IN departamentoId INT
)
BEGIN
    UPDATE municipios
       SET nombre = nombreMunicipio, departamento_id = departamentoId
     WHERE id_municipio = municipioId;
END$$
DELIMITER ;


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarMunicipio`(
    IN municipioId INT
)
BEGIN
    DELETE FROM municipios
     WHERE id_municipio = municipioId;
END$$
DELIMITER ;


-- INSERTAR

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


-- OBTENER MUNICIPIO POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipioPorId`(
    IN municipioId INT
)
BEGIN
    SELECT m.id_municipio,
           m.nombre AS municipio,
           d.nombre AS departamento,
           p.nombre AS pais
      FROM municipios m
      JOIN departamentos d ON m.departamento_id = d.id_departamento
      JOIN paises p ON d.pais_id = p.id_pais
     WHERE m.id_municipio = municipioId;
END$$
DELIMITER ;


-- OBTENER MUNICIPIOS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerMunicipios`()
BEGIN
    SELECT m.id_municipio,
           m.nombre AS municipio,
           d.nombre AS departamento,
           p.nombre AS pais
      FROM municipios m
      JOIN departamentos d ON m.departamento_id = d.id_departamento
      JOIN paises p ON d.pais_id = p.id_pais
     ORDER BY m.nombre ASC;
END$$
DELIMITER ;

---------------------
--- INSTITUCIONES ---
---------------------


-- ACTUALIZAR

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


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarInstitucion`(
    IN institucionId INT
)
BEGIN
    DELETE FROM instituciones
     WHERE id_institucion = institucionId;
END$$
DELIMITER ;


-- INSERTAR

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


-- OBTENER INSTITUCION POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstitucionPorId`(
    IN institucionId INT
)
BEGIN
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
DELIMITER ;


-- OBTENER INSTITUCIONES TODAS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInstituciones`()
BEGIN
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
DELIMITER ;


-----------------
--- PROGRAMAS ---
-----------------

-- ACTUALIZAR

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
       SET institucion_id = p_institucion_id,
           facultad_id = p_facultad_id,
           nombre = p_nombre,
           codigo_snies = p_codigo_snies,
           tipo_formacion = p_tipo_formacion,
           metodologia = p_metodologia
     WHERE id_programa = programaId;
END$$
DELIMITER ;


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPrograma`(
    IN programaId INT
)
BEGIN
    DELETE FROM programas
     WHERE id_programa = programaId;
END$$
DELIMITER ;


-- INSERTAR

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


-- OBTENER PROGRAMA POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramaPorId`(
    IN programaId INT
)
BEGIN
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
DELIMITER ;


-- OBTENER TODOS PROGRAMAS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramas`()
BEGIN
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
DELIMITER ;


-------------------
--- ASIGNATURAS ---
-------------------

-- ACTUALIZAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAsignatura`(
    IN p_id_asignatura INT,
    IN p_programa_id INT,
    IN p_nombre VARCHAR(255),
    IN p_tipo ENUM('Materia', 'Competencia'),
    IN p_codigo_asignatura VARCHAR(30),
    IN p_creditos INT,
    IN p_semestre INT,
    IN p_horas_sena INT,
    IN p_tiempo_presencial INT,
    IN p_tiempo_independiente INT,
    IN p_horas_totales_semanales INT,
    IN p_modalidad ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN p_metodologia ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
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
DELIMITER ;


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAsignatura`(
    IN asignaturaId INT
)
BEGIN
    DELETE FROM asignaturas
     WHERE id_asignatura = asignaturaId;
END$$
DELIMITER ;


-- INSERTAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignatura`(
    IN p_programa_id INT,
    IN p_nombre VARCHAR(255),
    IN p_tipo ENUM('Materia', 'Competencia'),
    IN p_codigo_asignatura VARCHAR(30),
    IN p_creditos INT,
    IN p_semestre INT,
    IN p_horas_sena INT,
    IN p_tiempo_presencial INT,
    IN p_tiempo_independiente INT,
    IN p_horas_totales_semanales INT,
    IN p_modalidad ENUM('Teórico', 'Práctico', 'Teórico-Práctico'),
    IN p_metodologia ENUM('Presencial', 'Virtual', 'Híbrido')
)
BEGIN
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
DELIMITER ;


-- OBTENER TODAS ASIGNATURAS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturas`()
BEGIN
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
           p.nombre AS programa
      FROM asignaturas a
      JOIN programas p ON a.programa_id = p.id_programa
     ORDER BY a.nombre ASC;
END$$
DELIMITER ;



-- OBTENER ASIGNATURAS POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAsignaturaPorId`(
    IN asignaturaId INT
)
BEGIN
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
           p.nombre AS programa
      FROM asignaturas a
      JOIN programas p ON a.programa_id = p.id_programa
     WHERE a.id_asignatura = asignaturaId;
END$$
DELIMITER ;


--FALTA
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

-----------------
-- SOLICITUDES --
-----------------

-- ACTUALIZAR SOLICITUD

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


-- ELIMINAR SOLICITUD

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitud`(
    IN p_id_solicitud SMALLINT
)
BEGIN
    DELETE FROM solicitudes WHERE id_solicitud = p_id_solicitud;
END$$
DELIMITER ;


-- INSERTAR SOLICITUD
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
DELIMITER ;


-- OBTENER SOLICITUD POR ID

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudPorId`(IN p_id_solicitud SMALLINT)
BEGIN
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
        u.correo,
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
    INNER JOIN usuarios u ON s.usuario_id = u.id_usuario
    INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    LEFT JOIN instituciones inst ON u.institucion_origen_id = inst.id_institucion
    WHERE s.id_solicitud = p_id_solicitud;
END$$

DELIMITER ;



-- OBTENER TODAS LAS SOLICITUDES
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudes`()
BEGIN
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
        u.correo,
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
    INNER JOIN usuarios u ON s.usuario_id = u.id_usuario
    INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    LEFT JOIN instituciones inst ON u.institucion_origen_id = inst.id_institucion;
END$$

DELIMITER ;





----------------
--- USUARIOS ---
----------------

-- OBTENER TODOS LOS USUARIOS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarios`()
BEGIN
    SELECT
        u.id_usuario,
        u.primer_nombre,
        u.segundo_nombre,
        u.primer_apellido,
        u.segundo_apellido,
        u.correo,
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
    FROM usuarios u
    LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
    LEFT JOIN facultades f ON u.facultad_id = f.id_facultad
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    ORDER BY u.primer_nombre ASC;
END$$
DELIMITER ;


-- OBTENER USUARIO POR ID
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarioPorId`(IN usuarioId INT)
BEGIN
    SELECT
        u.id_usuario,
        u.primer_nombre,
        u.segundo_nombre,
        u.primer_apellido,
        u.segundo_apellido,
        u.correo,
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
    FROM usuarios u
    LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
    LEFT JOIN facultades f ON u.facultad_id = f.id_facultad
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    WHERE u.id_usuario = usuarioId;
END$$
DELIMITER ;

-- INSERTAR

DELIMITER $$
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
DELIMITER ;

-- ACTUALIZAR

DELIMITER $$
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
DELIMITER ;

-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario`(IN usuarioId INT)
BEGIN
    DELETE FROM usuarios WHERE id_usuario = usuarioId;
END$$
DELIMITER ;

------------------
--- DOCUMENTOS ---
------------------

-- OBTENER TODOS DOCUMENTOS

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentos`()
BEGIN
    SELECT
        d.id_documento,
        CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
        s.id_solicitud,
        d.tipo,
        d.ruta,
        d.fecha_subida,
        d.created_at,
        d.updated_at
    FROM documentos d
    LEFT JOIN usuarios u ON d.usuario_id = u.id_usuario
    LEFT JOIN solicitudes s ON d.solicitud_id = s.id_solicitud
    ORDER BY d.fecha_subida DESC;
END$$
DELIMITER ;

-- OBTENER DOCUMENTOS POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoPorId`(IN documentoId INT)
BEGIN
    SELECT
        d.id_documento,
        CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
        s.id_solicitud,
        d.tipo,
        d.ruta,
        d.fecha_subida,
        d.created_at,
        d.updated_at
    FROM documentos d
    LEFT JOIN usuarios u ON d.usuario_id = u.id_usuario
    LEFT JOIN solicitudes s ON d.solicitud_id = s.id_solicitud
    WHERE d.id_documento = documentoId;
END$$
DELIMITER ;

-- INSERTAR DOCUEMTNOS
DELIMITER $$
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
DELIMITER ;

-- ACTUALIZAR
DELIMITER $$
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
DELIMITER ;

-- BORRAR
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDocumento`(IN documentoId INT)
BEGIN
    DELETE FROM documentos WHERE id_documento = documentoId;
END$$
DELIMITER ;


------------------
--- FACULTADES ---
------------------

-- OBTENER TODAS FACULTADES
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultades`()
BEGIN
    SELECT
        f.id_facultad,
        i.nombre AS institucion,
        f.nombre,
        f.created_at,
        f.updated_at
    FROM facultades f
    LEFT JOIN instituciones i ON f.institucion_id = i.id_institucion
    ORDER BY f.nombre ASC;
END$$
DELIMITER ;

-- OBTENER FACULTAD POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultadPorId`(IN facultadId INT)
BEGIN
    SELECT
        f.id_facultad,
        i.nombre AS institucion,
        f.nombre,
        f.created_at,
        f.updated_at
    FROM facultades f
    LEFT JOIN instituciones i ON f.institucion_id = i.id_institucion
    WHERE f.id_facultad = facultadId;
END$$
DELIMITER ;

-- INSERTAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacultad`(
    IN p_institucion_id INT,
    IN p_nombre VARCHAR(255)
)
BEGIN
    INSERT INTO facultades (institucion_id, nombre, created_at, updated_at)
    VALUES (p_institucion_id, p_nombre, NOW(), NOW());
END$$
DELIMITER ;

-- ACTUALIZAR

DELIMITER $$
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
DELIMITER ;


-- ELIMAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFacultad`(IN facultadId INT)
BEGIN
    DELETE FROM facultades WHERE id_facultad = facultadId;
END$$
DELIMITER ;


-- ========================================================
-- Procedimientos para la tabla `roles`
-- ========================================================


-- OBTENER TODOS ROLES
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRoles`()
BEGIN
    SELECT * FROM roles ORDER BY id_rol ASC;
END$$
DELIMITER ;

-- OBTENER ROL POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRolPorId`(IN rolId INT)
BEGIN
    SELECT * FROM roles WHERE id_rol = rolId;
END$$
DELIMITER ;

-- INSERTAR ROL

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRol`(
    IN p_nombre VARCHAR(50)
)
BEGIN
    INSERT INTO roles (nombre, created_at, updated_at)
    VALUES (p_nombre, NOW(), NOW());
END$$
DELIMITER ;

--- ACTUALIZAR ROL

DELIMITER $$
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
DELIMITER ;


-- ELIMINAR ROL
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRol`(IN rolId INT)
BEGIN
    DELETE FROM roles WHERE id_rol = rolId;
END$$
DELIMITER ;


--------------------------------
--- CONTENIDOS PROGRAMATICOS ---
--------------------------------


-- OBTENER TODOS

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidosProgramaticos`()
BEGIN
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

DELIMITER ;

-- OBTENER POR ID

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerContenidoProgramaticoPorId`(IN contenidoId INT)
BEGIN
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

DELIMITER ;

-- INSERTAR
DELIMITER $$
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
DELIMITER ;

-- ACTUALIZAR

DELIMITER $$
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
DELIMITER ;

-- BORRAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarContenidoProgramatico`(IN contenidoId INT)
BEGIN
    DELETE FROM contenidos_programaticos WHERE id_contenido = contenidoId;
END$$
DELIMITER ;


--------------------------------
--- HISTORIAL HOMOLOGACIONES ---
--------------------------------

-- OBTENER TODO EL HISTORIAL

DELIMITER $$

CREATE PROCEDURE ObtenerHistorialHomologaciones()
BEGIN
    SELECT
        -- Datos del historial
        hh.id_historial,
        hh.estado AS estado_historial,
        hh.fecha,
        hh.observaciones,
        hh.ruta_pdf_resolucion,

        -- Datos de la solicitud
        s.id_solicitud,
        s.numero_radicado,
        s.estado AS estado_solicitud,
        s.fecha_solicitud,
        s.finalizo_estudios,
        prog.nombre AS nombre_programa_destino,

        -- Datos del usuario
        u.id_usuario,
        u.primer_nombre,
        u.segundo_nombre,
        u.primer_apellido,
        u.segundo_apellido,
        u.correo,

        -- Ubicación y origen
        p.nombre AS pais_nombre,
        d.nombre AS departamento_nombre,
        m.nombre AS municipio_nombre,
        i.nombre AS institucion_origen_nombre

    FROM historial_homologaciones hh
    INNER JOIN solicitudes s ON hh.solicitud_id = s.id_solicitud
    INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
    INNER JOIN usuarios u ON hh.usuario_id = u.id_usuario
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion;
END $$

DELIMITER ;



-- OBTENER HISTORIAL POR ID
DELIMITER $$

CREATE PROCEDURE ObtenerHistorialHomologacionPorId(IN p_id INT)
BEGIN
    SELECT
        -- Datos del historial
        hh.id_historial,
        hh.estado AS estado_historial,
        hh.fecha,
        hh.observaciones,
        hh.ruta_pdf_resolucion,

        -- Datos de la solicitud
        s.id_solicitud,
        s.numero_radicado,
        s.estado AS estado_solicitud,
        s.fecha_solicitud,
        s.finalizo_estudios,
        s.fecha_finalizacion_estudios,
        s.fecha_ultimo_semestre_cursado,
        s.ruta_pdf_resolucion AS resolucion_solicitud,
        prog.nombre AS nombre_programa_destino,

        -- Datos del usuario
        u.id_usuario,
        u.primer_nombre,
        u.segundo_nombre,
        u.primer_apellido,
        u.segundo_apellido,
        u.correo,
        u.tipo_identificacion,
        u.numero_identificacion,
        u.telefono,
        u.direccion,

        -- Ubicación y origen
        p.nombre AS pais_nombre,
        d.nombre AS departamento_nombre,
        m.nombre AS municipio_nombre,
        i.nombre AS institucion_origen_nombre

    FROM historial_homologaciones hh
    INNER JOIN solicitudes s ON hh.solicitud_id = s.id_solicitud
    INNER JOIN programas prog ON s.programa_destino_id = prog.id_programa
    INNER JOIN usuarios u ON hh.usuario_id = u.id_usuario
    LEFT JOIN paises p ON u.pais_id = p.id_pais
    LEFT JOIN departamentos d ON u.departamento_id = d.id_departamento
    LEFT JOIN municipios m ON u.municipio_id = m.id_municipio
    LEFT JOIN instituciones i ON u.institucion_origen_id = i.id_institucion
    WHERE hh.id_historial = p_id;
END $$

DELIMITER ;


-- INSERTAR
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHistorialHomologacion`(
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
      IN p_estado VARCHAR(20),
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
DELIMITER ;

-- ACTUALIZAR
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHistorialHomologacion`(
    IN historialId INT,
    IN p_solicitud_id INT,
    IN p_usuario_id INT,
    IN p_estado VARCHAR(20),
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
DELIMITER ;

-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHistorialHomologacion`(IN historialId INT)
BEGIN
    DELETE FROM historial_homologaciones WHERE id_historial = historialId;
END$$

DELIMITER ;

-----------------------------
--- SOLICITUD ASIGNATURAS ---
-----------------------------


-- OBTENER TODAS SOLICITUDES
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturas`()
BEGIN
    SELECT
        sa.id_solicitud_asignatura,
        s.id_solicitud,
        CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
        a.nombre AS asignatura,
        a.codigo_asignatura,
        sa.nota_origen,
        sa.horas_sena,
        sa.created_at,
        sa.updated_at
    FROM solicitud_asignaturas sa
    LEFT JOIN solicitudes s ON sa.solicitud_id = s.id_solicitud
    LEFT JOIN usuarios u ON s.usuario_id = u.id_usuario
    LEFT JOIN asignaturas a ON sa.asignatura_id = a.id_asignatura
    ORDER BY sa.id_solicitud_asignatura ASC;
END$$
DELIMITER ;


-- OBTENER POR ID

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSolicitudAsignaturaPorId`(IN solicitudAsignaturaId INT)
BEGIN
    SELECT
        sa.id_solicitud_asignatura,
        s.id_solicitud,
        CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS estudiante,
        a.nombre AS asignatura,
        a.codigo_asignatura,
        sa.nota_origen,
        sa.horas_sena,
        sa.created_at,
        sa.updated_at
    FROM solicitud_asignaturas sa
    LEFT JOIN solicitudes s ON sa.solicitud_id = s.id_solicitud
    LEFT JOIN usuarios u ON s.usuario_id = u.id_usuario
    LEFT JOIN asignaturas a ON sa.asignatura_id = a.id_asignatura
    WHERE sa.id_solicitud_asignatura = solicitudAsignaturaId;
END$$
DELIMITER ;

-- INSERTAR SOLICITUD ASIGNATURA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSolicitudAsignatura`(
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas_sena INT
)
BEGIN
    INSERT INTO solicitud_asignaturas (
        solicitud_id, asignatura_id, nota_origen, horas_sena, created_at, updated_at
    )
    VALUES (
        p_solicitud_id, p_asignatura_id, p_nota_origen, p_horas_sena, NOW(), NOW()
    );
END$$
DELIMITER ;

-- ACTUALIZAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSolicitudAsignatura`(
    IN solicitudAsignaturaId INT,
    IN p_solicitud_id INT,
    IN p_asignatura_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas_sena INT
)
BEGIN
    UPDATE solicitud_asignaturas
    SET solicitud_id = p_solicitud_id,
        asignatura_id = p_asignatura_id,
        nota_origen = p_nota_origen,
        horas_sena = p_horas_sena,
        updated_at = NOW()
    WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END$$
DELIMITER ;


-- ELIMINAR

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSolicitudAsignatura`(IN solicitudAsignaturaId INT)
BEGIN
    DELETE FROM solicitud_asignaturas WHERE id_solicitud_asignatura = solicitudAsignaturaId;
END$$
DELIMITER ;



------------
-- VERSUS --
------------


DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionesAsignaturas`()
BEGIN
    SELECT
        ha.id_homologacion,
        ha.solicitud_id,

        -- Asignatura origen
        ao.id_asignatura AS asignatura_origen_id,
        ao.nombre AS asignatura_origen,

        -- Asignatura destino
        ad.id_asignatura AS asignatura_destino_id,
        ad.nombre AS asignatura_destino,

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
    JOIN asignaturas ao ON ha.asignatura_origen_id = ao.id_asignatura
    JOIN asignaturas ad ON ha.asignatura_destino_id = ad.id_asignatura
    JOIN solicitudes s ON ha.solicitud_id = s.id_solicitud
    JOIN usuarios u ON s.usuario_id = u.id_usuario
    LEFT JOIN solicitud_asignaturas sa ON sa.solicitud_id = ha.solicitud_id AND sa.asignatura_id = ha.asignatura_origen_id


    ORDER BY ha.id_homologacion ASC;
END$$

DELIMITER ;




-- OBTENER HOMOLOGACION ASIGNATURAS POR ID
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerHomologacionAsignaturaPorId`(IN homologacionId INT)
BEGIN
    SELECT
        ha.id_homologacion,
        ha.solicitud_id,
        ao.nombre AS asignatura_origen,
        ad.nombre AS asignatura_destino,
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
    JOIN asignaturas ao ON ha.asignatura_origen_id = ao.id_asignatura
    JOIN asignaturas ad ON ha.asignatura_destino_id = ad.id_asignatura
    JOIN solicitudes s ON ha.solicitud_id = s.id_solicitud
    JOIN usuarios u ON s.usuario_id = u.id_usuario
   LEFT JOIN solicitud_asignaturas sa ON sa.solicitud_id = ha.solicitud_id AND sa.asignatura_id = ha.asignatura_origen_id
    WHERE ha.id_homologacion = homologacionId;
END$$

DELIMITER ;


-- INSERTAR

DELIMITER $$

CREATE DEFINER=root@localhost PROCEDURE InsertarHomologacionAsignatura(
    IN p_solicitud_id INT,
    IN p_asignatura_origen_id INT,
    IN p_asignatura_destino_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas_sena INT,
    IN p_nota_destino DECIMAL(3,1),
    IN p_comentarios TEXT
)
BEGIN
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

DELIMITER ;





-- ACTUALIZAR
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHomologacionAsignatura`(
    IN p_id_homologacion INT,
    IN p_solicitud_id INT,
    IN p_asignatura_origen_id INT,
    IN p_asignatura_destino_id INT,
    IN p_nota_origen DECIMAL(3,1),
    IN p_horas_sena DECIMAL(3,1),
    IN p_nota_destino DECIMAL(3,1),
    IN p_comentarios TEXT
)
BEGIN
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

DELIMITER ;




-- BORRAR
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHomologacionAsignatura`(IN homologacionId INT)
BEGIN
    DELETE FROM homologacion_asignaturas WHERE id_homologacion = homologacionId;
END$$

DELIMITER ;



