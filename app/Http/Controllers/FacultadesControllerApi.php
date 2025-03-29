<?php

namespace App\Http\Controllers;

use App\Models\Facultades;
use Illuminate\Http\Request;

class FacultadesControllerApi extends Controller
{
    public function traerfacultades()
    {
        $facultades = Facultades::orderBy("nombre", "desc")->get();
        return response()->json($facultades);
    }

    public function llevarfacultad($id){
        $facultad = Facultades::find($id);

        if ($facultad) {
            return response()->json([
                'mensaje' => 'Facultades encontradas',
                'datos' => $facultad
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Facultad no encontrada',
            ], 404);
        }
    } 
}
