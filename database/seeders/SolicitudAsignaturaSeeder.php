<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Solicitud;
use App\Models\Asignatura;
use App\Models\SolicitudAsignatura;

class SolicitudAsignaturaSeeder extends Seeder
{
    public function run(): void
    {
        // Obtener las solicitudes recién creadas
        $solicitudes = Solicitud::all()->keyBy('usuario_id');

        // Vincular asignaturas realistas según cada institución
        $mapa = [
            // usuario_id => [array de códigos de asignaturas origen]
            1 => ['FUP001', 'FUP002'],       // Laura (Autónoma del Cauca)
            2 => ['CM001', 'CM002'],         // Carlos (FUP)
            3 => ['SENA001', 'SENA002'],     // Andrea (Colegio Mayor)
            4 => ['CM001', 'FUP002'],        // Luis (Unicauca)
            5 => ['FUP001', 'CM002'],        // Miguel (extranjero)
            6 => ['SENA001', 'SENA002'],     // Juliana (SENA)
        ];

        foreach ($mapa as $usuarioId => $codigos) {
            $solicitudId = $solicitudes[$usuarioId]->id_solicitud;

            foreach ($codigos as $codigo) {
                $asignatura = Asignatura::where('codigo_asignatura', $codigo)->first();

                if (!$asignatura) continue;

                // SENA tiene programas_id == 3
                $esSena = $asignatura->programas_id === 3;

                SolicitudAsignatura::create([
                    'solicitud_id' => $solicitudId,
                    'asignatura_id' => $asignatura->id_asignatura,
                    'nota_origen' => $esSena ? null : number_format(rand(30, 50) / 10, 1), // nota entre 3.0 y 5.0 con 1 decimal
                    'horas_sena' => $esSena ? rand(40, 120) : null, // horas realistas si es SENA
                ]);
            }
        }
    }
}
