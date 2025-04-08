<?php

use App\Http\Controllers\PaisControllerApi;
use App\Http\Controllers\DepartamentoControllerApi;
use App\Http\Controllers\MunicipiosControllerApi;
use App\Http\Controllers\InstitucionesControllerApi;
use App\Http\Controllers\ProgramasControllerApi;
use App\Http\Controllers\AsignaturasControllerApi;
use App\Http\Controllers\CredencialesControllerApi;
use App\Http\Controllers\SolicitudesControllerApi;
use App\Http\Controllers\UsuariosControllerApi;
use App\Http\Controllers\DocumentosControllerApi;
use App\Http\Controllers\FacultadesControllerApi;
use App\Http\Controllers\RolesControllerApi;
use App\Http\Controllers\ContenidosProgramaticosControllerApi;
use App\Http\Controllers\HistorialHomologacionesControllerApi;
use App\Http\Controllers\SolicitudAsignaturasControllerApi;
use App\Http\Controllers\HomologacionAsignaturasControllerApi;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Rutas para países
Route::get('/paises', [PaisControllerApi::class, 'obtenerPaises'])->name('paises.get');
Route::get('/paises/{id}', [PaisControllerApi::class, 'obtenerPaisPorId'])->name('paises.getById');
Route::post('/paises', [PaisControllerApi::class, 'insertarPais'])->name('paises.insert');
Route::put('/paises/{id}', [PaisControllerApi::class, 'actualizarPais'])->name('paises.update');
Route::delete('/paises/{id}', [PaisControllerApi::class, 'eliminarPais'])->name('paises.delete');




// Rutas para departamentos
Route::get('/departamentos', [DepartamentoControllerApi::class, 'traerDepartamentos'])->name('departamentos.get');
Route::get('/departamentos/{id}', [DepartamentoControllerApi::class, 'llevarDepartamento'])->name('departamentos.getById');
Route::post('/departamentos', [DepartamentoControllerApi::class, 'insertarDepartamento'])->name('departamentos.insert');
Route::put('/departamentos/{id}', [DepartamentoControllerApi::class, 'actualizarDepartamento'])->name('departamentos.update');
Route::delete('/departamentos/{id}', [DepartamentoControllerApi::class, 'eliminarDepartamento'])->name('departamentos.delete');


// Rutas para municipios
Route::get('/municipios', [MunicipiosControllerApi::class, 'obtenerMunicipios'])->name('municipios.get');
Route::get('/municipios/{id}', [MunicipiosControllerApi::class, 'obtenerMunicipioPorId'])->name('municipios.getById');
Route::post('/municipios', [MunicipiosControllerApi::class, 'insertarMunicipio'])->name('municipios.insert');
Route::put('/municipios/{id}', [MunicipiosControllerApi::class, 'actualizarMunicipio'])->name('municipios.update');
Route::delete('/municipios/{id}', [MunicipiosControllerApi::class, 'eliminarMunicipio'])->name('municipios.delete');



// Rutas para instituciones
Route::get('/instituciones', [InstitucionesControllerApi::class, 'traerInstituciones'])->name('instituciones.get');
Route::get('/instituciones/{id}', [InstitucionesControllerApi::class, 'llevarInstitucion'])->name('instituciones.getById');
Route::post('/instituciones', [InstitucionesControllerApi::class, 'insertarInstitucion'])->name('instituciones.insert');
Route::put('/instituciones/{id}', [InstitucionesControllerApi::class, 'actualizarInstitucion'])->name('instituciones.update');
Route::delete('/instituciones/{id}', [InstitucionesControllerApi::class, 'eliminarInstitucion'])->name('instituciones.delete');


// Rutas para programas
Route::get('/programas', [ProgramasControllerApi::class, 'traerprogramas'])->name('programas.get');
Route::get('/programas/{id}', [ProgramasControllerApi::class, 'llevarprograma'])->name('programas.getById');
Route::post('/programas', [ProgramasControllerApi::class, 'insertarprograma'])->name('programas.insert');
Route::put('/programas/{id}', [ProgramasControllerApi::class, 'actualizarprograma'])->name('programas.update');
Route::delete('/programas/{id}', [ProgramasControllerApi::class, 'eliminarprograma'])->name('programas.delete');



