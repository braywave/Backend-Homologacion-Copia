<?php

namespace Database\Seeders;

use App\Models\HistorialHomologaciones;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HistorialHomologacionesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        HistorialHomologaciones::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'estado' => 'Radicado',
            'observaciones' => 'Solicitud recibida y en espera de revisión.',
            'ruta_pdf_resolucion' => null,
        ]);

        HistorialHomologaciones::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'estado' => 'En revisión',
            'observaciones' => 'La solicitud está siendo evaluada por el comité.',
            'ruta_pdf_resolucion' => null,
        ]);

        HistorialHomologaciones::create([
            'solicitud_id' => 2,
            'usuario_id' => 2,
            'estado' => 'Aprobado',
            'observaciones' => 'La solicitud ha sido aprobada.',
            'ruta_pdf_resolucion' => 'ruta/a/tu/resolucion1.pdf',
        ]);

        HistorialHomologaciones::create([
            'solicitud_id' => 3, 
            'usuario_id' => 3,
            'estado' => 'Rechazado',
            'observaciones' => 'La solicitud fue rechazada por falta de documentos.',
            'ruta_pdf_resolucion' => null,
        ]);
    }
}
