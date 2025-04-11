<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AsignaturaControllerApi extends Controller
{
    // Método para obtener todas las asignaturas
    public function traerAsignaturas()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todas las asignaturas
            $asignaturas = DB::select('CALL ObtenerAsignaturas()');
            return response()->json($asignaturas);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener las asignaturas',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener una asignatura por ID
    public function llevarAsignatura($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener una asignatura por ID
            $asignatura = DB::select('CALL ObtenerAsignaturaPorId(?)', [$id]);

            if (!empty($asignatura)) {
                return response()->json([
                    'mensaje' => 'Asignatura encontrada',
                    'datos' => $asignatura[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Asignatura no encontrada',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener la asignatura',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar una nueva asignatura
    public function insertarAsignatura(Request $request)
    {
        try {
            // Llamada al procedimiento almacenado para insertar una nueva asignatura
            DB::statement('CALL InsertarAsignatura(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
                $request->programa_id,
                $request->nombre,
                $request->tipo,
                $request->codigo_asignatura,
                $request->creditos,
                $request->semestre,
                $request->horas_sena,
                $request->tiempo_presencial,
                $request->tiempo_independiente,
                $request->horas_totales_semanales,
                $request->modalidad,
                $request->metodologia
            ]);

            return response()->json([
                'mensaje' => 'Asignatura insertada correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar la asignatura',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar una asignatura
    public function actualizarAsignatura(Request $request, $id)
    {
        try {
            // Llamada al procedimiento almacenado para actualizar una asignatura
            DB::statement('CALL ActualizarAsignatura(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
                $id,
                $request->programa_id,
                $request->nombre,
                $request->tipo,
                $request->codigo_asignatura,
                $request->creditos,
                $request->semestre,
                $request->horas_sena,
                $request->tiempo_presencial,
                $request->tiempo_independiente,
                $request->horas_totales_semanales,
                $request->modalidad,
                $request->metodologia
            ]);

            return response()->json([
                'mensaje' => 'Asignatura actualizada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar la asignatura',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar una asignatura
    public function eliminarAsignatura($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar una asignatura
            DB::statement('CALL EliminarAsignatura(?)', [$id]);

            return response()->json([
                'mensaje' => 'Asignatura eliminada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar la asignatura',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
