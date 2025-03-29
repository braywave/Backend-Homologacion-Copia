<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Programa;

class ProgramasControllerApi extends Controller
{
    public function traerprogramas()
    {
        $programas = Programa::orderBy("nombre", "desc")->paginate(10);
        return response()->json($programas);
    }

    public function llevarprograma($id)
    {
        $programa = Programa::find($id);

        if ($programa) {
            return response()->json([
                'mensaje' => 'Programa encontrado',
                'datos' => $programa
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Programa no encontrado'
            ], 404);
        }
}
}