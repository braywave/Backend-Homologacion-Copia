<?php

namespace App\Http\Controllers;

use App\Models\Departamento;
use Illuminate\Http\Request;

class DepartamentoControllerApi extends Controller
{
    public function traerdepartamentos()
    {
        $departamentos = Departamento::orderBy("nombre", "desc")->get();
        return response()->json($departamentos);
    }

    public function llevardepartamento($id){
        $departamento = Departamento::find($id);

        if ($departamento) {
            return response()->json([
                'mensaje' => 'Departamento encontrado',
                'datos' => $departamento
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Departamento no encontrado',
            ], 404);
        }
    }
}
