<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Asignatura;

class AsignaturasControllerApi extends Controller
{
    public function traerasignaturas(){
        $asinaturas = Asignatura::orderBy("nombre","desc")->get();
        return response()->json($asinaturas);

    }

    public function llevarasignatura($id){
        $asinatura = Asignatura::find($id);

        if($asinatura){
            return response()->json([
                'mensaje' => 'Asignatura Encontrada',
                'datos' => $asinatura
            ]);

        }
        else{
            return response()->json([
                'mensaje' => 'Asignatura no encontrada'
            ]);
        }

        
    }
}
