<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Solicitudes;

class SolicitudesControllerApi extends Controller
{
    public function traersolicitudes()
    {
        $solicitudes = Solicitudes::orderBy("codigo", "desc")->get();
        return response()->json($solicitudes);
    }

    public function llevarsolicitud($id)
    {
        $solicitud = Solicitudes::find($id);

        if ($solicitud) {
            return response()->json([
                'mensaje' => 'Solicitud encontrada',
                'datos' => $solicitud


            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Solicitud no encontrada'
            ], 404);
        }
    }
}
