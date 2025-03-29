<?php

namespace Database\Seeders;

use App\Models\Documentos;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DocumentosTableSeedar extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Documentos::create([
            'nombre' => 'Certificado_Notas',
            'url' => 'https://documentos/fawgasfa...'
        ]);

        Documentos::create([
            'nombre' => 'Documento_Identidad',
            'url' => 'https://documentos/fjenaicjabsuiva...'
        ]);

        Documentos::create([
            'nombre' => 'Certificado_Estudios',
            'url' => 'https://documentos/fanwinauwn...'
        ]);

        Documentos::create([
            'nombre' => 'Carta_Homologacion',
            'url' => 'https://documentos/cjkansvjnuevna...'
        ]);

        Documentos::create([
            'nombre' => 'Certificado_Notas',
            'url' => 'https://documentos/wriyaubcajsnv...'
        ]);
    }
}