// Rutas para asignaturas
Route::get('/asignaturas', [AsignaturasControllerApi::class, 'traerasignaturas'])->name('asignaturas.get');
Route::get('/asignaturas/{id}', [AsignaturasControllerApi::class, 'llevarasignatura'])->name('asignaturas.getById');
Route::post('/asignaturas', [AsignaturasControllerApi::class, 'insertarAsignatura'])->name('asignaturas.insert');
Route::put('/asignaturas/{id}', [AsignaturasControllerApi::class, 'actualizarAsignatura'])->name('asignaturas.update');
Route::delete('/asignaturas/{id}', [AsignaturasControllerApi::class, 'eliminarAsignatura'])->name('asignaturas.delete');



// Rutas para credenciales
Route::get('/credenciales', [CredencialesControllerApi::class, 'traercredenciales'])->name('credenciales.get');
Route::get('/credenciales/{id}', [CredencialesControllerApi::class, 'llevarcredencial'])->name('credenciales.getById');
Route::post('/credenciales', [CredencialesControllerApi::class, 'insertarcredencial'])->name('credenciales.insert');
Route::put('/credenciales/{id}', [CredencialesControllerApi::class, 'actualizarcredencial'])->name('credenciales.update');
Route::delete('/credenciales/{id}', [CredencialesControllerApi::class, 'eliminarcredencial'])->name('credenciales.delete');



// Rutas para solicitudes
Route::get('/solicitudes', [SolicitudesControllerApi::class, 'traerSolicitudes'])->name('solicitudes.get');
Route::get('/solicitudes/{id}', [SolicitudesControllerApi::class, 'llevarSolicitud'])->name('solicitudes.getById');
Route::post('/solicitudes', [SolicitudesControllerApi::class, 'insertarSolicitud'])->name('solicitudes.insert');
Route::put('/solicitudes/{id}', [SolicitudesControllerApi::class, 'actualizarSolicitud'])->name('solicitudes.update');
Route::delete('/solicitudes/{id}', [SolicitudesControllerApi::class, 'eliminarSolicitud'])->name('solicitudes.delete');


// Rutas para usuarios
Route::get('/usuarios', [UsuariosControllerApi::class, 'traerUsuarios'])->name('usuarios.get');
Route::get('/usuarios/{id}', [UsuariosControllerApi::class, 'llevarUsuario'])->name('usuarios.getById');
/* Route::post('/usuarios', [UsuariosControllerApi::class, 'insertarUsuario'])->name('usuarios.insert');
Route::put('/usuarios/{id}', [UsuariosControllerApi::class, 'actualizarUsuario'])->name('usuarios.update');
Route::delete('/usuarios/{id}', [UsuariosControllerApi::class, 'eliminarUsuario'])->name('usuarios.delete');

 */


// Rutas para documentos
Route::get('/documentos', [DocumentosControllerApi::class, 'traerDocumentos'])->name('documentos.get');
Route::get('/documentos/{id}', [DocumentosControllerApi::class, 'llevarDocumento'])->name('documentos.getById');
/* Route::post('/documentos', [DocumentosControllerApi::class, 'insertarDocumento'])->name('documentos.insert');
Route::put('/documentos/{id}', [DocumentosControllerApi::class, 'actualizarDocumento'])->name('documentos.update');
Route::delete('/documentos/{id}', [DocumentosControllerApi::class, 'eliminarDocumento'])->name('documentos.delete');
 */

// Rutas para facultades
Route::get('/facultades', [FacultadesControllerApi::class, 'traerFacultades'])->name('facultades.get');
Route::get('/facultades/{id}', [FacultadesControllerApi::class, 'llevarFacultad'])->name('facultades.getById');
/* Route::post('/facultades', [FacultadesControllerApi::class, 'insertarFacultad'])->name('facultades.insert');
Route::put('/facultades/{id}', [FacultadesControllerApi::class, 'actualizarFacultad'])->name('facultades.update');
Route::delete('/facultades/{id}', [FacultadesControllerApi::class, 'eliminarFacultad'])->name('facultades.delete');
 */

