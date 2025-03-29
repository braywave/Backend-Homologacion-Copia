<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Institucion;

class InstitucionesControllerApi extends Controller
{
    public function traerinstituciones(){
        $instituciones = Institucion::orderBy("nombre","desc")->get();
        return response()->json($instituciones);

    }
    public function llevarinstitucion($id){
        $institucion = Institucion::find($id);

        if($institucion){
            return response()->json([
                'mensaje' => 'Institucion encontrada',
                'datos' => $institucion
            ]);
        }
        else{
            return response()->json([
                'mensaje' => 'Institucion no encontrada' 
            ]);

        }

    }
}
