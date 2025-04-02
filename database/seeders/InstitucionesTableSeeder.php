<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Institucion;

class InstitucionesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Corporación Universitaria Autónoma del Cauca',
            'codigo_ies' => '2849',
            'tipo' => 'Universidad',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Servicio Nacional de Aprendizaje (SENA)',
            'codigo_ies' => null,
            'tipo' => 'SENA',
        ]);

        Institucion::create([
            'municipio_id' => 703,
            'nombre' => 'Universidad del Cauca',
            'codigo_ies' => '1110',
            'tipo' => 'Universidad',
        ]);
    }
}
