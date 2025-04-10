<?php

namespace Database\Seeders;

use App\Models\Solicitud;
use App\Models\Solicitudes;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SolicitudSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Solicitud::create([
            'usuario_id' => 1,
            'programa_destino_id' => 1,
            'finalizo_estudios' => 'Si',
            'fecha_finalizacion_estudios' => '2023-06-15',
            'fecha_ultimo_semestre_cursado' => '2023-05-15',
            'estado' => 'Aprobado',
            'numero_radicado' => 'HOM-2025-01',
            'ruta_pdf_resolucion' => 'ruta/a/tu/documento1.pdf',
        ]);

        Solicitud::create([
            'usuario_id' => 2,
            'programa_destino_id' => 2,
            'finalizo_estudios' => 'No',
            'fecha_finalizacion_estudios' => null,
            'fecha_ultimo_semestre_cursado' => '2023-05-15',
            'estado' => 'En revisión',
            'numero_radicado' => 'HOM-2025-02',
            'ruta_pdf_resolucion' => null,
        ]);

        Solicitud::create([
            'usuario_id' => 3,
            'programa_destino_id' => 1,
            'finalizo_estudios' => 'No',
            'fecha_finalizacion_estudios' => null,
            'fecha_ultimo_semestre_cursado' => '2023-04-15',
            'estado' => 'Radicado',
            'numero_radicado' => 'HOM-2025-03',
            'ruta_pdf_resolucion' => null,
        ]);
    }
}
