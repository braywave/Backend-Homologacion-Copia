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


//Rutas paises
Route::get('/paises', [PaisControllerApi::class, 'traerpaises'])->name('paises.get');
Route::post('/pais/{id}', [PaisControllerApi::class, 'llevarpais'])->name('pais.set');

//Rutas departamentos
Route::get('/departamentos', [DepartamentoControllerApi::class, 'traerdepartamentos'])-> name('departamentos.get');
Route::post('/departamento/{id}', [DepartamentoControllerApi::class, 'llevardepartamento'])-> name('departamento.set');

//Rutas municipios
Route::get('/municipios', [MunicipiosControllerApi::class, 'traermunicipios']) -> name('municipios.get');
Route::post('/municipio/{id}', [MunicipiosControllerApi::class, 'llevarmunicipio']) -> name('municipio.set');

//Rutas instituciones
Route::get('/instituciones',[InstitucionesControllerApi::class,'traerinstituciones'])->name('instituciones.get');
Route::post('/institucion/{id}',[InstitucionesControllerApi::class,'llevarinstitucion'])->name('institucion.set');

//Rutas programas
Route::get('/programas',[ProgramasControllerApi::class,'traerprogramas'])->name('programas.get');
Route::post('/programa/{id}',[ProgramasControllerApi::class,'llevarprograma'])->name('programa.set');

//Rutas asignaturas
Route::get('/asignaturas',[AsignaturasControllerAPi::class , 'traerasignaturas'])->name('asignaturas.get');
Route::post('/asignatura/{id}',[AsignaturasControllerAPi::class , 'llevarasignatura'])->name('asignatura.set');

//Rutas credenciales
Route::get('/credenciales',[CredencialesControllerApi::class,'traercredenciales'])->name('credenciales.get');
Route::post('/credencial/{id}',[CredencialesControllerApi::class,'llevarcredencial'])->name('credencial.set');

//Rutas solicitudes
Route::get('/solicitudes',[SolicitudesControllerApi::class,'traersolicitudes'])->name('solicitudes.get');
Route::post('/solicitud/{id}',[SolicitudesControllerApi::class,'llevarsolicitud'])->name('solicitud.set');


//Rutas usuarios
Route::get('/usuarios',[UsuariosControllerApi::class,'traerusuarios'])->name('usuarios.get');
Route::post('/usuario/{id}',[UsuariosControllerApi::class,'llevarusuario'])->name('usuario.set');


//Rutas documentos
Route::get('/documentos',[DocumentosControllerApi::class,'traerdocumentos'])->name('documentos.get');
Route::post('/documento/{id}',[DocumentosControllerApi::class,'llevardocumento'])->name('documento.set');


//Rutas Facultades
Route::get('/facultades',[FacultadesControllerApi::class,'traerfacultades'])->name('facultades.get');
Route::post('/facultad/{id}',[FacultadesControllerApi::class,'llevarfacultad'])->name('facultad.set');


//Rutas Roles
Route::get('/roles',[RolesControllerApi::class,'traerroles'])->name('roles.get');
Route::post('/rol/{id}',[RolesControllerApi::class,'llevarrol'])->name('rol.set');


//Rutas contenidos Programaticos
Route::get('/contenidosProgramaticos',[ContenidosProgramaticosControllerApi::class,'traercontenidosP'])->name('contenidosprogramaticos.get');
Route::post('/contenidoProgramatico/{id}',[ContenidosProgramaticosControllerApi::class,'llevarcontenidoP'])->name('contenidoprogramatico.set');



