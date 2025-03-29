<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Usuario;
class UsuariosControllerApi extends Controller
{
    public function traerUsuarios(){
        $usuarios = Usuario::orderBy("id_usuario","desc")->get();
        return response()->json(($usuarios));

    }

    public function llevarUsuario($id){

        $usuario = Usuario::find($id);

        if($usuario){
            return response()->json([
                'mensaje'=> 'Usuarios Econtrados',
                'datos'=> $usuario
            ]);

        }
        else{
            return response()->json([
                'mensaje'=> 'Usuario no econtrado',
                
            ]);


        }
        
    }
}
