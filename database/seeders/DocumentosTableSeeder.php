<?php

namespace Database\Seeders;

use App\Models\Documentos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DocumentosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {



        Documentos::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Certificado de Notas',
            'ruta' => 'ruta/a/tu/documento1.pdf',
        ]);

        Documentos::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Carta de Solicitud',
            'ruta' => 'ruta/a/tu/documento2.pdf',
        ]);

        Documentos::create([
            'solicitud_id' => 2, // ID de la solicitud
            'usuario_id' => 2, // ID del usuario
            'tipo' => 'Certificación de Finalización de Estudios',
            'ruta' => 'ruta/a/tu/documento3.pdf',
        ]);

        Documentos::create([
            'solicitud_id' => 3, // ID de la solicitud
            'usuario_id' => 3, // ID del usuario
            'tipo' => 'Copia del Pasaporte',
            'ruta' => 'ruta/a/tu/documento4.pdf',
        ]);

        Documentos::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Contenido Programático',
            'ruta' => 'ruta/a/tu/documento5.pdf',
        ]);
    }
}
