<?php

namespace Database\Seeders;

use App\Models\Solicitud;
use Illuminate\Support\Str;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SolicitudSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $usuarios = [
            1 => ['No', null, '2023-12-01', 'Radicado'],
            2 => ['No', null, '2023-06-15', 'En revisión'],
            3 => ['No', null, '2022-12-01', 'Radicado'],
            4 => ['Si', '2023-05-30', null, 'En revisión'],
            5 => ['Si', '2022-11-15', null, 'Aprobado'],
            6 => ['Si', '2022-10-10', null, 'Rechazado'],
        ];

        foreach ($usuarios as $usuarioId => $data) {
            // Verificar si ya existe una solicitud para este usuario
            if (Solicitud::where('usuario_id', $usuarioId)->exists()) {
                continue; // Saltar si ya tiene una solicitud
            }

            $year = now()->year;

            $ultimoRadicado = Solicitud::whereYear('created_at', $year)
                                        ->orderBy('id_solicitud', 'desc')
                                        ->first();

            $consecutivo = $ultimoRadicado ? (int) substr($ultimoRadicado->numero_radicado, -4) + 1 : 1;

            $radicado = "HOM-{$year}-" . str_pad($consecutivo, 4, '0', STR_PAD_LEFT);

            Solicitud::create([
                'usuario_id' => $usuarioId,
                'programa_destino_id' => 12,
                'finalizo_estudios' => $data[0],
                'fecha_finalizacion_estudios' => $data[1],
                'fecha_ultimo_semestre_cursado' => $data[2],
                'estado' => $data[3],
                'ruta_pdf_resolucion' => null,
                'numero_radicado' => $radicado,
            ]);
        }
    }

}
