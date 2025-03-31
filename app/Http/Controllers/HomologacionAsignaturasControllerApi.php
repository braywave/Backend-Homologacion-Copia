<?php

namespace App\Http\Controllers;

use App\Models\HomologacionAsignaturas;
use Illuminate\Http\Request;

class HomologacionAsignaturasControllerApi extends Controller
{
    public function traerhomologacionasignaturas()
    {
        $homologacionAsignaturas = HomologacionAsignaturas::orderBy("id_homologacion", "desc")->get();
        return response()->json($homologacionAsignaturas);
    }

    public function llevarhomologacionasignatura($id){
        $homologacionAsignatura = HomologacionAsignaturas::find($id);

        if ($homologacionAsignatura) {
            return response()->json([
                'mensaje' => 'Homologacion de Asignatura encontrada',
                'datos' => $homologacionAsignatura
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Homologacion de Asignatura no encontrada',
            ], 404);
        }
    } 
}
