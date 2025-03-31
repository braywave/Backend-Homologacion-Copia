<?php

namespace App\Http\Controllers;

use App\Models\SolicitudAsignaturas;
use Illuminate\Http\Request;

class SolicitudAsignaturasControllerApi extends Controller
{
    public function traersolicitudasignaturas()
    {
        $solicitudAsignaturas = SolicitudAsignaturas::orderBy("id_solicitud_asignatura", "desc")->get();
        return response()->json($solicitudAsignaturas);
    }

    public function llevarsolicitudasignatura($id){
        $solicitudAsignatura = SolicitudAsignaturas::find($id);

        if ($solicitudAsignatura) {
            return response()->json([
                'mensaje' => 'Solicitud de Asignatura encontrada',
                'datos' => $solicitudAsignatura
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Solicitud de Asignatura no encontrada',
            ], 404);
        }
    }
}
