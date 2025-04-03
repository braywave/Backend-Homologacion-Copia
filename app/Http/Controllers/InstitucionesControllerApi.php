<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InstitucionesControllerApi extends Controller
{
    // Método para obtener todas las instituciones
    public function traerInstituciones()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todas las instituciones
            $instituciones = DB::select('CALL ObtenerInstituciones()');
            return response()->json($instituciones);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener las instituciones',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener una institución por ID
    public function llevarInstitucion($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener una institución por ID
            $institucion = DB::select('CALL ObtenerInstitucionPorId(?)', [$id]);

            if (!empty($institucion)) {
                return response()->json([
                    'mensaje' => 'Institución encontrada',
                    'datos' => $institucion[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Institución no encontrada',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener la institución',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar una nueva institución
    public function insertarInstitucion(Request $request)
    {
        try {
            // Llamada al procedimiento almacenado para insertar una nueva institución
            DB::statement('CALL InsertarInstitucion(?, ?, ?, ?, ?)', [
                $request->nombre,
                $request->codigo_snies,
                $request->municipio_id,
                $request->tipo,
                $request->crup
            ]);

            return response()->json([
                'mensaje' => 'Institución insertada correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar la institución',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar una institución
    public function actualizarInstitucion(Request $request, $id)
    {
        try {
            // Llamada al procedimiento almacenado para actualizar una institución
            DB::statement('CALL ActualizarInstitucion(?, ?, ?, ?, ?, ?)', [
                $id,
                $request->nombre,
                $request->codigo_snies,
                $request->municipio_id,
                $request->tipo,
                $request->crup
            ]);

            return response()->json([
                'mensaje' => 'Institución actualizada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar la institución',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar una institución
    public function eliminarInstitucion($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar una institución
            DB::statement('CALL EliminarInstitucion(?)', [$id]);

            return response()->json([
                'mensaje' => 'Institución eliminada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar la institución',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}