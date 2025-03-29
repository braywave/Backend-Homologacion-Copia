<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Credenciales;
class CredencialesControllerApi extends Controller
{
    public function traercredenciales() {
        $credenciales = Credenciales::orderBy("correo","desc")->get();
        return response()->json($credenciales);

    }

    public function llevarcredencial($id) {
        $credencial = Credenciales::find($id);

        if($credencial){
            return response()->json([
                'mensaje' => 'Credenciales encontradas',
                'datos' => $credencial
            ], 200);
        }
        else {
            return response()->json([
                'mensaje' => 'Credenciales no Encontradas'
            ], 404);
        }


    }
}
