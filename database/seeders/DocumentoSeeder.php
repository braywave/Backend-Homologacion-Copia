<?php

namespace Database\Seeders;

use App\Models\Documento;
use App\Models\Documentos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DocumentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        Documento::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Certificado de Notas',
            'ruta' => 'ruta/a/tu/documento1.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Carta de Solicitud',
            'ruta' => 'ruta/a/tu/documento2.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 2,
            'usuario_id' => 2,
            'tipo' => 'Certificación de Finalización de Estudios',
            'ruta' => 'ruta/a/tu/documento3.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 3,
            'usuario_id' => 3,
            'tipo' => 'Copia del Pasaporte',
            'ruta' => 'ruta/a/tu/documento4.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Contenido Programático',
            'ruta' => 'ruta/a/tu/documento5.pdf',
        ]);
    }
}
