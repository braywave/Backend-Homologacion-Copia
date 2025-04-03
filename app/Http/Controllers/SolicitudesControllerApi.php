<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SolicitudesControllerApi extends Controller
{
    // Método para obtener todas las solicitudes
    public function traerSolicitudes()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todas las solicitudes
            $solicitudes = DB::select('CALL ObtenerSolicitudes()');
            return response()->json($solicitudes);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener las solicitudes',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener una solicitud por ID
    public function llevarSolicitud($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener una solicitud por ID
            $solicitud = DB::select('CALL ObtenerSolicitudPorId(?)', [$id]);

            if (!empty($solicitud)) {
                return response()->json([
                    'mensaje' => 'Solicitud encontrada',
                    'datos' => $solicitud[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Solicitud no encontrada',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener la solicitud',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar una nueva solicitud
    public function insertarSolicitud(Request $request)
    {
        try {
            // Llamada al procedimiento almacenado para insertar una nueva solicitud
            DB::statement('CALL InsertarSolicitud(?, ?, ?, ?, ?, ?, ?, ?)', [
                $request->usuario_id,
                $request->programa_destino_id,
                $request->finalizo_estudios,
                $request->fecha_finalizacion_estudios,
                $request->fecha_ultimo_semestre_cursado,
                $request->estado,
                $request->numero_radicado,
                $request->ruta_pdf_resolucion
            ]);

            return response()->json([
                'mensaje' => 'Solicitud insertada correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar la solicitud',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar una solicitud
    public function actualizarSolicitud(Request $request, $id)
    {
        try {
            // Llamada al procedimiento almacenado para actualizar una solicitud
            DB::statement('CALL ActualizarSolicitud(?, ?, ?, ?, ?, ?, ?, ?, ?)', [
                $id,
                $request->usuario_id,
                $request->programa_destino_id,
                $request->finalizo_estudios,
                $request->fecha_finalizacion_estudios,
                $request->fecha_ultimo_semestre_cursado,
                $request->estado,
                $request->numero_radicado,
                $request->ruta_pdf_resolucion
            ]);

            return response()->json([
                'mensaje' => 'Solicitud actualizada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar la solicitud',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar una solicitud
    public function eliminarSolicitud($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar una solicitud
            DB::statement('CALL EliminarSolicitud(?)', [$id]);

            return response()->json([
                'mensaje' => 'Solicitud eliminada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar la solicitud',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}