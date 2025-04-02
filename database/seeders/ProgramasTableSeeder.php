<?php

namespace Database\Seeders;

use App\Models\Programa;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProgramasTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        Programa::create([
            'institucion_id' => 3,
            'facultad_id' => 1,
            'nombre' => 'Medicina',
            'codigo_snies' => '123456',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 2,
            'nombre' => 'Ingeniería de Desarrollo de Software',
            'codigo_snies' => '654321',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 3,
            'nombre' => 'Psicología',
            'codigo_snies' => '789012',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Virtual',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 4,
            'nombre' => 'Derecho',
            'codigo_snies' => '345678',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Híbrido',
        ]);

        Programa::create([
            'institucion_id' => 1,
            'facultad_id' => 5,
            'nombre' => 'Administración de Empresas',
            'codigo_snies' => '901234',
            'tipo_formacion' => 'Profesional',
            'metodologia' => 'Presencial',
        ]);
    }
}
