<?php

namespace App\Http\Controllers;

use App\Models\HistorialHomologaciones;
use Illuminate\Http\Request;

class HistorialHomologacionesControllerApi extends Controller
{
    public function traerhistorialhomologaciones()
    {
        $historialHomologaciones = HistorialHomologaciones::orderBy("id_historial", "desc")->get();
        return response()->json($historialHomologaciones);
    }

    public function llevarhistorialhomologacion($id){
        $HistorialHomologacion = HistorialHomologaciones::find($id);

        if ($HistorialHomologacion) {
            return response()->json([
                'mensaje' => 'Historial de Homologaciones encontrados',
                'datos' => $HistorialHomologacion
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Historial de Homologacion no encontrado',
            ], 404);
        }
    } 
}
