<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserControllerApi extends Controller
{
    // Método para obtener todos los usuarios
    public function traerUsuarios()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todos los usuarios
            $usuarios = DB::select('CALL ObtenerUsuarios()');
            return response()->json($usuarios);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener los usuarios',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener un usuario por ID
    public function llevarUsuario($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener un usuario por ID
            $usuario = DB::select('CALL ObtenerUsuarioPorId(?)', [$id]);

            if (!empty($usuario)) {
                return response()->json([
                    'mensaje' => 'Usuario encontrado',
                    'datos' => $usuario[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Usuario no encontrado',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener el usuario',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar un nuevo usuario
    public function insertarUsuario(Request $request)
    {
        try {
            // Generar hash para la contraseña si está presente
            $password = $request->password ? Hash::make($request->password) : null;

            // Llamada al procedimiento almacenado para insertar un nuevo usuario
            DB::statement('CALL InsertarUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
                $request->primer_nombre,
                $request->segundo_nombre,
                $request->primer_apellido,
                $request->segundo_apellido,
                $request->email, // Cambiado de correo a email
                $password,
                $request->tipo_identificacion,
                $request->numero_identificacion,
                $request->institucion_origen_id,
                $request->facultad_id,
                $request->telefono,
                $request->direccion,
                $request->pais_id,
                $request->departamento_id,
                $request->municipio_id,
                $request->rol_id ?? 1,
                $request->activo ?? true // Nuevo campo activo
            ]);

            return response()->json([
                'mensaje' => 'Usuario insertado correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar el usuario',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar un usuario
    public function actualizarUsuario(Request $request, $id)
    {
        try {
            // Generar hash para la contraseña si está presente
            $password = null;
            if ($request->has('password') && !empty($request->password)) {
                $password = Hash::make($request->password);
            }

            // Llamada al procedimiento almacenado para actualizar un usuario
            DB::statement('CALL ActualizarUsuario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
                $id,
                $request->primer_nombre,
                $request->segundo_nombre,
                $request->primer_apellido,
                $request->segundo_apellido,
                $request->email, // Cambiado de correo a email
                $password,
                $request->tipo_identificacion,
                $request->numero_identificacion,
                $request->institucion_origen_id,
                $request->facultad_id,
                $request->telefono,
                $request->direccion,
                $request->pais_id,
                $request->departamento_id,
                $request->municipio_id,
                $request->rol_id ?? 1,
                $request->activo ?? true // Nuevo campo activo
            ]);

            return response()->json([
                'mensaje' => 'Usuario actualizado correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar el usuario',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar un usuario
    public function eliminarUsuario($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar un usuario
            DB::statement('CALL EliminarUsuario(?)', [$id]);

            return response()->json([
                'mensaje' => 'Usuario eliminado correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar el usuario',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
