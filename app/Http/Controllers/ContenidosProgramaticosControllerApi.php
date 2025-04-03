<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ContenidosProgramaticosControllerApi extends Controller
{
    // Método para obtener todos los contenidos programáticos
    public function traerContenidosProgramaticos()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todos los contenidos programáticos
            $contenidos = DB::select('CALL ObtenerContenidosProgramaticos()');
            return response()->json($contenidos);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener los contenidos programáticos',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener un contenido programático por ID
    public function llevarContenidoProgramatico($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener un contenido programático por ID
            $contenido = DB::select('CALL ObtenerContenidoProgramaticoPorId(?)', [$id]);

            if (!empty($contenido)) {
                return response()->json([
                    'mensaje' => 'Contenido programático encontrado',
                    'datos' => $contenido[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Contenido programático no encontrado',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener el contenido programático',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar un nuevo contenido programático
    public function insertarContenidoProgramatico(Request $request)
    {
        try {
            // Llamada al procedimiento almacenado para insertar un nuevo contenido programático
            DB::statement('CALL InsertarContenidoProgramatico(?, ?, ?, ?)', [
                $request->asignatura_id,
                $request->tema,
                $request->resultados_aprendizaje,
                $request->descripcion
            ]);

            return response()->json([
                'mensaje' => 'Contenido programático insertado correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar el contenido programático',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar un contenido programático
    public function actualizarContenidoProgramatico(Request $request, $id)
    {
        try {
            // Llamada al procedimiento almacenado para actualizar un contenido programático
            DB::statement('CALL ActualizarContenidoProgramatico(?, ?, ?, ?, ?)', [
                $id,
                $request->asignatura_id,
                $request->tema,
                $request->resultados_aprendizaje,
                $request->descripcion
            ]);

            return response()->json([
                'mensaje' => 'Contenido programático actualizado correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar el contenido programático',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar un contenido programático
    public function eliminarContenidoProgramatico($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar un contenido programático
            DB::statement('CALL EliminarContenidoProgramatico(?)', [$id]);

            return response()->json([
                'mensaje' => 'Contenido programático eliminado correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar el contenido programático',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
