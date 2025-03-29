<?php

namespace App\Http\Controllers;

use App\Models\ContenidosProgramaticos;
use Illuminate\Http\Request;

class ContenidosProgramaticosControllerApi extends Controller
{
    public function traercontenidosP(){
        $contenidosP = ContenidosProgramaticos::orderBy("id_contenido","asc")->get();
        return response()->json($contenidosP);

    }

    public function llevarcontenidoP($id){
        $contenidoP = ContenidosProgramaticos::find($id);

        if($contenidoP){
            return response()->json([
                'mensaje' => 'Asignatura Encontrada',
                'datos' => $contenidoP
            ]);

        }
        else{
            return response()->json([
                'mensaje' => 'Asignatura no encontrada'
            ]);
        }
        
    }
}
