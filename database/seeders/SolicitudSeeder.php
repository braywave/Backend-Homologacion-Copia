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
            5 => ['Si', '2022-11-15', null, 'Aprobado'], // Aspirante pública nacional (Aprobado)
            6 => ['Si', '2022-10-10', null, 'Rechazado'], // Aspirante público rechazado (Rechazado)
        ];

        foreach ($usuarios as $usuarioId => $data) {
            // Obtener el año actual
            $year = now()->year;

            // Obtener el último radicado para el mismo año
            $ultimoRadicado = Solicitud::whereYear('created_at', $year)
                                      ->orderBy('id_solicitud', 'desc') // Ordenar por ID de solicitud
                                      ->first();

            // Obtener el número consecutivo (el último + 1 o 1 si no hay solicitudes)
            $consecutivo = $ultimoRadicado ? (int) substr($ultimoRadicado->numero_radicado, -4) + 1 : 1;

            // Generar el radicado en el formato HOM-AÑO-NUMERO
            $radicado = "HOM-{$year}-" . str_pad($consecutivo, 4, '0', STR_PAD_LEFT);

            // Crear la solicitud
            Solicitud::create([
                'usuario_id' => $usuarioId,
                'programa_destino_id' => 12, // Ingeniería de Software - Autónoma
                'finalizo_estudios' => $data[0],
                'fecha_finalizacion_estudios' => $data[1],
                'fecha_ultimo_semestre_cursado' => $data[2],
                'estado' => $data[3],
                'ruta_pdf_resolucion' => null,
                'numero_radicado' => $radicado, // Asignar el radicado generado
            ]);
        }
    }
}
