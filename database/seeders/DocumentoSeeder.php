<?php

namespace Database\Seeders;

use App\Models\Documento;
use Illuminate\Database\Seeder;

class DocumentoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        // Laura Martínez (usuario_id: 1, solicitud_id: 1)
        //
        Documento::create([
            'solicitud_id' => 1,
            'usuario_id'   => 1,
            'tipo'         => 'Certificado de Notas',
            'ruta'         => 'documentos/laura/certificado_notas_laura.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 1,
            'usuario_id'   => 1,
            'tipo'         => 'Carta de Solicitud',
            'ruta'         => 'documentos/laura/carta_solicitud_laura.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 1,
            'usuario_id'   => 1,
            'tipo'         => 'Certificación de Finalización de Estudios',
            'ruta'         => 'documentos/laura/finalizacion_estudios_laura.pdf',
        ]);

        //
        // Carlos López (usuario_id: 2, solicitud_id: 2)
        //
        Documento::create([
            'solicitud_id' => 2,
            'usuario_id'   => 2,
            'tipo'         => 'Documento de Identidad',
            'ruta'         => 'documentos/carlos/cedula_carlos.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 2,
            'usuario_id'   => 2,
            'tipo'         => 'Carta de Solicitud',
            'ruta'         => 'documentos/carlos/carta_solicitud_carlos.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 2,
            'usuario_id'   => 2,
            'tipo'         => 'Certificado de Notas',
            'ruta'         => 'documentos/carlos/certificado_notas_carlos.pdf',
        ]);

        //
        // Andrea Sánchez (usuario_id: 3, solicitud_id: 3)
        //
        Documento::create([
            'solicitud_id' => 3,
            'usuario_id'   => 3,
            'tipo'         => 'Contenido Programático',
            'ruta'         => 'documentos/andrea/contenido_programatico_andrea.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 3,
            'usuario_id'   => 3,
            'tipo'         => 'Certificado de Notas',
            'ruta'         => 'documentos/andrea/certificado_notas_andrea.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 3,
            'usuario_id'   => 3,
            'tipo'         => 'Carta de Solicitud',
            'ruta'         => 'documentos/andrea/carta_solicitud_andrea.pdf',
        ]);

        //
        // Luis Rodríguez (usuario_id: 4, solicitud_id: 4)
        //
        Documento::create([
            'solicitud_id' => 4,
            'usuario_id'   => 4,
            'tipo'         => 'Carta de Solicitud',
            'ruta'         => 'documentos/luis/carta_solicitud_luis.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 4,
            'usuario_id'   => 4,
            'tipo'         => 'Certificación de Finalización de Estudios',
            'ruta'         => 'documentos/luis/finalizacion_estudios_luis.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 4,
            'usuario_id'   => 4,
            'tipo'         => 'Documento de Identidad',
            'ruta'         => 'documentos/luis/cedula_luis.pdf',
        ]);

        //
        // Miguel Herrera (usuario_id: 5, solicitud_id: 5) — EXTRANJERO
        //
        Documento::create([
            'solicitud_id' => 5,
            'usuario_id'   => 5,
            'tipo'         => 'Copia del Pasaporte',
            'ruta'         => 'documentos/miguel/pasaporte_miguel.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 5,
            'usuario_id'   => 5,
            'tipo'         => 'Copia de la Visa',
            'ruta'         => 'documentos/miguel/visa_miguel.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 5,
            'usuario_id'   => 5,
            'tipo'         => 'Apostilla',
            'ruta'         => 'documentos/miguel/apostilla_miguel.pdf',
        ]);

        //
        // Juliana Patiño (usuario_id: 6, solicitud_id: 6)
        //
        Documento::create([
            'solicitud_id' => 6,
            'usuario_id'   => 6,
            'tipo'         => 'Certificación de Finalización de Estudios',
            'ruta'         => 'documentos/juliana/finalizacion_estudios_juliana.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 6,
            'usuario_id'   => 6,
            'tipo'         => 'Documento de Identidad',
            'ruta'         => 'documentos/juliana/cedula_juliana.pdf',
        ]);
        Documento::create([
            'solicitud_id' => 6,
            'usuario_id'   => 6,
            'tipo'         => 'Carta de Solicitud',
            'ruta'         => 'documentos/juliana/carta_solicitud_juliana.pdf',
        ]);

    }
}
