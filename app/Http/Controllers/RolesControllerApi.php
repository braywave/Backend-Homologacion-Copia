<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Roles;

class RolesControllerApi extends Controller
{
    public function traerroles()
    {
        $roles = Roles::orderBy("nombre", "desc")->get();
        return response()->json($roles);
    }

    public function llevarrol($id)
    {
        $rol = Roles::find($id);

        if ($rol) {
            return response()->json([
                'mensaje' => 'Roles encontrados',
                'datos' => $rol


            ], 200);
        } else {
            return response()->json([
                'mensaje' => 'Rol no encontrado'
            ], 404);
        }
    }
}
