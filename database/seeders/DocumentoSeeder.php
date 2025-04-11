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



        // Laura Martínez (usuario_id: 1, solicitud_id: 1)
        Documento::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Certificado de Notas',
            'ruta' => 'documentos/certificado_notas_laura.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 1,
            'usuario_id' => 1,
            'tipo' => 'Carta de Solicitud',
            'ruta' => 'documentos/carta_laura.pdf',
        ]);

        // Carlos López (usuario_id: 2, solicitud_id: 2)
        Documento::create([
            'solicitud_id' => 2,
            'usuario_id' => 2,
            'tipo' => 'Documento de Identidad',
            'ruta' => 'documentos/cedula_carlos.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 2,
            'usuario_id' => 2,
            'tipo' => 'Carta de Solicitud',
            'ruta' => 'documentos/carta_carlos.pdf',
        ]);

        // Andrea Sánchez (usuario_id: 3, solicitud_id: 3)
        Documento::create([
            'solicitud_id' => 3,
            'usuario_id' => 3,
            'tipo' => 'Contenido Programático',
            'ruta' => 'documentos/contenido_andrea.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 3,
            'usuario_id' => 3,
            'tipo' => 'Certificado de Notas',
            'ruta' => 'documentos/certificado_notas_andrea.pdf',
        ]);

        // Luis Rodríguez (usuario_id: 4, solicitud_id: 4)
        Documento::create([
            'solicitud_id' => 4,
            'usuario_id' => 4,
            'tipo' => 'Carta de Solicitud',
            'ruta' => 'documentos/carta_luis.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 4,
            'usuario_id' => 4,
            'tipo' => 'Certificación de Finalización de Estudios',
            'ruta' => 'documentos/finalizacion_luis.pdf',
        ]);

        // Miguel Herrera (usuario_id: 5, solicitud_id: 5) — EXTRANJERO
        Documento::create([
            'solicitud_id' => 5,
            'usuario_id' => 5,
            'tipo' => 'Copia del Pasaporte',
            'ruta' => 'documentos/pasaporte_miguel.pdf',
        ]);

        Documento::create([
            'solicitud_id' => 5,
            'usuario_id' => 5,
            'tipo' => 'Copia de la Visa',
            'ruta' => 'documentos/visa_miguel.pdf',
        ]);
    }
}
