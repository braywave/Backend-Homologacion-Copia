<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HistorialHomologacionesControllerApi extends Controller
{
    public function traerhistorialhomologaciones()
    {
        $historialHomologaciones = DB::select('CALL ObtenerHistorialHomologaciones()');
        return response()->json($historialHomologaciones);
    }

    public function llevarhistorialhomologacion($id)
    {
        $historialHomologacion = DB::select('CALL ObtenerHistorialHomologacionPorId(?)', [$id]);

        if (!empty($historialHomologacion)) {
            return response()->json([
                'mensaje' => 'Historial de Homologaciones encontrado',
                'datos' => $historialHomologacion[0]
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Historial de Homologacion no encontrado',
            ], 404);
        }
    }

    public function insertarhistorialhomologacion(Request $request)
    {
        DB::statement('CALL InsertarHistorialHomologacion(?, ?, ?, ?, ?)', [
            $request->solicitud_id,
            $request->usuario_id,
            $request->estado,
            $request->observaciones,
            $request->ruta_pdf_resolucion
        ]);

        return response()->json(['mensaje' => 'Historial de Homologacion insertado correctamente'], 201);
    }

    public function actualizarhistorialhomologacion(Request $request, $id)
    {
        DB::statement('CALL ActualizarHistorialHomologacion(?, ?, ?, ?, ?, ?)', [
            $id,
            $request->solicitud_id,
            $request->usuario_id,
            $request->estado,
            $request->observaciones,
            $request->ruta_pdf_resolucion
        ]);

        return response()->json(['mensaje' => 'Historial de Homologacion actualizado correctamente'], 200);
    }

    public function eliminarhistorialhomologacion($id)
    {
        DB::statement('CALL EliminarHistorialHomologacion(?)', [$id]);

        return response()->json(['mensaje' => 'Historial de Homologacion eliminado correctamente'], 200);
    }
}