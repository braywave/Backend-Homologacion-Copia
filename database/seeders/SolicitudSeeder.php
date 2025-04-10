<?php

namespace Database\Seeders;

use App\Models\Solicitud;
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
            'usuario_id' => 5, // Andrea - FUP
            'programa_destino_id' => 1,
            'finalizo_estudios' => 'Sí',
            'fecha_finalizacion_estudios' => '2023-12-15',
            'estado' => 'En revisión',
            'numero_radicado' => 'SOL-2025001',
        ]);

        Solicitud::create([
            'usuario_id' => 3, // Daniela - Colegio Mayor
            'programa_destino_id' => 2,
            'finalizo_estudios' => 'No',
            'fecha_ultimo_semestre_cursado' => '2024-11-01',
            'estado' => 'En revisión',
            'numero_radicado' => 'SOL-2025002',
        ]);

        Solicitud::create([
            'usuario_id' => 4, // Esteban - SENA
            'programa_destino_id' => 3,
            'finalizo_estudios' => 'No',
            'fecha_ultimo_semestre_cursado' => '2024-10-30',
            'estado' => 'Radicado',
            'numero_radicado' => 'SOL-2025003',
        ]);

        Solicitud::create([
            'usuario_id' => 8, // Felipe - Unicauca
            'programa_destino_id' => 4,
            'finalizo_estudios' => 'Sí',
            'fecha_finalizacion_estudios' => '2022-06-30',
            'estado' => 'Radicado',
            'numero_radicado' => 'SOL-2025004',
        ]);

        Solicitud::create([
            'usuario_id' => 2, // Julián - Comfacauca
            'programa_destino_id' => 5,
            'finalizo_estudios' => 'No',
            'fecha_ultimo_semestre_cursado' => '2024-05-15',
            'estado' => 'Radicado',
            'numero_radicado' => 'SOL-2025005',
        ]);

        Solicitud::create([
            'usuario_id' => 7, // Natalia - Autónoma del Cauca
            'programa_destino_id' => 6,
            'finalizo_estudios' => 'No',
            'fecha_ultimo_semestre_cursado' => '2024-12-20',
            'estado' => 'Radicado',
            'numero_radicado' => 'SOL-2025006',
        ]);

        Solicitud::create([
            'usuario_id' => 1, // Sofía - Unicauca
            'programa_destino_id' => 7,
            'finalizo_estudios' => 'Sí',
            'fecha_finalizacion_estudios' => '2023-07-01',
            'estado' => 'Cerrado',
            'numero_radicado' => 'SOL-2025007',
        ]);

        Solicitud::create([
            'usuario_id' => 6, // Thiago - Extranjero
            'programa_destino_id' => 8,
            'finalizo_estudios' => 'No',
            'fecha_ultimo_semestre_cursado' => '2024-11-15',
            'estado' => 'Radicado',
            'numero_radicado' => 'SOL-2025008',
        ]);

    }
}
