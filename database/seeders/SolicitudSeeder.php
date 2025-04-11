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
            // id_usuario => ['finalizo_estudios', 'fecha_finalizacion_estudios', 'fecha_ultimo_semestre_cursado', 'estado']
            1 => ['No', null, '2023-12-01', 'Radicado'], // Aspirante nacional
            2 => ['No', null, '2023-06-15', 'En revisión'], // Aspirante extranjero
            3 => ['No', null, '2022-12-01', 'Radicado'], // Aspirante SENA
            4 => ['Si', '2023-05-30', null, 'En revisión'], // Aspirante universidad privada
            5 => ['Si', '2022-11-15', null, 'Radicado'], // Aspirante pública nacional
        ];

        foreach ($usuarios as $usuarioId => $data) {
            $radicado = 'SOL-' . Str::upper(Str::random(8));

            Solicitud::create([
                'usuario_id' => $usuarioId,
                'programa_destino_id' => 12, // Ingeniería de Software - Autónoma
                'finalizo_estudios' => $data[0],
                'fecha_finalizacion_estudios' => $data[1],
                'fecha_ultimo_semestre_cursado' => $data[2],
                'estado' => $data[3],
                'numero_radicado' => $radicado,
                'ruta_pdf_resolucion' => null,
            ]);

        }



    }

}