// Rutas para roles
Route::get('/roles', [RolesControllerApi::class, 'traerRoles'])->name('roles.get');
Route::get('/roles/{id}', [RolesControllerApi::class, 'llevarRol'])->name('roles.getById');
/* Route::post('/roles', [RolesControllerApi::class, 'insertarRol'])->name('roles.insert');
Route::put('/roles/{id}', [RolesControllerApi::class, 'actualizarRol'])->name('roles.update');
Route::delete('/roles/{id}', [RolesControllerApi::class, 'eliminarRol'])->name('roles.delete');
 */

// Rutas para contenidos programáticos
Route::get('/contenidos-programaticos', [ContenidosProgramaticosControllerApi::class, 'traerContenidosProgramaticos'])->name('contenidosProgramaticos.get');
Route::get('/contenidos-programaticos/{id}', [ContenidosProgramaticosControllerApi::class, 'llevarContenidoProgramatico'])->name('contenidosProgramaticos.getById');
/* Route::post('/contenidos-programaticos', [ContenidosProgramaticosControllerApi::class, 'insertarContenidoProgramatico'])->name('contenidosProgramaticos.insert');
Route::put('/contenidos-programaticos/{id}', [ContenidosProgramaticosControllerApi::class, 'actualizarContenidoProgramatico'])->name('contenidosProgramaticos.update');
Route::delete('/contenidos-programaticos/{id}', [ContenidosProgramaticosControllerApi::class, 'eliminarContenidoProgramatico'])->name('contenidosProgramaticos.delete');
 */

// Rutas historial_homologaciones
Route::get('/historial-homologaciones', [HistorialHomologacionesControllerApi::class, 'traerhistorialhomologaciones'])->name('historialhomologaciones.get');
Route::get('/historial-homologaciones/{id}', [HistorialHomologacionesControllerApi::class, 'llevarhistorialhomologacion'])->name('historialhomologaciones.getById');
/* Route::post('/historial-homologaciones', [HistorialHomologacionesControllerApi::class, 'insertarhistorialhomologacion'])->name('historialhomologaciones.insert');
Route::put('/historial-homologaciones/{id}', [HistorialHomologacionesControllerApi::class, 'actualizarhistorialhomologacion'])->name('historialhomologaciones.update');
Route::delete('/historial-homologaciones/{id}', [HistorialHomologacionesControllerApi::class, 'eliminarhistorialhomologacion'])->name('historialhomologaciones.delete');
*/

// Rutas para solicitud de asignaturas
Route::get('/solicitud-asignaturas', [SolicitudAsignaturasControllerApi::class, 'traerSolicitudAsignaturas'])->name('solicitudAsignaturas.get');
Route::get('/solicitud-asignaturas/{id}', [SolicitudAsignaturasControllerApi::class, 'llevarSolicitudAsignatura'])->name('solicitudAsignaturas.getById');
/* Route::post('/solicitud-asignaturas', [SolicitudAsignaturasControllerApi::class, 'insertarSolicitudAsignatura'])->name('solicitudAsignaturas.insert');
Route::put('/solicitud-asignaturas/{id}', [SolicitudAsignaturasControllerApi::class, 'actualizarSolicitudAsignatura'])->name('solicitudAsignaturas.update');
Route::delete('/solicitud-asignaturas/{id}', [SolicitudAsignaturasControllerApi::class, 'eliminarSolicitudAsignatura'])->name('solicitudAsignaturas.delete');
 */

// Rutas para homologación de asignaturas
Route::get('/homologacion-asignaturas', [HomologacionAsignaturasControllerApi::class, 'traerhomologacionasignaturas'])->name('homologacionasignaturas.get');
Route::get('/homologacion-asignaturas/{id}', [HomologacionAsignaturasControllerApi::class, 'llevarhomologacionasignatura'])->name('homologacionasignaturas.getById');
/* Route::post('/homologacion-asignaturas', [HomologacionAsignaturasControllerApi::class, 'insertarhomologacionasignatura'])->name('homologacionasignaturas.insert');
Route::put('/homologacion-asignaturas/{id}', [HomologacionAsignaturasControllerApi::class, 'actualizarhomologacionasignatura'])->name('homologacionasignaturas.update');
Route::delete('/homologacion-asignaturas/{id}', [HomologacionAsignaturasControllerApi::class, 'eliminarhomologacionasignatura'])->name('homologacionasignaturas.delete'); */
