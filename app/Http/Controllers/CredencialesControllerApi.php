<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CredencialesControllerApi extends Controller
{
    // Método para obtener todas las credenciales
    public function traercredenciales()
    {
        try {
            // Llamada al procedimiento almacenado para obtener todas las credenciales
            $credenciales = DB::select('CALL ObtenerCredenciales()');
            return response()->json($credenciales);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener las credenciales',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para obtener una credencial por ID
    public function llevarcredencial($id)
    {
        try {
            // Llamada al procedimiento almacenado para obtener una credencial por ID
            $credencial = DB::select('CALL ObtenerCredencialPorId(?)', [$id]);

            if (!empty($credencial)) {
                return response()->json([
                    'mensaje' => 'Credencial encontrada',
                    'datos' => $credencial[0] // Accedemos al primer resultado
                ], 200);
            } else {
                return response()->json([
                    'mensaje' => 'Credencial no encontrada',
                ], 404);
            }
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al obtener la credencial',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para insertar una nueva credencial
    public function insertarcredencial(Request $request)
    {
        try {
            // Llamada al procedimiento almacenado para insertar una nueva credencial
            DB::statement('CALL InsertarCredencial(?, ?)', [
                $request->usuario_id,
                $request->contraseña
            ]);

            return response()->json([
                'mensaje' => 'Credencial insertada correctamente'
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al insertar la credencial',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para actualizar una credencial
    public function actualizarcredencial(Request $request, $id)
    {
        try {
            // Llamada al procedimiento almacenado para actualizar una credencial
            DB::statement('CALL ActualizarCredencial(?, ?, ?)', [
                $id,
                $request->usuario_id,
                $request->contraseña
            ]);

            return response()->json([
                'mensaje' => 'Credencial actualizada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al actualizar la credencial',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Método para eliminar una credencial
    public function eliminarcredencial($id)
    {
        try {
            // Llamada al procedimiento almacenado para eliminar una credencial
            DB::statement('CALL EliminarCredencial(?)', [$id]);

            return response()->json([
                'mensaje' => 'Credencial eliminada correctamente'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'mensaje' => 'Error al eliminar la credencial',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}