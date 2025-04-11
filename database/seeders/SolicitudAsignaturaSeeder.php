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
            1 => ['FUP001', 'FUP002'],       // FUP
            2 => ['CM001', 'CM002'],         // Colegio Mayor (extranjero)
            3 => ['SENA001', 'SENA002'],     // SENA
            4 => ['CM001', 'FUP002'],        // Universidad privada combinada
            5 => ['FUP001', 'CM002'],        // Pública nacional combinada
        ];

        foreach ($mapa as $usuarioId => $codigos) {
            $solicitudId = $solicitudes[$usuarioId]->id_solicitud;

            foreach ($codigos as $codigo) {
                $asignatura = Asignatura::where('codigo_asignatura', $codigo)->first();

                if (!$asignatura) continue;

                SolicitudAsignatura::create([
                    'solicitud_id' => $solicitudId,
                    'asignatura_id' => $asignatura->id_asignatura,
                    'nota_origen' => $asignatura->programas_id == 3 ? null : rand(30, 50) / 10, // Solo si no es SENA
                    'horas_sena' => $asignatura->programas_id == 3 ? $asignatura->horas_sena : null,
                ]);
            }
        }
    }
}
