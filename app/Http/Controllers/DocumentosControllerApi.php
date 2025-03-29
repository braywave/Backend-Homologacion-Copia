<?php

namespace App\Http\Controllers;

use App\Models\Documentos;
use Illuminate\Http\Request;

class DocumentosControllerApi extends Controller
{
    public function traerdocumentos()
    {
        $documentos = Documentos::orderBy("nombre", "desc")->get();
        return response()->json($documentos);
    }

    public function llevardocumento($id){
        $documento = Documentos::find($id);

        if ($documento) {
            return response()->json([
                'mensaje' => 'Documento encontrado',
                'datos' => $documento
            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Documento no encontrado',
            ], 404);
        }
    } 
}
