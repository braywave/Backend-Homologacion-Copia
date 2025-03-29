<?php

namespace App\Http\Controllers;

use App\Models\pais;
use Illuminate\Http\Request;

class PaisControllerApi extends Controller
{
    Public function traerpaises() {
        $paises = pais::orderBy("nombre","desc")->get();
        return response()->json($paises);
    }

    public function llevarpais($id) {
        $pais = pais::find($id);

        if($pais){
            return response()->json([
                'mensaje' => 'Pais Valido',
                'datos' => $pais
            ], 200);

        }
        else{
            return response()->json([
                'mensaje' => 'Pais no fue Encontrado'
            ], 404);
        }
    
    }

}
