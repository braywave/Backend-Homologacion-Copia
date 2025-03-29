<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Municipio;

class MunicipiosControllerApi extends Controller
{
    public function traermunicipios()
    {
        $municipios = Municipio::orderBy("nombre", "desc")->get();
        return response()->json($municipios);
    }

    public function llevarmunicipio($id)
    {
        $municipio = Municipio::find($id);

        if ($municipio) {
            return response()->json([
                'mensaje' => 'Municipio encontrado',
                'datos' => $municipio
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Municipio no encontrado'
            ], 404);
        }
    }
}
